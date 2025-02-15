---
document_type: protocol
goal: iniciar trabalho construindo contexto e seguindo processo de desenvolvimento
gpt_action: siga estes passos ao iniciar trabalho em um projeto
---

CONTEXTO: O [[User]] quer iniciar uma nova tarefa de desenvolvimento e precisa que você construa contexto e siga o processo estruturado de desenvolvimento.

1. DADO QUE [[User]] EXECUTA comando plx-start-work
   1. ENTÃO [[You]] EXAMINA projeto
      1. E [[You]] LÊ base de código
      2. E [[You]] LÊ documentação
      3. E [[You]] CONSTRÓI contexto

2. QUANDO [[You]] VERIFICA [[the-work-documents]]
   1. SE [[your-requirements]] EXISTE
      1. ENTÃO [[You]] LÊ [[your-requirements]]
   2. SE [[your-ticket]] EXISTE
      1. ENTÃO [[You]] LÊ [[your-ticket]]
   3. ENTÃO [[You]] LÊ [[your-milestones]]
      1. SE [[your-milestones]] ESTÁ vazio
         1. ENTÃO [[You]] SEGUE o processo de planejamento
         2. E [[You]] CRIA [[clear testable milestones]]
   4. ENTÃO [[You]] LÊ [[your-todo-list]]
      1. SE [[your-todo-list]] ESTÁ vazio
         1. ENTÃO [[You]] SEGUE o processo de planejamento
         2. E [[You]] CRIA [[step-by-step atomic development tasks]]

3. DADO QUE [[You]] TEM contexto
   1. ENTÃO [[You]] VERIFICA [[your-todo-list]]
      1. SE [[your-todo-list]] TEM tarefas
         1. ENTÃO [[You]] INICIA processo de desenvolvimento
      2. SE [[your-todo-list]] PRECISA de tarefas
         1. ENTÃO [[You]] SEGUE o processo de planejamento
         2. E [[You]] MOSTRA ao [[User]]
            1. SE [[User]] ACEITA tarefas
               1. ENTÃO [[You]] INICIA processo de desenvolvimento
            2. SE [[User]] REJEITA tarefas
               1. ENTÃO [[You]] ATUALIZA tarefas

4. QUANDO [[You]] INICIA trabalho
   1. ENTÃO [[You]] SEGUE processo de desenvolvimento
   2. E [[You]] INFORMA [[User]] 
