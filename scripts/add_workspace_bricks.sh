#!/bin/bash

# add_workspace_bricks.sh
#
# Este script adiciona globalmente todos os bricks Mason no workspace à sua instalação do Mason.
# Ele irá escanear o diretório _mason procurando por bricks válidos (que contenham brick.yaml) e adicionar cada um.
#
# O script irá:
# 1. Navegar até o diretório _mason
# 2. Encontrar todos os arquivos brick.yaml (incluindo nível raiz)
# 3. Adicionar cada brick correspondente globalmente
# 4. Acompanhar o progresso e fornecer feedback
#
# Uso: ./scripts/add_workspace_bricks.sh

# Imprime com emoji e cor
print_step() {
    echo -e "\033[1;34m$1\033[0m"
}

print_success() {
    echo -e "\033[1;32m$1\033[0m"
}

print_error() {
    echo -e "\033[1;31m$1\033[0m"
}

print_warning() {
    echo -e "\033[1;33m$1\033[0m"
}

# Obtém nome do brick do brick.yaml
get_brick_name() {
    local brick_yaml="$1"
    if [ -f "$brick_yaml" ]; then
        # Extrai campo name do brick.yaml, tratando possíveis aspas
        local name=$(grep "^name:" "$brick_yaml" | sed 's/^name:[[:space:]]*//;s/^"\(.*\)"$/\1/;s/^'"'"'\(.*\)'"'"'$/\1/')
        echo "$name"
    fi
}

# Verifica se o brick já está instalado
is_brick_installed() {
    local brick_name="$1"
    mason list 2>/dev/null | grep -q "^$brick_name\$"
    return $?
}

# Obtém lista de bricks instalados
get_installed_bricks() {
    mason list 2>/dev/null | grep -v "^$" | grep -v "^[[:space:]]*└──" | grep -v "^/" | sort -u
}

# Adiciona brick com confirmação automática
add_brick() {
    local brick_name="$1"
    local brick_path="$2"
    # Primeiro remove o brick se ele existir
    mason remove "$brick_name" -g >/dev/null 2>&1
    # Então adiciona novo usando --path consistentemente
    mason add "$brick_name" --path "$brick_path" -g >/dev/null 2>&1
    return $?
}

# Verifica se esta é uma diferença conhecida entre diretório/nome do brick
is_known_name_difference() {
    local dir_name="$1"
    local brick_name="$2"
    if [ "$dir_name" = "code-of-conduct" ] && [ "$brick_name" = "cocs" ]; then
        return 0
    fi
    if [ "$dir_name" = "_mason" ] && [ "$brick_name" = "workspace" ]; then
        return 0
    fi
    return 1
}

# Armazena diretório atual
CURRENT_DIR=$(pwd)

# Inicializa contadores e arrays
total_bricks=0
successful_bricks=0
failed_bricks=0
added_bricks=()

print_step "🔍 Preparando para adicionar bricks do workspace..."

# Navega até o diretório _mason
cd "$(dirname "$0")/../_mason" || {
    print_error "❌ Falha ao navegar até o diretório _mason"
    exit 1
}

# Verifica se o mason está instalado
if ! command -v mason &> /dev/null; then
    print_error "❌ Mason CLI não está instalado. Por favor, instale primeiro:"
    print_error "  dart pub global activate mason_cli"
    exit 1
fi

# Processa brick do nível raiz primeiro
if [ -f "brick.yaml" ]; then
    ((total_bricks++))
    root_brick_name=$(get_brick_name "brick.yaml")
    if [ -n "$root_brick_name" ]; then
        print_step "📦 Processando brick raiz: $root_brick_name"
        
        if [ ! -d "__brick__" ]; then
            print_error "  ❌ Estrutura de brick inválida: diretório __brick__ ausente"
            ((failed_bricks++))
        else
            if is_brick_installed "$root_brick_name"; then
                print_warning "  ⚠️  Brick '$root_brick_name' já está adicionado globalmente"
                added_bricks+=("$root_brick_name")
                ((successful_bricks++))
            else
                if add_brick "$root_brick_name" "."; then
                    print_success "  ✅ Brick '$root_brick_name' adicionado com sucesso"
                    added_bricks+=("$root_brick_name")
                    ((successful_bricks++))
                else
                    print_error "  ❌ Falha ao adicionar brick '$root_brick_name'"
                    ((failed_bricks++))
                fi
            fi
        fi
    fi
