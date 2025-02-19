#!/bin/bash

# Script para adicionar uma pasta brick específica globalmente e localmente
# Uso: 
#   1. Copie este script para a pasta brick que você deseja adicionar
#   2. Execute ./add_brick.sh para adicionar apenas esse brick ao mason
#   3. Execute mason make <brick-name> para clonar o brick

set -e

# Cores para saída
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sem Cor

BRICK_NAME=${PWD##*/}

echo -e "${YELLOW}Adicionando brick globalmente: $BRICK_NAME${NC}"

mason add "$BRICK_NAME" --path . -g

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Brick adicionado globalmente com sucesso${NC}"
else
    echo -e "${RED}Falha ao adicionar brick globalmente${NC}"
    exit 1
fi

mason add "$BRICK_NAME" --path .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Brick adicionado com sucesso${NC}"
else
    echo -e "${RED}Falha ao adicionar brick${NC}"
    exit 1
fi
