---
document_type: code of conduct
goal: definir processo para criar e publicar posts de blog no Ghost
gpt_action: siga estes passos ao criar e publicar conteúdo de blog
---

# 🎯 Processo de Publicação de Blog

1. [[You]] [[prepara conteúdo]]
   1. [[prepara conteúdo]]
      1. Cria arquivo markdown com extensão `.md`
      2. Adiciona frontmatter necessário:
         ```markdown
         ---
         title: Título do Seu Post
         tags: 
           - tag1
           - tag2
         featured: false
         excerpt: Uma breve descrição do seu post
         ---
         ```
      3. Escreve conteúdo usando formatação markdown
      4. Adiciona blocos de código com realce de sintaxe adequado
      5. Inclui e referencia imagens se necessário

2. [[You]] [[configura ambiente]]
   1. [[configura ambiente]]
      1. Verifica se arquivo `.env` existe em `ghost/scripts`
      2. Garante que variáveis necessárias estão definidas:
         ```
         GHOST_URL=https://your-blog-url
         GHOST_ADMIN_API_KEY=your-admin-api-key
         ```

3. [[You]] [[publica rascunho]]
   1. [[publica rascunho]]
      1. Navega para diretório de scripts:
         ```bash
         cd ghost/scripts
         ```
      2. Executa script de publicação:
         ```bash
         npm start -- publish path/to/your-post.md
         ```
      3. Verifica criação do rascunho no painel admin do Ghost

4. [[You]] [[revisa conteúdo]]
   1. [[revisa conteúdo]]
      1. Faz login no painel admin do Ghost
      2. Localiza post na seção Rascunhos
      3. Visualiza conteúdo renderizado
      4. Verifica formatação e estilo
      5. Faz ajustes necessários
      6. Publica quando pronto

# ✅ Requisitos de Conteúdo

1. [[You]] [[verifica post]]
   1. [[verifica post]]
      1. Frontmatter está completo
         - Título está definido
         - Tags estão definidas
         - Resumo está fornecido
      2. Conteúdo está adequadamente formatado
         - Sintaxe markdown está correta
         - Blocos de código têm linguagem especificada
         - Imagens estão adequadamente vinculadas
      3. Ambiente está configurado
         - Variáveis estão definidas
         - Valores estão seguros
         - Permissões de script estão corretas

# 🔍 Processo de Revisão

1. [[You]] [[revisão final]]
   1. [[revisão final]]
      1. Verifica renderização do conteúdo
      2. Verifica formatação de blocos de código
      3. Confirma exibição de imagens
      4. Revisa informações meta
      5. Testa layout responsivo
      6. Valida links e referências

# ⚠️ Diretrizes Importantes

1. [[You]] [[segue diretrizes]]
   1. [[segue diretrizes]]
      1. Sempre publica como rascunho primeiro
      2. Nunca comita variáveis de ambiente
      3. Usa formatação markdown adequada
      4. Inclui todos os metadados necessários
      5. Testa completamente na visualização
      6. Obtém revisão por pares quando possível
```
