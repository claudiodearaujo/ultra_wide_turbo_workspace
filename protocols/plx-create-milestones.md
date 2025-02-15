---
document_type: protocol
goal: criar milestones claros e testáveis com testes em estilo BDD Gherkin
gpt_action: siga estes passos ao criar milestones
---

CONTEXTO: O [[User]] percebe que precisamos de pontos de verificação claros na forma de milestones e deseja que você crie milestones claros e testáveis com testes em estilo BDD Gherkin seguindo os padrões do framework.

1. DADO QUE [[User]] EXECUTA o comando plx-create-milestone
   1. ENTÃO [[You]] EXAMINA entrada
      1. E [[You]] ENCONTRA escopo do [[milestone]]
      2. E [[You]] ENCONTRA requisitos do [[milestone]]
   2. SE [[input]] TEM [[milestone]]
      1. ENTÃO [[You]] FOCA no [[milestone]]
   3. SE [[input]] ESTÁ vazio
      1. ENTÃO [[You]] LÊ [[your-requirements]]
      2. E [[You]] LÊ [[your-ticket]]

2. QUANDO [[You]] INICIA criação
   1. ENTÃO [[You]] LÊ [[requirements]]
      1. E [[You]] ENCONTRA critérios
      2. E [[You]] ENCONTRA especificações
      3. E [[You]] ENCONTRA [[dependencies]]
   2. SE [[requirements]] NÃO ESTÁ claro
      1. ENTÃO [[You]] PERGUNTA ao [[User]]
      2. E [[You]] AGUARDA resposta

3. DADO QUE [[requirements]] ESTÁ claro
   1. ENTÃO [[You]] CRIA seção
      1. E [[You]] ADICIONA emoji
      2. E [[You]] ESCREVE título
      3. E [[You]] ESCREVE descrição
   2. SE [[milestone]] PRECISA de detalhes
      1. ENTÃO [[You]] ADICIONA especificações
      2. E [[You]] ADICIONA [[dependencies]]

4. QUANDO [[milestone]] ESTÁ pronto
   1. ENTÃO [[You]] ESCREVE [[tests]]
      ```gherkin
      Feature: [Nome do Milestone]
        
      Scenario: [Cenário de Teste]
        GIVEN [contexto inicial]
        WHEN [ação ocorre]
        THEN [resultado é verificado]
        AND [resultados adicionais]
      ```
   2. SE [[tests]] PRECISA de casos
      1. ENTÃO [[You]] ADICIONA casos de borda
      2. E [[You]] ADICIONA erros

5. DADO QUE [[milestone]] TEM [[tests]]
   1. ENTÃO [[You]] VERIFICA qualidade
      1. E [[You]] VERIFICA cobertura
      2. E [[You]] VERIFICA clareza
      3. E [[You]] VERIFICA testabilidade
   2. SE [[milestone]] PRECISA de correções
      1. ENTÃO [[You]] CORRIGE [[milestone]]
      2. E [[You]] VERIFICA novamente

6. QUANDO [[milestone]] ESTÁ pronto
   1. ENTÃO [[You]] MOSTRA ao [[User]]
      1. E [[You]] APRESENTA [[milestone]]
      2. E [[You]] EXPLICA [[tests]]
   2. SE [[User]] ACEITA [[milestone]]
      1. ENTÃO [[You]] SALVA [[your-milestones]]
      2. E [[You]] ATUALIZA documentos
   3. SE [[User]] QUER mudanças
      1. ENTÃO [[You]] EDITA [[milestone]]
      2. E [[You]] MOSTRA novamente

7. DADO QUE [[milestone]] ESTÁ salvo
   1. ENTÃO [[You]] CRIA [[tasks]]
      1. E [[You]] LISTA passos
      2. E [[You]] LISTA [[tests]]
   2. SE [[tasks]] ESTÁ pronto
      1. ENTÃO [[You]] SALVA [[your-todo-list]]
      2. E [[You]] INFORMA ao [[User]] 
