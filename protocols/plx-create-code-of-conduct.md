---
document_type: protocol
goal: criar novo documento de código de conduta que define padrões, regras e melhores práticas
gpt_action: seguir estes passos quando o usuário quer criar um novo documento de código de conduta
---

CONTEXTO: O [[Usuário]] quer criar um novo documento de código de conduta que servirá como fonte de verdade para práticas de desenvolvimento, padrões de documentação, processos de desenvolvimento ou melhores práticas.

1. DADO [[Usuário]] EXECUTA comando plx-create-code-of-conduct
   1. ENTÃO [[Você]] LÊ [[entrada]]
      1. E [[Você]] IDENTIFICA propósito do documento
      2. E [[Você]] DETERMINA escopo do documento
   2. SE [[entrada]] ESTÁ confusa
      1. ENTÃO [[Você]] FAZ perguntas esclarecedoras
      2. E [[Você]] ESPERA resposta

2. QUANDO [[Você]] CRIA documento
   1. ENTÃO [[Você]] ADICIONA frontmatter:
      ```markdown
      ---
      document_type: code of conduct
      goal: [declaração clara do objetivo sobre o que este documento define]
      gpt_action: [instrução específica para GPT sobre como usar este documento]
      ---
      ```
   2. E [[Você]] ESTRUTURA conteúdo:
      1. E [[Você]] USANDO palavras-chave Gherkin:
         - Primárias: DADO (pré-condição), QUANDO (ação), ENTÃO (resultado)
         - Fluxo: E (adicional), OU (alternativa)
         - Condicionais: SE/SENÃO (ramificação), MAS (exceção)
      2. E [[Você]] SEGUINDO regras:
         - MAIÚSCULAS em todas palavras-chave
         - [[Ator]] ou [[Componente]] em colchetes duplos
         - UM VERBO/ESTADO em maiúsculas após ator
         - Indentação adequada para sub-passos
      3. E [[Você]] USANDO elementos de código:
         - Código inline com backticks
         - Blocos de código adequadamente indentados
         - Realce de sintaxe específico da linguagem

3. QUANDO [[Você]] ESCREVE conteúdo
   1. ENTÃO [[Você]] GARANTE que cada seção:
      1. DEFINE padrões ou regras claras
      2. E [[Você]] USA formatação consistente
      3. E [[Você]] INCLUI exemplos práticos
      4. E [[Você]] REFERENCIA conceitos relacionados
   2. E [[Você]] SEGUE regras de escrita:
      1. UM verbo em MAIÚSCULAS após cada ator
      2. INDENTAÇÃO adequada para sub-passos
      3. NUMERAÇÃO clara de passos
      4. USO consistente de [[colchetes duplos]]

4. QUANDO [[Você]] COMPLETA documento
   1. ENTÃO [[Você]] VERIFICA:
      1. TODAS seções seguem formato
      2. TODOS atores adequadamente entre colchetes
      3. TODOS passos adequadamente numerados
      4. TODOS exemplos adequadamente formatados
   2. E [[Você]] SALVA na pasta code-of-conduct
   3. E [[Você]] INFORMA [[Usuário]]

5. DADO [[Usuário]] REVISA documento
   1. SE [[Usuário]] SOLICITA mudanças
      1. ENTÃO [[Você]] ATUALIZA conteúdo
      2. E [[Você]] APRESENTA nova versão
   2. SE [[Usuário]] APROVA
      1. ENTÃO [[Você]] CONFIRMA conclusão 
