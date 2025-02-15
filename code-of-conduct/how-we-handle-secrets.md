---
document_type: code-of-conduct
goal: definir como gerenciamos segredos usando o Firebase Functions secrets manager
gpt_action: siga estes passos ao gerenciar segredos no projeto
---

# 🔐 Processo de Gerenciamento de Segredos

1. GIVEN [[You]] PRECISA gerenciar segredos
   1. WHEN [[You]] CRIA estrutura
      1. THEN [[You]] ESCREVE template
         1. AND [[You]] ADICIONA conteúdo:
         ```bash
         # Configuração da API
         API_KEY=sua-chave-api-aqui
         LIST_ID=seu-id-lista-aqui  # Opcional: ID da lista padrão

         # Adicione outros segredos abaixo com descrições
         # FORMATO: NOME_SEGREDO=valor-padrão-ou-exemplo
         ```
      2. THEN [[You]] ATUALIZA gitignore
         1. AND [[You]] ADICIONA conteúdo:
         ```gitignore
         # Segredos
         .secrets
         ```

2. GIVEN [[You]] TEM estrutura
   1. WHEN [[You]] IMPLEMENTA script de atualização
      1. THEN [[You]] CRIA update_secrets.sh
         1. AND [[You]] ESCREVE conteúdo:
         ```bash
         #!/bin/bash

         # Verifica se o arquivo .secrets existe
         if [ ! -f "../.secrets" ] && [ ! -f ".secrets" ]; then
             echo "Erro: arquivo .secrets não encontrado!"
             echo "Por favor, copie .secrets.template para .secrets e preencha seus valores"
             exit 1
         fi

         # Usa o arquivo de segredos correto
         SECRETS_FILE=".secrets"
         if [ -f "../.secrets" ]; then
             SECRETS_FILE="../.secrets"
         fi

         # Cria diretório temporário para arquivos de segredo
         TEMP_DIR=$(mktemp -d)
         trap 'rm -rf "$TEMP_DIR"' EXIT

         # Verifica se o ID do projeto Firebase está definido
         if [ -z "${FIREBASE_PROJECT_ID}" ]; then
             echo "Erro: FIREBASE_PROJECT_ID não está definido"
             exit 1
         fi

         # Carrega o arquivo de segredos
         source "$SECRETS_FILE"

         # Função para atualizar um segredo
         update_secret() {
             local secret_name=$1
             local secret_value=$2
             
             if [ -z "$secret_value" ]; then
                 echo "Aviso: $secret_name está vazio, pulando..."
                 return
             fi

             # Cria arquivo temporário para valor do segredo
             local temp_file="$TEMP_DIR/${secret_name}"
             echo -n "$secret_value" > "$temp_file"

             echo "Atualizando segredo: $secret_name"
             if ! firebase functions:secrets:set "$secret_name" --data-file "$temp_file" --project ${FIREBASE_PROJECT_ID}; then
                 echo "Erro: Falha ao atualizar segredo $secret_name"
                 return 1
             fi
         }

         # Atualiza cada segredo
         update_secret "API_KEY" "$API_KEY"
         update_secret "LIST_ID" "$LIST_ID"
         # Adicione novos segredos aqui quando forem adicionados ao .secrets.template

         echo "Segredos atualizados com sucesso!"
         ```

3. GIVEN [[You]] TEM script de atualização
   1. WHEN [[You]] IMPLEMENTA script de limpeza
      1. THEN [[You]] CRIA clear_secrets.sh
         1. AND [[You]] ESCREVE conteúdo:
         ```bash
         #!/bin/bash

         # Função para limpar um segredo
         clear_secret() {
             local secret_name=$1
             echo "Limpando segredo: $secret_name"
             
             # Verifica se o ID do projeto Firebase está definido
             if [ -z "${FIREBASE_PROJECT_ID}" ]; then
                 echo "Erro: FIREBASE_PROJECT_ID não está definido"
                 exit 1
             fi
             
             # Verifica se o segredo existe
             if ! firebase functions:secrets:get "$secret_name" --project ${FIREBASE_PROJECT_ID} &>/dev/null; then
                 echo "Aviso: Segredo $secret_name não existe, pulando..."
                 return 0
             fi

             # Tenta destruir o segredo
             if ! firebase functions:secrets:destroy "$secret_name" --project ${FIREBASE_PROJECT_ID} --force; then
                 echo "Erro: Falha ao limpar segredo $secret_name"
                 return 1
             fi
         }

         # Verifica se estamos no diretório functions
         if [ ! -d "scripts" ]; then
             echo "Erro: Por favor, execute este script do diretório functions"
             exit 1
         fi

         # Lista de todos os segredos para limpar
         SECRETS=(
             "API_KEY"
             "LIST_ID"
             # Adicione novos segredos aqui quando forem adicionados ao .secrets.template
         )

         # Pede confirmação
         echo "Isto irá limpar os seguintes segredos:"
         printf '%s\n' "${SECRETS[@]}"
         read -p "Tem certeza que deseja continuar? (s/N) " -n 1 -r
         echo
         if [[ ! $REPLY =~ ^[Ss]$ ]]; then
             echo "Operação cancelada."
             exit 1
         fi

         # Limpa cada segredo
         failed=0
         for secret in "${SECRETS[@]}"; do
             if ! clear_secret "$secret"; then
                 failed=$((failed + 1))
             fi
         done

         if [ $failed -eq 0 ]; then
             echo "Todos os segredos limpos com sucesso!"
         else
             echo "Aviso: Falha ao limpar $failed segredo(s)"
             exit 1
         fi
         ```

