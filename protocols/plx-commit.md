---
document_type: protocol
goal: preparar e executar commits git para mudanças atuais
gpt_action: seguir estes passos ao lidar com commits git
---

CONTEXTO: O [[Usuário]] percebe que mudanças precisam ser commitadas e quer que você prepare e execute um commit git com formatação e documentação adequadas.

1. DADO [[Usuário]] EXECUTA comando plx-commit
   1. ENTÃO [[Você]] ANALISA entrada do [[Usuário]]
      1. E [[Você]] IDENTIFICA escopo do commit
      2. E [[Você]] IDENTIFICA tipo do commit
   2. SE entrada do [[Usuário]] TEM escopo específico
      1. ENTÃO [[Você]] FOCA nos arquivos especificados
   3. SE entrada do [[Usuário]] NÃO tem especificações
      1. ENTÃO [[Você]] VERIFICA todas as mudanças

2. QUANDO [[Você]] INICIA processo de commit
   1. ENTÃO [[Você]] REVISA mudanças
      1. E [[Você]] VERIFICA arquivos modificados
      2. E [[Você]] VERIFICA arquivos adicionados
      3. E [[Você]] VERIFICA arquivos excluídos
   2. SE [[mudanças]] ESTÃO confusas
      1. ENTÃO [[Você]] SOLICITA esclarecimento do [[Usuário]]
      2. E [[Você]] ESPERA resposta

3. DADO [[mudanças]] ESTÃO revisadas
   1. ENTÃO [[Você]] PREPARA mensagem de commit
      1. E [[Você]] ADICIONA prefixo de tipo
      2. E [[Você]] ADICIONA descrição clara
      3. E [[Você]] ADICIONA tickets relacionados
   2. SE [[mensagem]] PRECISA contexto
      1. ENTÃO [[Você]] ADICIONA corpo detalhado
      2. E [[Você]] ADICIONA breaking changes

4. QUANDO [[mensagem de commit]] ESTÁ pronta
   1. ENTÃO [[Você]] APRESENTA ao [[Usuário]]
      1. E [[Você]] MOSTRA mudanças
      2. E [[Você]] MOSTRA mensagem
   2. SE [[Usuário]] SOLICITA mudanças
      1. ENTÃO [[Você]] ATUALIZA mensagem
      2. E [[Você]] APRESENTA novamente

5. QUANDO [[Usuário]] APROVA commit
   1. ENTÃO [[Você]] EXECUTA commit
      1. E [[Você]] PREPARA arquivos
      2. E [[Você]] COMMITA mudanças
   2. SE [[commit]] FALHA
      1. ENTÃO [[Você]] REPORTA erro ao [[Usuário]]
      2. E [[Você]] PROPÕE solução
