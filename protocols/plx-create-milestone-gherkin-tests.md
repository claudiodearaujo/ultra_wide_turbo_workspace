---
document_type: protocol
goal: criar testes Gherkin especificamente para critérios de aceitação de milestone
gpt_action: siga estes passos ao criar testes Gherkin para milestones
---

CONTEXTO: O [[User]] precisa de testes Gherkin padronizados criados especificamente para critérios de aceitação de milestone. Cada milestone deve ter seu próprio arquivo de teste separado.

1. DADO QUE [[You]] LÊ [[your-milestones]]
   1. ENTÃO [[You]] IDENTIFICA cada [[milestone]]
      1. E [[You]] CRIA nome do arquivo de teste
         1. E [[You]] USA nome do milestone
         2. E [[You]] CONVERTE para dart underscore case
         3. E [[You]] ADICIONA sufixo "_test"
   2. SE [[milestone]] NÃO TEM critérios claros
      1. ENTÃO [[You]] PERGUNTA ao [[User]]
      2. E [[You]] AGUARDA resposta

2. QUANDO [[You]] PROCESSA [[milestone]]
   1. ENTÃO [[You]] EXTRAI critérios de aceitação
      1. E [[You]] IDENTIFICA comportamentos testáveis
      2. E [[You]] IGNORA requisitos não relacionados ao milestone
   2. SE [[criteria]] NÃO ESTÁ claro
      1. ENTÃO [[You]] PERGUNTA ao [[User]]
      2. E [[You]] AGUARDA resposta

3. DADO QUE [[You]] TEM critérios
   1. ENTÃO [[You]] CRIA bloco Feature
      1. E [[You]] USA nome do milestone
      2. E [[You]] ADICIONA descrição do milestone
   2. ENTÃO [[You]] CRIA blocos Scenario
      1. E [[You]] FOCA no escopo do milestone
      2. E [[You]] ESCREVE passos Given
      3. E [[You]] ESCREVE passos When
      4. E [[You]] ESCREVE passos Then
   3. SE [[scenario]] PRECISA de exemplos
      1. ENTÃO [[You]] ADICIONA Scenario Outline
      2. E [[You]] ADICIONA tabela Examples

4. QUANDO [[You]] ESCREVE testes
   1. ENTÃO [[You]] GARANTE isolamento de teste
      1. E [[You]] TESTA apenas funcionalidades do milestone
      2. E [[You]] EVITA testar funcionalidades externas
   2. SE [[test]] ESTÁ fora do escopo
      1. ENTÃO [[You]] REMOVE teste
      2. E [[You]] CONTINUA próximo teste

5. DADO QUE [[tests]] ESTÃO completos
   1. ENTÃO [[You]] VERIFICA cobertura
      1. E [[You]] CHECA critérios do milestone
      2. E [[You]] GARANTE que não há escopo expandido
   2. SE [[User]] ACEITA testes
      1. ENTÃO [[You]] SALVA arquivo de teste
      2. E [[You]] CONFIRMA conclusão 
