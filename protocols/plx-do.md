---
document_type: protocol
goal: executar tarefa de alta prioridade do usuário com foco perfeito
gpt_action: siga estes passos quando o usuário precisar de uma tarefa feita com a mais alta prioridade
---

CONTEXTO: O [[User]] tem uma tarefa de alta prioridade que precisa de atenção imediata e focada e deseja que você a execute perfeitamente antes de continuar com qualquer outro trabalho.

1. DADO QUE [[You]] RECEBE comando plx-do
   1. ENTÃO [[You]] LÊ [[task]]
      1. E [[You]] IDENTIFICA requisitos da tarefa
      2. E [[You]] LIMPA foco atual
   2. SE [[task]] NÃO TEM detalhes claros
      1. ENTÃO [[You]] PERGUNTA ao [[User]]
      2. E [[You]] AGUARDA resposta

2. QUANDO [[You]] INICIA tarefa
   1. ENTÃO [[You]] ATUALIZA [[your-milestones]]
      1. E [[You]] ADICIONA milestone prioritário
      2. E [[You]] DEFINE como foco atual
   2. ENTÃO [[You]] ATUALIZA [[your-todo-list]]
      1. E [[You]] ADICIONA tarefa no topo
      2. E [[You]] MARCA como alta prioridade

3. DADO QUE [[task]] ESTÁ pronta
   1. ENTÃO [[You]] FOCA apenas na tarefa
      1. E [[You]] IGNORA questões não relacionadas
      2. E [[You]] PULA outras melhorias
   2. ENTÃO [[You]] SEGUE processo de desenvolvimento
      1. E [[You]] EXECUTA passos da tarefa
      2. E [[You]] TESTA minuciosamente
   3. SE [[task]] PRECISA de esclarecimento
      1. ENTÃO [[You]] PERGUNTA ao [[User]]
      2. E [[You]] AGUARDA resposta

4. QUANDO [[task]] ESTÁ completa
   1. ENTÃO [[You]] VERIFICA resultados
      1. E [[You]] CHECA requisitos
      2. E [[You]] CONFIRMA qualidade
   2. ENTÃO [[You]] ATUALIZA [[your-todo-list]]
      1. E [[You]] MARCA tarefa como completa
      2. E [[You]] ATUALIZA milestone

5. DADO QUE [[task]] ESTÁ verificada
   1. ENTÃO [[You]] RETOMA fluxo normal
      1. E [[You]] RETORNA ao processo de desenvolvimento
      2. E [[You]] CONTINUA com próxima tarefa
   2. SE [[User]] ACEITA resultado
      1. ENTÃO [[You]] CONFIRMA conclusão
      2. E [[You]] INICIA próxima tarefa 
