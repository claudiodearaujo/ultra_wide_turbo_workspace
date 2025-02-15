---
document_type: protocol
goal: analisar e entender o conteúdo e estrutura do projeto
gpt_action: siga estes passos ao examinar o contexto do projeto
---

CONTEXTO: O [[User]] precisa que você analise e atualize seu entendimento do conteúdo e estrutura do projeto.

1. DADO QUE [[User]] EXECUTA comando plx-context
   1. ENTÃO [[You]] ANALISA escopo do projeto
      1. E [[You]] IDENTIFICA componentes principais
      2. E [[You]] IDENTIFICA estrutura do projeto
   2. SE entrada do [[User]] TEM foco específico
      1. ENTÃO [[You]] FOCA no componente
   3. SE entrada do [[User]] NÃO TEM especificações
      1. ENTÃO [[You]] EXAMINA projeto inteiro

2. QUANDO [[You]] INICIA revisão do projeto
   1. ENTÃO [[You]] ANALISA estrutura do projeto
      1. E [[You]] VERIFICA código fonte
      2. E [[You]] VERIFICA arquivos de configuração
      3. E [[You]] VERIFICA documentação
   2. SE projeto TEM arquivos de trabalho
      1. ENTÃO [[You]] INCLUI os relevantes
   3. SE [[gaps]] SÃO encontradas
      1. ENTÃO [[You]] DOCUMENTA gaps
      2. E [[You]] SOLICITA informações

3. DADO QUE [[analysis]] ESTÁ completa
   1. ENTÃO [[You]] PREPARA visão geral do projeto
      1. E [[You]] RESUME arquitetura
      2. E [[You]] LISTA componentes principais
      3. E [[You]] IDENTIFICA dependências
   2. SE [[understanding]] PRECISA de esclarecimento
      1. ENTÃO [[You]] FAZ perguntas específicas
      2. E [[You]] AGUARDA respostas

4. QUANDO [[overview]] ESTÁ pronta
   1. ENTÃO [[You]] APRESENTA ao [[User]]
      1. E [[You]] EXPLICA estrutura do projeto
      2. E [[You]] DESTACA recursos principais
   2. SE [[User]] CONFIRMA entendimento
      1. ENTÃO [[You]] SALVA contexto
      2. E [[You]] ATUALIZA base de conhecimento
   3. SE [[User]] FORNECE correções
      1. ENTÃO [[You]] INCORPORA feedback
      2. E [[You]] ATUALIZA entendimento

5. DADO QUE [[context]] ESTÁ estabelecido
   1. ENTÃO [[You]] VERIFICA compreensão
      1. E [[You]] CHECA entendimento da arquitetura
      2. E [[You]] CHECA relacionamentos dos componentes
      3. E [[You]] CHECA restrições técnicas
   2. SE [[issues]] SÃO encontradas
      1. ENTÃO [[You]] RESOLVE mal-entendidos
      2. E [[You]] VERIFICA novamente
   3. SE [[understanding]] ESTÁ completo
      1. ENTÃO [[You]] CONFIRMA prontidão
      2. E [[You]] INFORMA [[User]]
