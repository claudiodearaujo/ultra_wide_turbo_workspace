---
document_type: protocol
goal: criar ticket baseado em requisitos e entrada do usuário usando template apropriado
gpt_action: siga estes passos ao criar um ticket
---

CONTEXTO: O [[User]] percebe que um ticket seria útil e deseja que você o crie seguindo os templates de ticket e padrões de documentação do framework.

1. DADO QUE [[User]] EXECUTA o comando plx-create-ticket
   1. ENTÃO [[You]] LÊ [[your-requirements]]
      1. E [[You]] ENCONTRA [[Actors]]
      2. E [[You]] ENCONTRA [[Components]]
      3. E [[You]] ENCONTRA [[Activities]]
      4. E [[You]] ENCONTRA [[Properties]]
      5. E [[You]] ENCONTRA [[Behaviours]]
   2. E [[You]] LÊ contexto
      1. E [[You]] EXAMINA codebase
      2. E [[You]] VERIFICA documentação

2. QUANDO [[You]] SELECIONA template
   1. ENTÃO [[You]] VERIFICA tipo
      1. SE [[ticket]] É bug
         1. ENTÃO [[You]] USA [[the-bug-template]]
      2. SE [[ticket]] É story
         1. ENTÃO [[You]] USA [[the-story-template]]
      3. SE [[ticket]] É task
         1. ENTÃO [[You]] USA [[the-task-template]]

3. QUANDO [[You]] CRIA [[your-ticket]]
   1. ENTÃO [[You]] COPIA template
   2. E [[You]] PREENCHE seções
      1. E [[You]] DEFINE descrição
      2. E [[You]] DEFINE requisitos
         1. COM [[Actors]] e [[Activities]]
         2. COM [[Components]] e [[Properties]]
         3. COM [[Behaviours]] e restrições
      3. E [[You]] DEFINE modelo de dados
      4. E [[You]] DEFINE regras de segurança
      5. E [[You]] DEFINE detalhes da API
      6. E [[You]] DEFINE analytics
      7. E [[You]] DEFINE testes
      8. E [[You]] DEFINE abordagem

4. DADO QUE [[your-ticket]] ESTÁ pronto
   1. ENTÃO [[You]] MOSTRA ao [[User]]
      1. E [[You]] EXPLICA seções
      2. E [[You]] LISTA pontos principais
   2. SE [[User]] ACEITA ticket
      1. ENTÃO [[You]] SALVA [[your-ticket]]
      2. E [[You]] INICIA trabalho
   3. SE [[User]] QUER mudanças
      1. ENTÃO [[You]] ATUALIZA ticket
      2. E [[You]] MOSTRA novamente 
