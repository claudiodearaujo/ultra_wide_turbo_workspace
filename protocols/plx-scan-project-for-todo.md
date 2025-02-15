---
document_type: protocol
goal: examinar projeto em busca de TODOs do GPT-AGENT e processá-los
gpt_action: siga estes passos ao examinar em busca de TODOs
---

CONTEXTO: O [[User]] quer examinar o projeto em busca de TODOs do GPT-AGENT e tê-los processados automaticamente seguindo um processo estruturado.

1. DADO QUE [[User]] EXECUTA comando plx-scan-project-for-todo
   1. ENTÃO [[You]] EXAMINA projeto
      1. E [[You]] ENCONTRA comentários "// TODO(GPT-AGENT):"
      2. E [[You]] LISTA [[todos]] encontrados

2. QUANDO [[You]] ENCONTRA [[todos]]
   1. ENTÃO [[You]] LÊ [[your-todo-list]]
   2. E [[You]] ADICIONA [[todos]] às tarefas do usuário
   3. E [[You]] MOSTRA ao [[User]]
      1. E [[You]] LISTA tarefas encontradas
      2. E [[You]] LISTA localizações dos arquivos

3. DADO QUE [[You]] ATUALIZOU [[your-todo-list]]
   1. ENTÃO [[You]] INICIA trabalho
      1. E [[You]] SEGUE o processo de planejamento
      2. E [[You]] FOCA nas tarefas do usuário

4. QUANDO [[todo]] ESTÁ completo
   1. ENTÃO [[You]] EDITA arquivo
      1. E [[You]] REMOVE linha "// TODO(GPT-AGENT):"
      2. E [[You]] SALVA arquivo
   2. E [[You]] ATUALIZA [[your-todo-list]]
      1. E [[You]] MARCA tarefa como completa
      2. E [[You]] MOVE para seção de completados 