# 🔄 Fluxo de Uso

1. GIVEN [[Developer]] PRECISA de segredos
   1. WHEN [[Developer]] CONFIGURA segredos
      1. THEN [[Developer]] COPIA template
         1. AND [[Developer]] EXECUTA `cp .secrets.template .secrets`
      2. THEN [[Developer]] EDITA valores
         1. AND [[Developer]] EXECUTA `nano .secrets`
      3. THEN [[Developer]] ATUALIZA Firebase
         1. AND [[Developer]] EXECUTA `./scripts/update_secrets.sh`
         2. IF [[atualização]] FALHA
            1. THEN [[Developer]] VERIFICA permissões
            2. AND [[Developer]] VERIFICA ID do projeto

2. GIVEN [[Developer]] TEM segredos
   1. WHEN [[Developer]] ACESSA segredos
      1. THEN [[Developer]] USA variáveis de ambiente
         1. AND [[Developer]] ESCREVE código:
         ```typescript
         const apiKey = process.env.API_KEY;
         const listId = process.env.LIST_ID;
         ```

3. GIVEN [[Developer]] PRECISA limpar
   1. WHEN [[Developer]] LIMPA segredos
      1. THEN [[Developer]] EXECUTA script de limpeza
         1. AND [[Developer]] EXECUTA `./scripts/clear_secrets.sh`
      2. THEN [[Developer]] CONFIRMA exclusão
         1. AND [[Developer]] RESPONDE ao prompt
      3. IF [[exclusão]] FALHA
         1. THEN [[Developer]] VERIFICA logs
         2. AND [[Developer]] TENTA novamente operação

# ✅ Lista de Verificação

1. GIVEN [[You]] INICIA verificação
   1. WHEN [[You]] VERIFICA configuração
      1. THEN [[You]] CHECA template
         1. AND [[You]] CONFIRMA existência do template
         2. AND [[You]] VALIDA documentação dos segredos
      2. THEN [[You]] CHECA gitignore
         1. AND [[You]] CONFIRMA exclusão dos segredos
      3. THEN [[You]] CHECA scripts
         1. AND [[You]] CONFIRMA permissões de execução
         2. AND [[You]] VALIDA localização do diretório
      4. THEN [[You]] CHECA firebase
         1. AND [[You]] CONFIRMA configuração do projeto
         2. IF [[configuração]] ESTÁ inválida
            1. THEN [[You]] REPORTA problemas
            2. AND [[You]] SUGERE correções

2. GIVEN [[You]] COMPLETA configuração
   1. WHEN [[You]] VERIFICA scripts
      1. THEN [[You]] CHECA update_secrets.sh
         1. AND [[You]] TRATA arquivos ausentes
         2. AND [[You]] CRIA arquivos temporários com segurança
         3. AND [[You]] LIMPA arquivos temporários
         4. AND [[You]] REPORTA erros claramente
      2. THEN [[You]] CHECA clear_secrets.sh
         1. AND [[You]] CONFIRMA exclusão
         2. AND [[You]] VERIFICA existência do segredo
         3. AND [[You]] TRATA erros adequadamente
         4. AND [[You]] REPORTA resultados claramente
      3. IF [[script]] FALHA
         1. THEN [[You]] REGISTRA erro
         2. AND [[You]] SUGERE correções
