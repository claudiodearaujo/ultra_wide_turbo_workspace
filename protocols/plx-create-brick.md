---
document_type: protocol
goal: criar novo brick seguindo formato padronizado
gpt_action: seguir estes passos ao criar um novo brick
---

CONTEXTO: O [[Usuário]] quer criar um novo Mason brick que segue o formato padronizado de brick do projeto e regras de organização.

1. DADO [[Usuário]] SOLICITA criação de brick
    1. ENTÃO [[Você]] REÚNE requisitos
        1. E [[Você]] OBTÉM nome do brick
        2. E [[Você]] OBTÉM propósito do brick
        3. E [[Você]] OBTÉM variáveis necessárias
    2. SE [[requisitos]] ESTÃO confusos
        1. ENTÃO [[Você]] PERGUNTA ao [[Usuário]]
        2. E [[Você]] ESPERA resposta

2. QUANDO [[Você]] INICIA configuração do brick
    1. ENTÃO [[Você]] CRIA estrutura do brick
        1. E [[Você]] CRIA diretório `__brick__`
        2. E [[Você]] CRIA `brick.yaml`
    2. E [[Você]] CONFIGURA `brick.yaml`
        1. E [[Você]] DEFINE nome
        2. E [[Você]] DEFINE descrição
        3. E [[Você]] DEFINE versão
        4. E [[Você]] DEFINE variáveis
           ```yaml
           vars:
             projectKey:
               type: string
               description: A chave do projeto (ex: Turbo -> TurboScaffold)
             featureName:
               type: string
               description: Nome do recurso (ex: auth -> features/auth/*)
               default: core
           ```

3. DADO [[estrutura]] ESTÁ pronta
    1. ENTÃO [[Você]] ANALISA arquivos originais
        1. E [[Você]] IDENTIFICA uso de variáveis
        2. E [[Você]] ANOTA padrões de casing
    2. E [[Você]] USA sintaxe Mustache
        1. E [[Você]] USA transformações baseadas no casing original:
            - SE original é PascalCase: `{{varName.pascalCase()}}`
            - SE original é snake_case: `{{varName.snakeCase()}}`
            - SE original é param-case: `{{varName.paramCase()}}`
            - SE original é camelCase: `{{varName.camelCase()}}`
    3. E [[Você]] SEGUE regras de substituição
        1. E [[Você]] MANTÉM arquivos não relacionados inalterados
        2. E [[Você]] SUBSTITUI apenas partes usando variáveis definidas
        3. E [[Você]] MANTÉM padrão de casing original

4. QUANDO [[Você]] IMPLEMENTA templates
    1. ENTÃO [[Você]] SEGUE padrões
        1. E [[Você]] COPIA estrutura original
        2. E [[Você]] SUBSTITUI apenas partes variáveis
           ```dart
           // Se original tem:
           class TurboWidget {}
           
           // E projectKey é uma variável, template se torna:
           class {{projectKey.pascalCase()}}Widget {}
           
           // Se original tem:
           final user_id = 'userId';
           
           // E userId é uma variável, template se torna:
           final {{userId.snakeCase()}} = 'userId';
           ```
    2. SE [[template]] PRECISA teste
        1. ENTÃO [[Você]] CRIA arquivos de teste
        2. E [[Você]] ADICIONA exemplo de uso

5. DADO [[brick]] ESTÁ completo
    1. ENTÃO [[Você]] VERIFICA estrutura
        1. E [[Você]] CHECA se arquivos correspondem a bricks existentes
        2. E [[Você]] CHECA se variáveis são consistentes
        3. E [[Você]] CHECA se templates mantêm padrões originais
    2. SE [[Usuário]] ACEITA [[brick]]
        1. ENTÃO [[Você]] COMMITA mudanças
        2. E [[Você]] ATUALIZA documentação
