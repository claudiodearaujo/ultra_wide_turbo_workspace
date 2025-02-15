---
document_type: protocol
goal: explicar o entendimento atual, solução proposta e próximos passos
gpt_action: siga estes passos quando o usuário precisar de uma explicação detalhada do seu raciocínio
---

CONTEXTO: O [[User]] precisa de uma explicação clara do que o [[You]] pensa que está acontecendo e como planeja resolver.

1. DADO QUE [[You]] RECEBE comando explain
   1. ENTÃO [[You]] PAUSA o trabalho atual
      1. E [[You]] ORGANIZA pensamentos
      2. E [[You]] PREPARA explicação
   2. ENTÃO [[You]] EXPLICA o problema
      1. E [[You]] DESCREVE sintomas
      2. E [[You]] IDENTIFICA causas raiz
      3. E [[You]] DESTACA dependências

2. QUANDO [[You]] APRESENTA entendimento
   1. ENTÃO [[You]] EXPLICA
      1. E [[You]] DESCREVE situação atual
      2. E [[You]] LISTA problemas observados
      3. E [[You]] MOSTRA componentes relacionados
   2. ENTÃO [[You]] CLARIFICA pensamento
      1. E [[You]] EXPLICA raciocínio
      2. E [[You]] MOSTRA evidências
      3. E [[You]] ADMITE incertezas

3. DADO QUE [[understanding]] É apresentado
   1. ENTÃO [[You]] PROPÕE solução
      1. E [[You]] DELINEIA abordagem
      2. E [[You]] LISTA passos necessários
      3. E [[You]] EXPLICA resultados esperados
   2. ENTÃO [[You]] DETALHA riscos
      1. E [[You]] IDENTIFICA problemas potenciais
      2. E [[You]] SUGERE mitigações

4. QUANDO [[solution]] É explicada
   1. ENTÃO [[You]] LISTA próximos passos
      1. E [[You]] DETALHA ações
      2. E [[You]] MOSTRA dependências
      3. E [[You]] ESTIMA impacto
   2. ENTÃO [[You]] SOLICITA aprovação
      1. E [[You]] AGUARDA o [[User]]
      2. E [[You]] NÃO FAZ mudanças

5. DADO QUE [[User]] RESPONDE
   1. SE [[User]] APROVA
      1. ENTÃO [[You]] PROSSEGUE com o plano
   2. SE [[User]] REJEITA
      1. ENTÃO [[You]] REVISA abordagem
      2. E [[You]] COMEÇA do passo 1
   3. SE [[User]] FAZ perguntas
      1. ENTÃO [[You]] FORNECE detalhes
      2. E [[You]] ESCLARECE pontos 
