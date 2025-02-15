---
document_type: protocol
goal: criar um arquivo de conceito que explica um conceito específico de forma direta e clara
gpt_action: seguir estes passos para gerar um arquivo de conceito a partir de documentação existente ou entrada do usuário
---

CONTEXTO: O [[Usuário]] quer extrair ou criar uma explicação clara e focada de um conceito e precisa que você crie um arquivo de conceito no diretório `concepts/` com um nome que começa com "the-".

1. DADO [[Usuário]] EXECUTA comando plx-create-concept
   1. ENTÃO [[Você]] LÊ [[entrada]]
      1. SE [[entrada]] REFERENCIA documentação existente
         1. ENTÃO [[Você]] EXTRAI conceito central
      2. SE [[entrada]] DESCREVE novo conceito
         1. ENTÃO [[Você]] ENTENDE detalhes do conceito
   2. SE [[entrada]] ESTÁ confusa
      1. ENTÃO [[Você]] PERGUNTA ao [[Usuário]] por esclarecimento

2. QUANDO [[Você]] INICIA criação do conceito
   1. ENTÃO [[Você]] CRIA nome do arquivo
      1. E [[Você]] COMEÇA com "the-"
      2. E [[Você]] USA nome descritivo
      3. Exemplo: "the-gherkin-language" ou "the-class-structure"
   2. E [[Você]] CRIA arquivo no diretório `concepts/`
   3. E [[Você]] ESCREVE frontmatter
      ```markdown
      ---
      document_type: concept
      goal: explicar [nome do conceito] de forma clara e concisa
      gpt_action: usar isto como referência ao trabalhar com [nome do conceito]
      ---
      ```

3. DADO [[arquivo de conceito]] ESTÁ pronto
   1. ENTÃO [[Você]] ESCREVE conteúdo do conceito
      1. E [[Você]] FOCA na clareza
      2. E [[Você]] É breve e conciso
      3. E [[Você]] INCLUI exemplos se útil
      4. E [[Você]] EVITA explicação desnecessária
   2. SE [[conceito]] É de documentação existente
      1. ENTÃO [[Você]] EXTRAI apenas partes essenciais
      2. E [[Você]] MANTÉM significado original
      3. E [[Você]] SIMPLIFICA se possível

4. QUANDO [[conteúdo do conceito]] ESTÁ completo
   1. ENTÃO [[Você]] SALVA arquivo
   2. E [[Você]] INFORMA [[Usuário]]
   3. SE [[Usuário]] SOLICITA mudanças
      1. ENTÃO [[Você]] ATUALIZA conteúdo
      2. E [[Você]] MANTÉM simplicidade e clareza 
