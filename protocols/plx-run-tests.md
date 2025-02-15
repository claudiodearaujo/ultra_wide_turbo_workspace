---
document_type: protocol
goal: executar testes e lidar com falhas uma por vez seguindo o processo de teste
gpt_action: siga estes passos ao executar testes
---

CONTEXTO: O [[User]] quer que você execute o processo de teste lidando com falhas uma por vez.

1. DADO QUE [[User]] EXECUTA comando plx-test
   1. ENTÃO [[You]] LÊ [[input]]
      1. E [[You]] ENCONTRA escopo do [[test]]
      2. E [[You]] ENCONTRA tipo do [[test]]
   2. SE [[input]] TEM escopo
      1. ENTÃO [[You]] FOCA no escopo
   3. SE [[input]] ESTÁ vazio
      1. ENTÃO [[You]] EXECUTA todos os [[tests]]

2. QUANDO [[You]] INICIA [[testing process]]
   1. ENTÃO [[You]] EXECUTA [[tests]]
   2. SE [[tests]] FALHAM
      1. ENTÃO [[You]] ENCONTRA primeiro [[test]] falhando
      2. E [[You]] DEFINE [[attempt]] como 1
      3. E [[You]] INFORMA [[User]]

3. DADO QUE [[You]] TEM [[test]] falhando
   1. ENTÃO [[You]] LÊ [[test]]
   2. E [[You]] EXAMINA base de código
   3. E [[You]] CRIA [[fix approach]]
   4. E [[You]] MOSTRA ao [[User]]
      1. SE [[User]] ACEITA [[fix approach]]
         1. ENTÃO [[You]] INICIA implementação
      2. SE [[User]] REJEITA [[fix approach]]
         1. ENTÃO [[You]] CRIA nova [[fix approach]]

4. QUANDO [[You]] IMPLEMENTA [[fix approach]]
   1. ENTÃO [[You]] EXECUTA [[tests]]
      1. SE primeiro [[test]] PASSA
         1. ENTÃO [[You]] INICIA [[testing process]]
      2. SE primeiro [[test]] FALHA
         1. ENTÃO [[You]] ADICIONA 1 ao [[attempt]]
         2. E [[You]] VERIFICA [[attempt]]
            1. SE [[attempt]] ESTÁ abaixo de 3
               1. ENTÃO [[You]] REPETE a partir do passo 3
            2. SE [[attempt]] É 3
               1. ENTÃO [[You]] INICIA análise

5. DADO QUE [[You]] PRECISA de análise
   1. ENTÃO [[You]] EXAMINA base de código
   2. E [[You]] LÊ documentação
   3. E [[You]] VERIFICA dependências
   4. E [[You]] CRIA nova [[strategy]]
   5. E [[You]] MOSTRA ao [[User]]
      1. SE [[User]] ACEITA [[strategy]]
         1. ENTÃO [[You]] REINICIA [[attempt]]
         2. E [[You]] INICIA implementação
      2. SE [[User]] REJEITA [[strategy]]
         1. ENTÃO [[You]] CRIA nova [[strategy]]

6. QUANDO [[tests]] PASSAM
   1. ENTÃO [[You]] SALVA mudanças
   2. E [[You]] ATUALIZA [[your-todo-list]]
   3. E [[You]] INFORMA [[User]]
