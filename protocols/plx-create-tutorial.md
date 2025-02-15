---
document_type: protocol
goal: criar tutoriais estruturados e envolventes seguindo nosso formato padrão
gpt_action: siga estes passos quando o usuário quiser criar um novo tutorial
---

CONTEXTO: O [[User]] quer criar um novo tutorial e precisa que você gerencie o processo de criação seguindo nosso formato e estrutura padrão.

1. DADO QUE [[User]] EXECUTA o comando plx-create-tutorial
   1. ENTÃO [[You]] LÊ [[input]]
      1. E [[You]] VERIFICA tipo de tutorial
         ```markdown
         # Tipos de Tutorial
         - feature      : Como usar uma funcionalidade
         - concept      : Explicando um conceito
         - integration : Configurando integrações
         - workflow    : Processo passo a passo
         ```
      2. E [[You]] VERIFICA parâmetros necessários
         ```markdown
         # Parâmetros Necessários
         - title         : Nome em Pascal Case Com Espaços
         - type          : Um dos tipos de tutorial acima
         - difficulty    : 🟢 Iniciante | 🟡 Intermediário | 🔴 Avançado
         - estimatedTime : Duração (ex: "30 minutos")
         ```
   2. SE [[input]] ESTÁ vazio
      1. ENTÃO [[You]] PERGUNTA ao [[User]] o tipo de tutorial
      2. E [[You]] PERGUNTA os parâmetros necessários

2. QUANDO [[You]] CRIA tutorial
   1. ENTÃO [[You]] CRIA arquivo no diretório tutorials
      ```markdown
      # Localização do Arquivo
      tutorials/titulo-em-minusculo-com-tracos.md
      ```
   2. ENTÃO [[You]] ADICIONA frontmatter
      ```markdown
      # Formato do Frontmatter
      ---
      document_type: tutorial
      title: Titulo Em Pascal Case
      difficulty: 🟢 | 🟡 | 🔴
      time_estimate: "30 minutos"
      tutorial_type: feature | concept | integration | process
      gpt_action: siga estes passos para aprender [título]
      ---
      ```
   3. ENTÃO [[You]] CRIA seções
      1. E [[You]] ADICIONA "📝 Sumário"
      2. E [[You]] ADICIONA "📝 Introdução"
      3. E [[You]] ADICIONA "🎯 Abordagem Sugerida"
      4. E [[You]] ADICIONA "👨‍🏫 Tutorial"
      5. E [[You]] ADICIONA "✅ Checklist"

3. QUANDO [[You]] PREENCHE seções
   1. ENTÃO [[You]] ESCREVE Sumário
      1. E [[You]] LISTA todas as seções
      2. E [[You]] ADICIONA estimativas de tempo
      3. E [[You]] ADICIONA indicadores de dificuldade
   2. ENTÃO [[You]] ESCREVE Introdução
      1. E [[You]] EXPLICA o quê, como, por quê
      2. E [[You]] ADICIONA "O Que Você Vai Aprender"
      3. E [[You]] ADICIONA "Pré-requisitos"
      4. E [[You]] ADICIONA "Objetivos de Aprendizagem"
   3. ENTÃO [[You]] ESCREVE Abordagem Sugerida
      1. E [[You]] CRIA checklist
      2. E [[You]] ADICIONA indicadores de dificuldade
      3. E [[You]] ADICIONA sugestões "Pense Sobre Isso"
   4. ENTÃO [[You]] ESCREVE Tutorial
      1. E [[You]] ADICIONA exemplos de código
      2. E [[You]] ADICIONA explicações
      3. E [[You]] ADICIONA "Tente Você Mesmo"
      4. E [[You]] ADICIONA "Erros Comuns"
   5. ENTÃO [[You]] ESCREVE Checklist
      1. E [[You]] LISTA pontos de verificação
      2. E [[You]] ADICIONA "Guia de Solução de Problemas"
      3. E [[You]] ADICIONA "Próximos Passos"

4. DADO QUE [[tutorial]] ESTÁ pronto
   1. ENTÃO [[You]] ADICIONA marcadores de imagem
      1. E [[You]] USA formato
         ```markdown
         [SCREENSHOT: Descrição]
         [GIF: Descrição]
         [STOCK: Descrição]
         ```
   2. ENTÃO [[You]] VERIFICA diretrizes de estilo
      1. E [[You]] CHECA emoticons
      2. E [[You]] CHECA formatação
      3. E [[You]] CHECA quebras de linha
   3. ENTÃO [[You]] VERIFICA conteúdo
      1. E [[You]] CHECA todas as seções presentes
      2. E [[You]] CHECA exemplos de código
      3. E [[You]] CHECA links

NOTA: Lembre-se de usar emoticons para todos os cabeçalhos principais, manter explicações concisas e amigáveis para iniciantes, e incluir exemplos práticos de código com comentários detalhados. Cada seção deve seguir a estrutura exata de [[how-we-create-tutorials]]. 
