---
document_type: protocol
goal: criar novo documento baseado na entrada do usuário seguindo regras do framework
gpt_action: seguir estes passos ao criar novos documentos
---

CONTEXTO: O [[Usuário]] percebe que um novo arquivo de documentação precisa ser criado e quer que você o crie seguindo os padrões e protocolos de documentação do framework.

1. DADO [[Usuário]] EXECUTA comando plx-create-doc
   1. ENTÃO [[Você]] LÊ [[entrada]]
      1. E [[Você]] ENCONTRA tipo de [[documento]]
      2. E [[Você]] ENCONTRA objetivo do [[documento]]
      3. E [[Você]] ENCONTRA [[ação]]
   2. SE [[entrada]] ESTÁ vazia
      1. ENTÃO [[Você]] PERGUNTA ao [[Usuário]]

2. QUANDO [[Você]] INICIA criação
   1. ENTÃO [[Você]] ESCREVE [[frontmatter]]
      ```markdown
      ---
      document_type: [protocol|code-of-conduct|prompt|template]
      goal: [declaração clara do objetivo]
      gpt_action: [instrução específica para GPT]
      ---
      ```
   2. SE [[frontmatter]] PRECISA revisão
      1. ENTÃO [[Você]] VERIFICA formato
      2. E [[Você]] CORRIGE erros

3. QUANDO [[Você]] CONSTRÓI estrutura
   1. ENTÃO [[Você]] CRIA seções
   2. E [[Você]] ADICIONA emoji
   3. E [[Você]] ESCREVE cabeçalhos

4. DADO [[estrutura]] ESTÁ pronta
   1. ENTÃO [[Você]] ESCREVE conteúdo
      1. E [[Você]] USA palavras-chave
         - Primárias: DADO (pré-condição), QUANDO (ação), ENTÃO (resultado)
         - Fluxo: E (adicional), OU (alternativa)
         - Condicionais: SE/SENÃO (ramificação), MAS (exceção)
      2. E [[Você]] SEGUE regras
         - MAIÚSCULAS em palavras-chave
         - [[Ator]] ou [[Componente]] em colchetes duplos
         - UM VERBO/ESTADO em maiúsculas após ator
         - Indentação adequada para sub-passos
      3. E [[Você]] USA elementos de código
         - Código inline com backticks
         - Blocos de código adequadamente indentados
         - Realce de sintaxe específico da linguagem

5. QUANDO [[Você]] ADICIONA código
   1. ENTÃO [[Você]] USA markdown
      ```exemplo
      ```linguagem
      código aqui
      ```
      ```
   2. SE [[código]] PRECISA contexto
      1. ENTÃO [[Você]] ADICIONA comentários

6. DADO [[documento]] ESTÁ completo
   1. ENTÃO [[Você]] VERIFICA qualidade
      1. E [[Você]] VERIFICA formato
      2. E [[Você]] VERIFICA seções
      3. E [[Você]] VERIFICA estilo
   2. SE [[documento]] TEM erros
      1. ENTÃO [[Você]] CORRIGE [[documento]]
      2. E [[Você]] VERIFICA novamente
   3. SE [[documento]] ESTÁ pronto
      1. ENTÃO [[Você]] SALVA [[documento]]
      2. E [[Você]] INFORMA [[Usuário]] 
