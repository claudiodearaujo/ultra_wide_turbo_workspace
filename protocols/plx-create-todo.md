---
document_type: protocol
goal: criar lista de tarefas baseada na entrada do usuário
gpt_action: siga estes passos ao criar uma lista de tarefas a partir da entrada do usuário
---

CONTEXTO: O [[User]] forneceu uma entrada que precisa ser convertida em uma lista de tarefas organizada em [[your-todo-list]].

1. DADO QUE [[You]] RECEBE entrada do [[User]]
   1. ENTÃO [[You]] LÊ entrada cuidadosamente
   2. E [[You]] IDENTIFICA itens acionáveis
   3. SE [[input]] NÃO ESTÁ claro
      1. ENTÃO [[You]] FAZ perguntas de esclarecimento ao [[User]]
      2. E [[You]] AGUARDA resposta

2. QUANDO [[You]] ENTENDE entrada
   1. ENTÃO [[You]] CRIA tarefas atômicas
      1. E [[You]] GARANTE que cada tarefa é testável
      2. E [[You]] GARANTE que as tarefas seguem o processo de desenvolvimento
   2. SE tarefa É muito grande
      1. ENTÃO [[You]] DIVIDE em tarefas menores
      2. E [[You]] MANTÉM ordem das tarefas

3. DADO QUE [[You]] TEM tarefas atômicas
   1. ENTÃO [[You]] ATUALIZA [[your-todo-list]]
      1. E [[You]] ADICIONA tarefas sob Milestone Atual
      2. E [[You]] PRESERVA seção Adicionado pelo Usuário
   2. SE [[User]] TEM tarefas prioritárias
      1. ENTÃO [[You]] ADICIONA à seção Adicionado pelo Usuário
      2. E [[You]] MARCA como alta prioridade

4. QUANDO [[You]] COMPLETA lista de tarefas
   1. ENTÃO [[You]] VERIFICA qualidade da lista
      1. E [[You]] CHECA atomicidade das tarefas
      2. E [[You]] CHECA clareza das tarefas
   2. SE [[User]] ACEITA lista
      1. ENTÃO [[You]] INICIA o processo de desenvolvimento 
