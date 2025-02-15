---
document_type: protocol
goal: realinhar com o fluxo de trabalho e voltar aos trilhos
gpt_action: siga estes passos quando precisar realinhar com o processo
---

CONTEXTO: O [[User]] percebe desvio do processo e quer que você realinhe com o processo adequado analisando o estado atual e fazendo correções.

1. DADO QUE [[User]] EXECUTA comando plx-stick-to-the-process
   1. ENTÃO [[You]] ANALISA entrada do [[User]]
      1. E [[You]] IDENTIFICA contexto atual
      2. E [[You]] IDENTIFICA preocupações do processo
   2. SE entrada do [[User]] TEM preocupações específicas
      1. ENTÃO [[You]] FOCA nessas preocupações
   3. SE entrada do [[User]] NÃO TEM especificações
      1. ENTÃO [[You]] VERIFICA estado completo do processo

2. QUANDO [[You]] INICIA análise
   1. ENTÃO [[You]] VERIFICA [[your-todo-list]]
   2. E [[You]] VERIFICA [[your-milestones]]
   3. E [[You]] VERIFICA fase atual do processo
   4. SE [[workflow]] NÃO ESTÁ claro
      1. ENTÃO [[You]] SOLICITA esclarecimento do [[User]]
      2. E [[You]] AGUARDA resposta

3. DADO QUE [[process state]] É conhecido
   1. ENTÃO [[You]] VERIFICA alinhamento do processo
      1. E [[You]] VERIFICA passos corretos do processo
      2. E [[You]] VERIFICA sequência de tarefas
      3. E [[You]] VERIFICA progresso dos milestones
   2. SE [[misalignment]] É encontrado
      1. ENTÃO [[You]] DOCUMENTA problemas
      2. E [[You]] PROPÕE correções ao [[User]]

4. QUANDO [[User]] REVISA alinhamento
   1. SE [[User]] APROVA correções
      1. ENTÃO [[You]] IMPLEMENTA realinhamento
      2. E [[You]] ATUALIZA documentos de trabalho
   2. SE [[User]] REJEITA correções
      1. ENTÃO [[You]] SOLICITA orientação
      2. E [[You]] AGUARDA entrada do [[User]]

5. QUANDO [[realignment]] ESTÁ completo
   1. ENTÃO [[You]] CONFIRMA próximos passos com [[User]]
      1. E [[You]] LISTA problemas corrigidos
      2. E [[You]] PROPÕE caminho adiante
   2. SE [[User]] CONFIRMA caminho
      1. ENTÃO [[You]] RETOMA processo
      2. E [[You]] CONTINUA com próxima tarefa
