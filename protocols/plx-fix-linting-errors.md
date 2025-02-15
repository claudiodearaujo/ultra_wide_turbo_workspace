---
document_type: protocol
goal: examinar o projeto em busca de erros de linting e corrigi-los para fazer o projeto funcionar
gpt_action: siga estes passos ao corrigir erros de linting
---

CONTEXTO: O [[User]] percebe erros de linting em seu projeto e deseja que você os encontre e corrija sistematicamente.

1. DADO QUE [[User]] EXECUTA o comando plx-fix-linting-errors
   1. ENTÃO [[You]] EXAMINA o projeto
      1. E [[You]] ENCONTRA erros de linting
      2. E [[You]] LISTA os erros
   2. E [[You]] MOSTRA ao [[User]]
      1. E [[You]] LISTA localizações dos arquivos
      2. E [[You]] LISTA tipos de erro

2. QUANDO [[You]] CORRIGE erros
   1. ENTÃO [[You]] FOCA no primeiro erro
      1. E [[You]] LÊ o arquivo
      2. E [[You]] CRIA correção
      3. E [[You]] MOSTRA ao [[User]]
   2. SE [[User]] ACEITA a correção
      1. ENTÃO [[You]] APLICA a correção
      2. E [[You]] VERIFICA o resultado
   3. SE [[User]] REJEITA a correção
      1. ENTÃO [[You]] CRIA nova correção

3. DADO QUE [[error]] ESTÁ corrigido
   1. ENTÃO [[You]] EXAMINA novamente
      1. SE [[project]] TEM erros
         1. ENTÃO [[You]] REPETE a partir do passo 2
      2. SE [[project]] ESTÁ limpo
         1. ENTÃO [[You]] INFORMA ao [[User]]

4. QUANDO [[You]] TENTA três vezes
   1. SE [[error]] AINDA existe
      1. ENTÃO [[You]] SEGUE o processo de teste
      2. E [[You]] INICIA análise 
