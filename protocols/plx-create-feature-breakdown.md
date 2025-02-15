---
document_type: protocol
goal: criar breakdowns de recursos estruturados e envolventes seguindo nosso formato padrão
gpt_action: seguir estes passos quando o usuário quer criar um novo breakdown de recurso
---

CONTEXTO: O [[Usuário]] quer criar um novo breakdown de recurso e precisa que você gerencie o processo de criação seguindo nosso formato e estrutura padrão.

1. DADO [[Usuário]] EXECUTA comando plx-create-feature-breakdown
   1. ENTÃO [[Você]] LÊ [[entrada]]
      1. E [[Você]] VERIFICA tipo de recurso
         ```markdown
         # Tipos de Recurso
         - ui          : Componentes de interface do usuário
         - api         : Implementações de API
         - integration : Integrações com terceiros
         - core        : Funcionalidade central
         ```
      2. E [[Você]] VERIFICA parâmetros necessários
         ```markdown
         # Parâmetros Necessários
         - title        : Nome em Pascal Case Com Espaços
         - type         : Um dos tipos de recurso acima
         - difficulty   : 🟢 Fácil | 🟡 Médio | 🔴 Difícil
         - readingTime  : Duração (ex: "15 minutos")
         ```
   2. SE [[entrada]] ESTÁ vazia
      1. ENTÃO [[Você]] PERGUNTA ao [[Usuário]] tipo de recurso
      2. E [[Você]] PERGUNTA parâmetros necessários

2. QUANDO [[Você]] CRIA breakdown
   1. ENTÃO [[Você]] CRIA arquivo no diretório features
      ```markdown
      # Localização do Arquivo
      feature-breakdowns/titulo-em-minusculo-com-hifens.md
      ```
   2. ENTÃO [[Você]] ADICIONA frontmatter
      ```markdown
      # Formato do Frontmatter
      ---
      document_type: feature-breakdown
      title: Título Em Pascal Case
      difficulty: 🟢 | 🟡 | 🔴
      reading_time: "15 minutos"
      feature_type: ui | api | integration | core
      gpt_action: seguir estes passos para entender [título]
      ---
      ```
   3. ENTÃO [[Você]] CRIA seções
      1. E [[Você]] ADICIONA "📝 Sumário"
      2. E [[Você]] ADICIONA "📝 Introdução"
      3. E [[Você]] ADICIONA "🎯 O Plano"
      4. E [[Você]] ADICIONA "💻 Implementação"
      5. E [[Você]] ADICIONA "🧪 Testes"
      6. E [[Você]] ADICIONA "🤔 Reflexão"

3. QUANDO [[Você]] PREENCHE seções
   1. ENTÃO [[Você]] ESCREVE Sumário
      1. E [[Você]] LISTA todas as seções
      2. E [[Você]] ADICIONA estimativas de tempo de leitura
      3. E [[Você]] ADICIONA indicadores de dificuldade
   2. ENTÃO [[Você]] ESCREVE Introdução
      1. E [[Você]] EXPLICA o que e por que
      2. E [[Você]] ADICIONA screenshot da visão geral do recurso
      3. E [[Você]] ADICIONA "Pré-requisitos"
      4. E [[Você]] ADICIONA "O Que Você Aprenderá"
      5. E [[Você]] ADICIONA casos de uso no mundo real
   3. ENTÃO [[Você]] ESCREVE O Plano
      1. E [[Você]] CRIA etapas numeradas
      2. E [[Você]] ADICIONA visualizações conceituais
      3. E [[Você]] ADICIONA "Pense Nisso" perguntas
      4. E [[Você]] ADICIONA abordagens alternativas
   4. ENTÃO [[Você]] ESCREVE Implementação
      1. E [[Você]] ADICIONA snippets de código com comentários
      2. E [[Você]] ADICIONA screenshots de implementação
      3. E [[Você]] ADICIONA GIFs de interação
      4. E [[Você]] ADICIONA "Boxes de Desmontagem de Código"
      5. E [[Você]] ADICIONA "Erros Comuns"
   5. ENTÃO [[Você]] ESCREVE Testes
      1. E [[Você]] CRIA cenários de teste
      2. E [[Você]] ADICIONA screenshots de resultados de teste
      3. E [[Você]] ADICIONA "Dicas de Escrita de Teste"
      4. E [[Você]] ADICIONA estratégias de depuração
   6. ENTÃO [[Você]] ESCREVE Reflexão
      1. E [[Você]] DISCUSSA prós e contras
      2. E [[Você]] ADICIONA notas de desempenho
      3. E [[Você]] ADICIONA considerações de segurança
      4. E [[Você]] ADICIONA melhorias futuras

4. DADO [[breakdown]] ESTÁ pronto
   1. ENTÃO [[Você]] ADICIONA espaços reservados para imagens
      1. E [[Você]] USE formato
         ```markdown
         [SCREENSHOT: Feature overview showing final result]
         [GIF: Key user interactions with the feature]
         [STOCK: Concept visualization for complex parts]
         ```
   2. ENTÃO [[Você]] VERIFICA diretrizes de estilo
      1. E [[Você]] VERIFICA emoticons
      2. E [[Você]] VERIFICA formatação
      3. E [[Você]] VERIFICA quebras de linha
   3. ENTÃO [[Você]] VERIFICA conteúdo
      1. E [[Você]] VERIFICA todas as seções presentes
      2. E [[Você]] VERIFICA exemplos de código
      3. E [[Você]] VERIFICA links
      4. E [[Você]] VERIFICA fluxogramas

NOTA: Lembre-se de usar emoticons para todos os cabeçalhos principais, manter explicações claras e abrangentes e incluir exemplos de código detalhados com comentários detalhados. Cada seção deve seguir exatamente a estrutura de [[how-we-create-feature-breakdowns]]. 
