---
document_type: protocol
goal: obter clareza sobre a abordagem atual e garantir informações completas
gpt_action: seguir estes passos quando precisar de orientação ou verificar prontidão para implementação
---

CONTEXTO: O [[Usuário]] quer que [[Você]] verifique seu entendimento e reúna todas as informações necessárias antes de prosseguir.

1. DADO [[Usuário]] EXECUTA comando plx-ask-questions
   1. ENTÃO [[Você]] PAUSA trabalho atual
      1. E [[Você]] IDENTIFICA ação atual
      2. E [[Você]] IDENTIFICA objetivo imediato
      3. E [[Você]] IDENTIFICA recursos necessários
   2. SE [[abordagem atual]] PRECISA verificação
      1. ENTÃO [[Você]] VERIFICA requisitos de implementação:
         1. Documentação de API necessária
         2. Protocolos necessários
         3. Dependências necessárias
         4. Configurações necessárias
      2. E [[Você]] ANOTA informações faltantes

2. QUANDO [[Você]] REVISA contexto atual
   1. ENTÃO [[Você]] VERIFICA estado imediato
      1. E [[Você]] OLHA conversa atual
      2. E [[Você]] OLHA mudanças atuais
      3. E [[Você]] OLHA erros atuais
   2. SE [[abordagem]] PRECISA orientação
      1. ENTÃO [[Você]] LISTA preocupações específicas
      2. E [[Você]] IDENTIFICA pontos de decisão
      3. E [[Você]] IDENTIFICA lacunas de informação

3. DADO [[preocupações]] ESTÃO identificadas
   1. ENTÃO [[Você]] FORMULA perguntas
      1. E [[Você]] FOCA em completude:
         1. "Tenho toda documentação de API necessária para [recurso]?"
         2. "Existem protocolos específicos que devo consultar para [tarefa]?"
         3. "Existem detalhes de configuração que estou perdendo para [componente]?"
         4. "Algum recurso adicional ajudaria a aperfeiçoar a implementação?"
      2. E [[Você]] MANTÉM perguntas específicas:
         1. Sobre tarefa atual apenas
         2. Sobre próximos passos imediatos
         3. Sobre decisões não claras
   2. SE [[perguntas]] PRECISAM contexto
      1. ENTÃO [[Você]] ADICIONA:
         1. O que está fazendo atualmente
         2. Por que escolheu esta abordagem
         3. Onde precisa de mais informação

4. QUANDO [[perguntas]] ESTÃO prontas
   1. ENTÃO [[Você]] PERGUNTA ao [[Usuário]]
      1. E [[Você]] É conciso
      2. E [[Você]] É específico
      3. E [[Você]] EXPLICA impacto na implementação
   2. SE [[Usuário]] FORNECE orientação
      1. ENTÃO [[Você]] VERIFICA entendimento
      2. E [[Você]] ATUALIZA abordagem se necessário

5. DADO [[orientação]] É recebida
   1. ENTÃO [[Você]] VERIFICA completude
      1. E [[Você]] CONFIRMA todos recursos disponíveis
      2. E [[Você]] CONFIRMA implementação perfeita possível
   2. SE [[implementação]] ESTÁ pronta
      1. ENTÃO [[Você]] RETOMA trabalho
      2. E [[Você]] MANTÉM foco
