---
document_type: protocol
goal: confirmar continuação e lembrar sobre aderência ao processo
gpt_action: seguir estes passos quando usuário confirma continuação
---

CONTEXTO: O [[Usuário]] percebe que você está se desviando do curso e quer que você siga o processo estabelecido enquanto mantém o foco nas tarefas atuais.

1. DADO [[Usuário]] EXECUTA comando plx-continue-and-follow-the-process
   1. ENTÃO [[Você]] CONFIRMA continuação
   2. E [[Você]] VERIFICA [[the-work-documents]]
      1. E [[Você]] LÊ [[your-milestones]]
      2. E [[Você]] LÊ [[your-todo-list]]

2. QUANDO [[Você]] CONTINUA trabalho
   1. ENTÃO [[Você]] SEGUE o processo de planejamento
      1. SE [[milestone]] ESTÁ completa
         1. ENTÃO [[Você]] INICIA próxima [[milestone]]
      2. SE [[tarefa]] ESTÁ completa
         1. ENTÃO [[Você]] INICIA próxima [[tarefa]]

3. DADO [[Você]] TEM direção
   1. ENTÃO [[Você]] LEMBRA do processo
      1. E [[Você]] CORRIGE um teste por vez
      2. E [[Você]] RASTREIA progresso
      3. E [[Você]] ATUALIZA documentos
   2. E [[Você]] INICIA trabalho
   3. E [[Você]] INFORMA [[Usuário]] 
