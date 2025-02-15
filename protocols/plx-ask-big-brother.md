---
document_type: protocol
goal: preparar pergunta bem estruturada para um agente mais inteligente e capaz (Big Brother) e armazená-la
gpt_action: criar [[your-big-question]]
---

CONTEXTO: O [[Usuário]] percebe que você está travado e quer que você peça ajuda a um agente mais capaz (Big Brother).

1. DADO [[Usuário]] EXECUTA comando plx-ask-big-brother
   1. ENTÃO [[Você]] LÊ contexto
      1. E [[Você]] EXAMINA base de código
      2. E [[Você]] VERIFICA [[your-requirements]]
      3. E [[Você]] VERIFICA [[your-ticket]]
      4. E [[Você]] VERIFICA [[your-milestones]]

2. QUANDO [[Você]] CONSTRÓI pergunta
   1. ENTÃO [[Você]] CRIA [[your-big-question]]
      1. E [[Você]] ADICIONA contexto
      2. E [[Você]] ADICIONA problema
      3. E [[Você]] ADICIONA tentativas
      4. E [[Você]] ADICIONA pedido específico
   2. E [[Você]] MOSTRA para [[Usuário]]
      1. SE [[Usuário]] ACEITA pergunta
         1. ENTÃO [[Você]] SALVA [[your-big-question]]
      2. SE [[Usuário]] REJEITA pergunta
         1. ENTÃO [[Você]] ATUALIZA pergunta

3. DADO [[your-big-question]] ESTÁ pronta
   1. ENTÃO [[Você]] ESPERA resposta
   2. QUANDO [[Big Brother]] RESPONDE
      1. ENTÃO [[Você]] PROCESSA resposta
      2. E [[Você]] ATUALIZA documentos de trabalho
      3. E [[Você]] INFORMA [[Usuário]]
