---
document_type: protocol
goal: criar estudos de caso envolventes e valiosos que demonstrem sucesso e aprendizados do projeto
gpt_action: seguir estes passos quando o usuário quer criar um estudo de caso
---

CONTEXTO: O [[Usuário]] quer criar um estudo de caso para demonstrar um projeto de cliente ou implementação técnica, destacando principais aprendizados e valor entregue.

1. DADO [[Usuário]] EXECUTA comando plx-create-case-study
   1. ENTÃO [[Você]] LÊ [[entrada]]
      1. E [[Você]] VERIFICA tipo de estudo de caso
         ```markdown
         # Tipos de Estudo de Caso
         - client      : Demonstração de projeto de cliente
         - technical   : Análise profunda de implementação técnica
         - process     : História de melhoria de processo
         - innovation  : Nova solução ou abordagem
         ```
      2. E [[Você]] VERIFICA parâmetros necessários
         ```markdown
         # Parâmetros Necessários
         - title          : Nome em Title Case
         - type          : Um dos tipos de estudo de caso acima
         - industry      : Indústria do cliente ou domínio técnico
         - duration      : Período do projeto
         - target        : Público-alvo (clientes/desenvolvedores/etc)
         - platforms     : Onde publicar (website/LinkedIn/etc)
         ```
   2. SE [[entrada]] ESTÁ vazia
      1. ENTÃO [[Você]] PERGUNTA ao [[Usuário]] tipo de estudo de caso
      2. E [[Você]] PERGUNTA parâmetros necessários

2. QUANDO [[Você]] CRIA estudo de caso
   1. ENTÃO [[Você]] CRIA arquivo no diretório case-studies
      ```markdown
      # Localização do Arquivo
      case-studies/titulo-em-kebab-case.md
      ```
   2. ENTÃO [[Você]] ADICIONA frontmatter
      ```markdown
      # Formato do Frontmatter
      ---
      document_type: case-study
      title: Título Em Title Case
      type: client | technical | process | innovation
      industry: Indústria do Cliente ou Domínio
      duration: Duração do Projeto
      target_audience: Leitores Alvo
      platforms: [Website, LinkedIn]
      gpt_action: seguir estes passos para documentar [título] do estudo de caso
      ---
      ```
   3. ENTÃO [[Você]] CRIA seções
      1. E [[Você]] ADICIONA "🎯 Resumo Executivo"
      2. E [[Você]] ADICIONA "🔍 Desafio"
      3. E [[Você]] ADICIONA "💡 Solução"
      4. E [[Você]] ADICIONA "⚙️ Implementação"
      5. E [[Você]] ADICIONA "📊 Resultados"
      6. E [[Você]] ADICIONA "🎓 Principais Aprendizados"
      7. E [[Você]] ADICIONA "👥 Depoimentos"

3. QUANDO [[Você]] PREENCHE seções
   1. ENTÃO [[Você]] ESCREVE Resumo Executivo
      1. E [[Você]] HIGHLIGHT principais conquistas
      2. E [[Você]] ADICIONA métricas convincentes
      3. E [[Você]] INCLUI proposta de valor
   2. ENTÃO [[Você]] ESCREVE Desafio
      1. E [[Você]] DESCREVE situação inicial
      2. E [[Você]] EXPLICA pontos de dor
      3. E [[Você]] ADICIONA impacto no negócio
      4. E [[Você]] INCLUI restrições
   3. ENTÃO [[Você]] ESCREVE Solução
      1. E [[Você]] DESCREVE abordagem
      2. E [[Você]] EXPLICA decisões-chave
      3. E [[Você]] ADICIONA arquitetura da solução
      4. E [[Você]] HIGHLIGHT inovações
   4. ENTÃO [[Você]] ESCREVE Implementação
      1. E [[Você]] DESCREVE processo
      2. E [[Você]] ADICIONA detalhes técnicos
      3. E [[Você]] INCLUI desafios superados
      4. E [[Você]] ADICIONA exemplos de código se relevantes
   5. ENTÃO [[Você]] ESCREVE Resultados
      1. E [[Você]] LISTA conquistas
      2. E [[Você]] ADICIONA métricas e KPIs
      3. E [[Você]] INCLUI impacto no negócio
      4. E [[Você]] ADICIONA ROI se aplicável
   6. ENTÃO [[Você]] ESCREVE Principais Aprendizados
      1. E [[Você]] COMPARTILHAR insights obtidos
      2. E [[Você]] ADICIONAR boas práticas
      3. E [[Você]] INCLUIR dicas para outros
   7. ENTÃO [[Você]] ADICIONAR Depoimentos
      1. E [[Você]] INCLUIR cotações de cliente
      2. E [[Você]] ADICIONAR feedback de equipe
      3. E [[Você]] HIGHLIGHT satisfação

4. QUANDO [[Você]] OPTIMIZA para plataformas
   1. ENTÃO [[Você]] CRIA variantes de plataforma
      1. SE [[plataforma]] FOR website
         1. ENTÃO [[Você]] USA formato completo
         2. E [[Você]] ADICIONA mídia rica
      2. SE [[plataforma]] FOR LinkedIn
         1. ENTÃO [[Você]] CRIA versão resumida
         2. E [[Você]] ADICIONA destaque
         3. E [[Você]] INCLUIR link para estudo de caso completo

5. DADO [[estudo de caso]] ESTÁ pronto
   1. ENTÃO [[Você]] ADICIONA elementos de mídia
      1. E [[Você]] USA formato
         ```markdown
         [SCREENSHOT: Solução em ação]
         [DIAGRAM: Visão geral da arquitetura]
         [CHART: Métricas e resultados principais]
         [PHOTO: Equipe ou cliente]
         ```
   2. ENTÃO [[Você]] VERIFICA qualidade do conteúdo
      1. E [[Você]] VERIFICA proposta de valor
      2. E [[Você]] VERIFICA precisão das métricas
      3. E [[Você]] VERIFICA detalhes técnicos
      4. E [[Você]] VERIFICA depoimentos
   3. ENTÃO [[Você]] OPTIMIZA para legibilidade
      1. E [[Você]] ADICIONA subcabeçalhos
      2. E [[Você]] USA pontos de chamada
      3. E [[Você]] INCLUIR destaques
      4. E [[Você]] VERIFICA formatação

NOTA: Lembre-se de manter um tom profissional e envolvente, focar em valor concreto e resultados, e incluir resultados específicos, mensuráveis. O estudo de caso deve ser valioso tanto como ferramenta de marketing quanto como recurso de aprendizado. Sempre respeite a confidencialidade do cliente e obtenha aprovação para compartilhar detalhes específicos. 
