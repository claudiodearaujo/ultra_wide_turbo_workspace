#!/bin/bash

# Caminhos de documentação para sincronização entre fonte e mason bricks
# Isso permite que a pasta docs seja sincronizada do projeto raiz para os mason bricks
# ao gerar novos projetos, garantindo que a documentação seja copiada adequadamente
docs_paths=(
    "../docs"  # Caminho fonte relativo à localização do script
)

# Caminhos de destino na estrutura do mason brick onde os docs serão copiados
# A variável {{name}} será substituída pelo nome real do projeto durante a geração
docs_target_paths=(
    "../_mason/docs/__brick__/{{name}}/docs"  # Caminho de destino no mason brick
)

# Array de caminhos fonte
source_paths=(
# CORE ------------------------------------------------------------
    "../apis"
    "../code-of-conduct"
    "../concepts"
    "../objects"
    "../protocols"
    "../templates"
    "../prompts"
    "../work-docs"
# ISSUE -----------------------------------------------------------
    "../work-docs/your-planning.md"
    "../work-docs/your-requirements.md"
    "../work-docs/your-ticket.md"
)

# Array de caminhos de destino
target_paths=(
# CORE ------------------------------------------------------------
    "../_mason/apis/__brick__/{{name}}"
    "../_mason/code-of-conduct/__brick__/{{name}}/code-of-conduct"
    "../_mason/concepts/__brick__/{{name}}/concepts"
    "../_mason/objects/__brick__/{{name}}/objects"
    "../_mason/protocols/__brick__/{{name}}/protocols"
    "../_mason/templates/__brick__/{{name}}/templates"
    "../_mason/prompts/__brick__/{{name}}/prompts"
    "../_mason/work-docs/__brick__"
# ISSUE -----------------------------------------------------------
    "../_mason/issue/__brick__/{{issueFolder.paramCase()}}/{{issueName.paramCase()}}/your-planning.md"
    "../_mason/issue/__brick__/{{issueFolder.paramCase()}}/{{issueName.paramCase()}}/your-requirements.md"
    "../_mason/issue/__brick__/{{issueFolder.paramCase()}}/{{issueName.paramCase()}}/your-ticket.md"
)

# Verifica se os arrays têm o mesmo tamanho
if [ ${#source_paths[@]} -ne ${#target_paths[@]} ]; then
    echo "Erro: Número de caminhos fonte deve corresponder ao número de caminhos de destino"
    exit 1
fi

# Percorre os arrays e copia os arquivos
for i in "${!source_paths[@]}"; do
    source="${source_paths[$i]}"
    target="${target_paths[$i]}"

    # Cria diretório de destino se não existir
    mkdir -p "$(dirname "$target")"

    # Copia arquivos e pastas
    if [ -e "$source" ]; then
        if [ -d "$source" ]; then
            # Se fonte é um diretório, copia seu conteúdo
            cp -R "$source"/. "$target"
        else
            # Se fonte é um arquivo, copia diretamente
            cp "$source" "$target"
        fi
        echo "Copiado: $source -> $target"
    else
        echo "Aviso: Fonte não existe: $source"
    fi
done

echo "Sincronização concluída!"
