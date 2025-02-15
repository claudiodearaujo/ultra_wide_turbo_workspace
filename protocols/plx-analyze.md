---
document_type: protocol
goal: analisar entrada e apresentar descobertas sem tomar ação
gpt_action: seguir estes passos quando o usuário quer análise de algo
---

CONTEXTO: O [[Usuário]] quer análise de algo baseado em sua entrada. O [[Você]] deve analisar e apresentar descobertas mas NÃO tomar nenhuma ação até explicitamente instruído.

1. DADO [[Usuário]] EXECUTA comando plx-analyze
   1. ENTÃO [[Você]] LÊ [[entrada]]
      1. E [[Você]] IDENTIFICA assunto da análise
      2. E [[Você]] DETERMINA escopo da análise
   2. SE [[entrada]] ESTÁ confusa
      1. ENTÃO [[Você]] FAZ perguntas esclarecedoras
      2. E [[Você]] ESPERA resposta

2. QUANDO [[Você]] ENTENDE assunto
   1. ENTÃO [[Você]] EXAMINA fontes relevantes:
      1. E [[Você]] VERIFICA base de código se relacionado a código
      2. E [[Você]] LÊ documentação se relacionado a processo
      3. E [[Você]] REVISA contexto se relacionado a conceito
   2. SE [[Você]] PRECISA mais informação
      1. ENTÃO [[Você]] FAZ perguntas específicas
      2. E [[Você]] ESPERA resposta

3. QUANDO [[Você]] TEM informação suficiente
   1. ENTÃO [[Você]] ESTRUTURA análise:
      ```markdown
      # 🔍 Resultados da Análise

      ## 📋 Visão Geral
      > Breve resumo do que foi analisado

      ## 🎯 Principais Descobertas
      > - Ponto importante 1
      > - Ponto importante 2
      > - Ponto importante 3

      ## 💡 Insights
      > Observações e padrões mais profundos

      ## ⚠️ Considerações
      > Fatores importantes a considerar

      ## 🤔 Conclusão
      > Avaliação final
      ```

4. QUANDO [[Você]] APRESENTA análise
   1. ENTÃO [[Você]] ESPERA resposta do [[Usuário]]
   2. E [[Você]] NÃO toma nenhuma ação
   3. E [[Você]] NÃO faz nenhuma mudança
   4. E [[Você]] NÃO prossegue com implementação

5. DADO [[Usuário]] RESPONDE à análise
   1. SE [[Usuário]] SOLICITA esclarecimento
      1. ENTÃO [[Você]] FORNECE detalhes adicionais
      2. E [[Você]] CONTINUA esperando
   2. SE [[Usuário]] SOLICITA mudanças
      1. ENTÃO [[Você]] ATUALIZA análise
      2. E [[Você]] APRESENTA nova versão
   3. SE [[Usuário]] DÁ próximos passos
      1. ENTÃO [[Você]] SEGUE novas instruções 
