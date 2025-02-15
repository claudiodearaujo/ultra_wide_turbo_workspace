---
document_type: protocol
goal: criar e apresentar um plano estruturado no chat para feedback do usuário
gpt_action: siga estes passos quando o usuário quiser um plano apresentado no chat
---

CONTEXTO: O [[User]] quer ver um plano estruturado com milestones e tarefas atômicas apresentado diretamente no chat para revisão e feedback antes de prosseguir com a implementação.

1. DADO QUE [[User]] EXECUTA o comando plx-create-plan-in-chat
   1. ENTÃO [[You]] LÊ [[input]]
      1. E [[You]] IDENTIFICA escopo do projeto
      2. E [[You]] IDENTIFICA entregas principais
   2. SE [[input]] NÃO ESTÁ claro
      1. ENTÃO [[You]] PEDE esclarecimento ao [[User]]
      2. E [[You]] AGUARDA resposta

2. QUANDO [[You]] CRIA plano
   1. ENTÃO [[You]] ESTRUTURA plano no chat:
      ```markdown
      # 📋 Plano de Implementação

      # 🚀 [M1] Nome do Primeiro Milestone
      > - Tarefa ou entrega principal
      > - Outra tarefa importante
      > - Requisito técnico
      > - Testes BDD para este milestone estão definidos em [[your-tests.md]]

      # 🚀 [M2] Nome do Segundo Milestone
      > - Tarefa ou entrega principal
      > - Outra tarefa importante
      > - Requisito técnico
      > - Testes BDD para este milestone estão definidos em [[your-tests.md]]
      ```
   2. E [[You]] GARANTE que cada milestone
      1. TEM propósito claro e focado
      2. LISTA entregas principais
      3. REFERENCIA requisitos de teste

3. QUANDO [[You]] APRESENTA plano
   1. ENTÃO [[You]] MOSTRA plano no chat
   2. E [[You]] PEDE feedback ao [[User]]:
      ```markdown
      Por favor, revise este plano e me avise se você gostaria de:
      1. 🔄 Ajustes nos milestones
      2. ➕ Tarefas adicionais
      3. 🗑️ Tarefas para remover
      4. ✅ Prosseguir com a implementação
      ```

4. DADO QUE [[User]] FORNECE feedback
   1. SE [[User]] SOLICITA mudanças
      1. ENTÃO [[You]] ATUALIZA plano
      2. E [[You]] APRESENTA versão atualizada
      3. E [[You]] REPETE até ser aprovado
   2. SE [[User]] APROVA plano
      1. ENTÃO [[You]] PERGUNTA como prosseguir:
         ```markdown
         Você gostaria que eu:
         1. 📝 Criasse este plano em your-milestones.md
         2. ✅ Começasse a implementar o primeiro milestone
         3. 📋 Mantivesse apenas como referência
         ```

5. QUANDO [[User]] ESCOLHE ação
   1. SE [[User]] QUER plano salvo
      1. ENTÃO [[You]] USA @plx-create-milestone
   2. SE [[User]] QUER implementação
      1. ENTÃO [[You]] INICIA primeiro milestone
   3. SE [[User]] QUER apenas referência
      1. ENTÃO [[You]] MANTÉM plano no chat
      2. E [[You]] AGUARDA instruções adicionais 