fi

# Encontra todos os arquivos brick.yaml em subdiretórios, excluindo diretório .mason
brick_files=$(find . -mindepth 2 -name "brick.yaml" -not -path "./.mason/*" -not -path "./mason-lock.json" -not -path "./mason.yaml")

if [ -z "$brick_files" ] && [ ${#added_bricks[@]} -eq 0 ]; then
    print_error "❌ Nenhum arquivo brick.yaml encontrado no workspace"
    exit 1
fi

# Converte arquivos brick para array e atualiza total
IFS=$'\n' read -r -d '' -a brick_array <<< "$brick_files"
total_bricks=$((total_bricks + ${#brick_array[@]}))

print_step "📦 Encontrado(s) $total_bricks brick(s) para processar..."

# Processa cada brick nos subdiretórios
for index in "${!brick_array[@]}"; do
    brick_file="${brick_array[$index]}"
    brick_dir=$(dirname "$brick_file")
    dir_name=$(basename "$brick_dir")
    current_number=$((index + 2))  # +2 porque o brick raiz foi primeiro

    # Obtém nome do brick do brick.yaml
    brick_name=$(get_brick_name "$brick_file")
    if [ -z "$brick_name" ]; then
        print_error "  ❌ Não foi possível determinar nome do brick de $brick_file"
        ((failed_bricks++))
        continue
    fi

    print_step "📦 Processando brick ($current_number/$total_bricks): $brick_name"

    # Verifica estrutura do brick
    if [ ! -d "$brick_dir/__brick__" ]; then
        print_error "  ❌ Estrutura de brick inválida: diretório __brick__ ausente"
        ((failed_bricks++))
        continue
    fi

    # Verifica se nome do brick corresponde ao nome do diretório ou se é uma diferença conhecida
    if [ "$dir_name" != "$brick_name" ]; then
        if is_known_name_difference "$dir_name" "$brick_name"; then
            print_step "  ℹ️  Usando nome de brick '$brick_name' para diretório '$dir_name' (configuração conhecida)"
        else
            print_warning "  ⚠️  Nome do diretório '$dir_name' difere do nome do brick '$brick_name'"
        fi
    fi

    # Verifica se o brick já está adicionado
    if is_brick_installed "$brick_name"; then
        print_warning "  ⚠️  Brick '$brick_name' já está adicionado globalmente"
        ((successful_bricks++))
        added_bricks+=("$brick_name")
        continue
    fi

    # Adiciona brick globalmente do caminho local
    if add_brick "$brick_name" "$brick_dir"; then
        print_success "  ✅ Brick '$brick_name' adicionado com sucesso"
        ((successful_bricks++))
        added_bricks+=("$brick_name")
    else
        print_error "  ❌ Falha ao adicionar brick '$brick_name'"
        ((failed_bricks++))
    fi
done

# Retorna ao diretório original
cd "$CURRENT_DIR" || exit 1

# Imprime resumo
echo
print_step "📊 Resumo:"
print_success "✅ Processado(s) com sucesso: $successful_bricks brick(s)"
if [ $failed_bricks -gt 0 ]; then
    print_error "❌ Falha ao processar: $failed_bricks brick(s)"
fi

if [ $successful_bricks -gt 0 ]; then
    print_success "🎉 Agora você pode usar seus bricks com: mason make <brick-name>"
    echo "    Bricks disponíveis:"
    for brick in "${added_bricks[@]}"; do
        echo "    - mason make $brick"
    done
fi

# Sai com erro se algum brick falhou
[ $failed_bricks -eq 0 ] || exit 1 