---
document_type: protocol
goal: criar testes BDD em your-tests.md baseado na entrada do usuário
gpt_action: siga estes passos para gerar testes para o conteúdo especificado
---

CONTEXTO: O [[User]] quer criar testes BDD para uma funcionalidade, requisito ou milestone específico e precisa que você gere os cenários de teste no arquivo [[your-tests.md]].

1. DADO QUE [[User]] EXECUTA o comando @plx-create-tests
   1. ENTÃO [[You]] LÊ [[input]]
      1. SE [[input]] REFERENCIA outros arquivos ou milestones
         1. ENTÃO [[You]] EXAMINA conteúdo referenciado
         2. E [[You]] EXTRAI detalhes relevantes
      2. SE [[input]] DESCREVE nova funcionalidade ou requisito
         1. ENTÃO [[You]] IDENTIFICA cenários testáveis
      3. SE [[input]] FORNECE casos de teste específicos
         1. ENTÃO [[You]] USA cenários fornecidos
   2. SE [[input]] ESTÁ vazio ou não está claro
      1. ENTÃO [[You]] PEDE esclarecimento ao [[User]]

2. QUANDO [[You]] INICIA criação de teste
   1. ENTÃO [[You]] DETERMINA [[milestone]] relevante
      1. SE [[milestone]] EXISTE em [[your-milestones.md]]
         1. ENTÃO [[You]] USA [[milestone]] existente
      2. SE [[milestone]] NÃO EXISTE
         1. ENTÃO [[You]] CRIA novo [[milestone]]
         2. E [[You]] ATUALIZA [[your-milestones.md]]
   2. E [[You]] ABRE [[your-tests.md]]
      1. E [[You]] ENCONTRA seção do [[milestone]]
      2. SE seção do [[milestone]] NÃO EXISTE
         1. ENTÃO [[You]] CRIA seção do [[milestone]]

3. DADO QUE seção do [[milestone]] ESTÁ pronta
   1. ENTÃO [[You]] ESCREVE cenários de teste
      1. E [[You]] USA estilo BDD Gherkin
         ```gherkin
         ### Scenario: Título do Caso de Teste
         - Given algum contexto inicial
         - When alguma ação é tomada
         - Then algum resultado esperado
         ```
      2. E [[You]] COBRE caminhos felizes
      3. E [[You]] COBRE casos de borda
      4. E [[You]] COBRE tratamento de erros
   2. SE [[test scenarios]] PRECISAM de refinamento
      1. ENTÃO [[You]] REVISA [[test scenarios]]
      2. E [[You]] CLARIFICA passos
      3. E [[You]] ADICIONA casos faltantes

4. QUANDO [[test scenarios]] ESTÃO completos
   1. ENTÃO [[You]] SALVA [[your-tests.md]]
   2. E [[You]] ATUALIZA [[your-todo-list.md]]
      1. E [[You]] ADICIONA tarefa para implementar testes
   3. E [[You]] CONFIRMA conclusão com [[User]]

5. DADO QUE [[User]] ACEITA [[test scenarios]]
   1. ENTÃO [[You]] PROSSEGUE com implementação
   2. E [[You]] SEGUE o processo de teste

6. SE [[User]] SOLICITA mudanças em [[test scenarios]]
   1. ENTÃO [[You]] ATUALIZA [[your-tests.md]]
   2. E [[You]] REPETE a partir do passo 4 
