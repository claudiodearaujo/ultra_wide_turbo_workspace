#!/bin/bash

# add_make_issue_brick.sh
#
# Este script adiciona o brick de issues globalmente à sua instalação do Mason.
# É necessário executar este script antes de poder criar novas issues usando 'mason make issue'.
#
# O script irá:
# 1. Navegar até o diretório _mason
# 2. Verificar se o brick de issues já está instalado
# 3. Adicionar o brick globalmente se não estiver presente
# 4. Fornecer feedback sobre o processo
#
# Uso: ./scripts/add_make_issue_brick.sh

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

# Armazena diretório atual
CURRENT_DIR=$(pwd)

print_step "🔍 Preparando para adicionar brick de issues..."

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

# Verifica se o brick de issues existe localmente
if [ ! -d "issue" ]; then
    print_error "❌ Brick de issues não encontrado em _mason/issue"
    exit 1
fi

if [ ! -f "issue/brick.yaml" ]; then
    print_error "❌ Configuração do brick de issues não encontrada em _mason/issue/brick.yaml"
    exit 1
fi

if [ ! -d "issue/__brick__" ]; then
    print_error "❌ Template do brick de issues não encontrado em _mason/issue/__brick__"
    exit 1
fi

# Verifica se o brick já está adicionado
if mason list | grep -q "issue"; then
    print_success "✅ Brick de issues já está adicionado globalmente"
else
    # Adiciona brick globalmente do caminho local
    print_step "📦 Adicionando brick de issues globalmente do caminho local..."
    if mason add issue --path "issue" -g; then
        print_success "✅ Brick de issues adicionado globalmente com sucesso"
    else
        print_error "❌ Falha ao adicionar brick de issues"
        cd "$CURRENT_DIR" || exit 1
        exit 1
    fi
fi

# Retorna ao diretório original
cd "$CURRENT_DIR" || exit 1

print_success "🎉 Configuração completa! Agora você pode criar issues usando:"
echo "    mason make issue" 