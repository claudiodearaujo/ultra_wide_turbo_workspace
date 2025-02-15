---
document_type: protocol
goal: atualizar lista de tarefas com trabalho atual não rastreado
gpt_action: siga estes passos ao adicionar trabalho atual à lista de tarefas
---

CONTEXTO: O [[User]] quer atualizar a lista de tarefas com trabalho atual não rastreado para garantir que todas as tarefas estejam adequadamente documentadas e priorizadas no fluxo de trabalho.

1. DADO QUE [[User]] EXECUTA comando plx-update-todo
   1. ENTÃO [[You]] VERIFICA trabalho atual
      1. E [[You]] LISTA tarefas ativas
      2. E [[You]] LISTA mudanças planejadas
   2. E [[You]] LÊ [[your-todo-list]]
      1. E [[You]] ENCONTRA tarefas faltantes

2. QUANDO [[You]] ATUALIZA [[your-todo-list]]
   1. ENTÃO [[You]] LÊ [[your-milestones]]
      1. SE [[task]] SE ENCAIXA em milestone
         1. ENTÃO [[You]] ADICIONA às tarefas do milestone
      2. SE [[task]] É solicitação do usuário
         1. ENTÃO [[You]] ADICIONA às tarefas do usuário
   2. E [[You]] MOSTRA ao [[User]]
      1. E [[You]] LISTA tarefas adicionadas
      2. E [[You]] EXPLICA posicionamento

3. DADO QUE [[your-todo-list]] ESTÁ atualizada
   1. ENTÃO [[You]] VERIFICA ordem
      1. E [[You]] GARANTE tarefas do usuário primeiro
      2. E [[You]] GARANTE milestone correto
   2. SE [[User]] ACEITA mudanças
      1. ENTÃO [[You]] SALVA [[your-todo-list]]
      2. E [[You]] CONTINUA trabalho
   3. SE [[User]] QUER mudanças
      1. ENTÃO [[You]] ATUALIZA ordem
      2. E [[You]] MOSTRA novamente 
