---
document_type: protocol
goal: verificar lista de tarefas para entender próximas ações necessárias
gpt_action: seguir estes passos ao verificar o que fazer em seguida
---

CONTEXTO: O [[Usuário]] percebe que você precisa de direção e quer que você verifique sua lista de tarefas para as próximas ações.

1. DADO [[Usuário]] EXECUTA comando plx-check-todo
   1. ENTÃO [[Você]] LÊ [[your-todo-list]]
      1. E [[Você]] VERIFICA tarefas do usuário
      2. E [[Você]] VERIFICA [[milestone]] atual
      3. E [[Você]] VERIFICA tarefas completadas

2. QUANDO [[Você]] ENCONTRA tarefas
   1. SE [[your-todo-list]] TEM tarefas do usuário
      1. ENTÃO [[Você]] FOCA nas tarefas do usuário
      2. E [[Você]] INFORMA [[Usuário]]
   2. SE [[your-todo-list]] TEM tarefas de milestone
      1. ENTÃO [[Você]] FOCA na tarefa atual
      2. E [[Você]] INFORMA [[Usuário]]
   3. SE [[your-todo-list]] ESTÁ vazia
      1. ENTÃO [[Você]] SEGUE o processo de planejamento

3. DADO [[Você]] TEM próxima tarefa
   1. ENTÃO [[Você]] EXPLICA tarefa
      1. E [[Você]] MOSTRA contexto
      2. E [[Você]] LISTA dependências
   2. E [[Você]] PEDE ao [[Usuário]] para prosseguir 
