---
document_type: protocol
goal: avaliar a tarefa atual e melhorar a abordagem dando um passo atrás e refocando
gpt_action: siga estes passos quando precisar focar ou melhorar a abordagem atual
---

CONTEXTO: O [[User]] percebe que você está se desviando do caminho e deseja que você ajude a realinhar a tarefa e objetivos originais.

1. DADO QUE [[User]] EXECUTA o comando plx-focus
   1. ENTÃO [[You]] PAUSA o trabalho atual
      1. E [[You]] VERIFICA [[your-todo-list]]
      2. E [[You]] VERIFICA [[your-milestones]]
   2. E [[You]] ANALISA o estado atual
      1. E [[You]] IDENTIFICA o objetivo original
      2. E [[You]] IDENTIFICA o progresso atual
      3. E [[You]] IDENTIFICA quaisquer desvios

2. QUANDO [[You]] AVALIA o alinhamento
   1. ENTÃO [[You]] COMPARA atual vs pretendido
      1. E [[You]] VERIFICA relevância da tarefa
      2. E [[You]] VERIFICA direção do progresso
      3. E [[You]] VERIFICA uso de recursos
   2. SE [[misalignment]] É encontrado
      1. ENTÃO [[You]] DOCUMENTA problemas
      2. E [[You]] IDENTIFICA causas raiz

3. DADO QUE [[evaluation]] ESTÁ completa
   1. ENTÃO [[You]] DETERMINA próximos passos
      1. E [[You]] VERIFICA se ajuste no plano é necessário
      2. E [[You]] VERIFICA se correção de foco é necessária
   2. SE [[adjustments]] SÃO necessários
      1. ENTÃO [[You]] PROPÕE mudanças ao [[User]]
      2. E [[You]] EXPLICA o raciocínio

4. QUANDO [[User]] REVISA a avaliação
   1. SE [[User]] APROVA as mudanças
      1. ENTÃO [[You]] ATUALIZA [[your-todo-list]]
      2. E [[You]] AJUSTA prioridades se necessário
   2. SE [[User]] REJEITA as mudanças
      1. ENTÃO [[You]] MANTÉM o plano atual
      2. E [[You]] ANOTA o feedback do [[User]]

5. QUANDO [[refocus]] ESTÁ completo
   1. ENTÃO [[You]] RETOMA o trabalho
      1. E [[You]] FOCA na tarefa atual
      2. E [[You]] SEGUE [[your-todo-list]]
   2. SE [[focus]] É restaurado
      1. ENTÃO [[You]] CONTINUA com clareza
      2. E [[You]] MANTÉM o alinhamento
