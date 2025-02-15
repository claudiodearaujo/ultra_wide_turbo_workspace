---
document_type: protocol
goal: criar novo protocolo seguindo formato padronizado
gpt_action: siga estes passos ao criar um novo protocolo
---

CONTEXTO: O [[User]] percebe uma oportunidade de criar um protocolo útil e deseja que você o crie seguindo o formato padronizado de protocolo e regras de documentação do framework.

1. DADO QUE [[User]] EXECUTA o comando plx-create-protocol
   1. ENTÃO [[You]] LÊ [[input]]
      1. E [[You]] ENCONTRA nome do [[protocol]]
      2. E [[You]] ENCONTRA propósito do [[protocol]]
   2. SE [[input]] TEM detalhes
      1. ENTÃO [[You]] USA detalhes
   3. SE [[input]] ESTÁ vazio
      1. ENTÃO [[You]] PERGUNTA ao [[User]]

2. QUANDO [[You]] INICIA criação
   1. ENTÃO [[You]] ESCREVE [[frontmatter]]
      1. E [[You]] DEFINE tipo
      2. E [[You]] DEFINE objetivo
      3. E [[You]] DEFINE ação
   2. SE [[frontmatter]] NÃO ESTÁ claro
      1. ENTÃO [[You]] PERGUNTA ao [[User]]
      2. E [[You]] AGUARDA resposta

3. DADO QUE [[frontmatter]] ESTÁ pronto
   1. ENTÃO [[You]] ADICIONA contexto
      1. E [[You]] ESCREVE "CONTEXTO: RAZÃO PARA O PROTOCOLO E/OU INFORMAÇÕES RELEVANTES IMPORTANTES" (uma frase)
      2. E [[You]] ADICIONA situação
      3. E [[You]] ADICIONA "e deseja que você"
      4. E [[You]] ADICIONA objetivo
   2. E [[You]] CONSTRÓI passos
      1. E [[You]] INICIA [[command]]
      2. E [[You]] ADICIONA [[actions]]
      3. E [[You]] DEFINE estado
   3. SE [[steps]] PRECISA de ramificações
      1. ENTÃO [[You]] ADICIONA condições
      2. E [[You]] ADICIONA caminhos

4. QUANDO [[You]] ESCREVE conteúdo
   1. ENTÃO [[You]] USA formato
      1. E [[You]] USA palavras-chave Gherkin:
         - Primárias: GIVEN (pré-condição), WHEN (ação), THEN (resultado)
         - Fluxo: AND (adicional), OR (alternativa)
         - Condicionais: IF/ELSE (ramificação), BUT (exceção)
      2. E [[You]] SEGUE regras:
         - MAIÚSCULAS para todas as palavras-chave
         - [[Actor]] ou [[Component]] entre colchetes duplos
         - UM VERBO/ESTADO em maiúsculas após o ator
         - Indentação adequada para sub-passos
      3. E [[You]] USA elementos de código:
         - Código inline com backticks
         - Blocos de código adequadamente indentados
         - Realce de sintaxe específico da linguagem
   2. SE [[format]] ESTÁ errado
      1. ENTÃO [[You]] CORRIGE formato
      2. E [[You]] VERIFICA novamente

5. DADO QUE [[protocol]] ESTÁ pronto
   1. ENTÃO [[You]] VERIFICA qualidade
      1. E [[You]] VERIFICA passos
      2. E [[You]] VERIFICA fluxo
      3. E [[You]] VERIFICA tratamento
   2. SE [[User]] ACEITA [[protocol]]
      1. ENTÃO [[You]] SALVA [[protocol]]
      2. E [[You]] INFORMA ao [[User]]
