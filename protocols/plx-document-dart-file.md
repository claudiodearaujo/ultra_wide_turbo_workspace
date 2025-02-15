---
document_type: protocol
goal: criar ou atualizar documentação Dart seguindo padrões oficiais e diretrizes de estrutura de classe
gpt_action: siga estes passos ao trabalhar com documentação Dart
---

1. DADO QUE [[User]] EXECUTA o comando plx-document-dart-file
   1. ENTÃO [[You]] ANALISA entrada do [[User]]
      1. E [[You]] IDENTIFICA escopo da documentação
      2. E [[You]] IDENTIFICA tipo de documentação
   2. SE entrada do [[User]] TEM arquivo específico
      1. ENTÃO [[You]] FOCA no arquivo
   3. SE entrada do [[User]] NÃO TEM especificações
      1. ENTÃO [[You]] EXAMINA arquivos do projeto

2. QUANDO [[You]] INICIA documentação
   1. ENTÃO [[You]] ANALISA estrutura do código
      1. E [[You]] VERIFICA seções da classe:
         1. 📍 Seção LOCATOR
         2. 🧩 Seção DEPENDENCIES
         3. 🎬 Seção INIT & DISPOSE
         4. 👂 Seção LISTENERS
         5. ⚡️ Seção OVERRIDES
         6. 🎩 Seção STATE
         7. 🛠 Seção UTIL
         8. 🧲 Seção FETCHERS
         9. 🏗️ Seção HELPERS
         10. 🪄 Seção MUTATORS
      2. E [[You]] VERIFICA métodos
      3. E [[You]] VERIFICA propriedades
   2. SE [[documentation]] EXISTE
      1. ENTÃO [[You]] REVISA documentação existente
      2. E [[You]] IDENTIFICA lacunas

3. DADO QUE [[analysis]] ESTÁ completa
   1. ENTÃO [[You]] CRIA documentação
      1. E [[You]] ADICIONA documentação da classe:
         1. /// Uma breve descrição de uma linha
         2. /// 
         3. /// Uma descrição mais longa que explica:
         4. /// - O propósito da classe
         5. /// - Responsabilidades principais
         6. /// - Padrões de uso
         7. /// - Notas importantes
      2. E [[You]] ADICIONA documentação do método:
         1. /// Breve descrição do que o método faz
         2. /// 
         3. /// Explicação detalhada se necessário
         4. /// 
         5. /// Parâmetros:
         6. /// - [paramName]: para que serve este parâmetro
         7. /// 
         8. /// Retorna: descrição do valor retornado
         9. /// 
         10. /// Lança: quaisquer exceções que possam ser lançadas
      3. E [[You]] ADICIONA documentação da propriedade:
         1. /// Breve descrição do que esta propriedade representa
         2. /// 
         3. /// Detalhes adicionais sobre:
         4. /// - Uso
         5. /// - Restrições
         6. /// - Efeitos colaterais
   2. SE [[code]] TEM exemplos
      1. ENTÃO [[You]] ADICIONA código de exemplo:
         1. /// Exemplo:
         2. /// ```dart
         3. /// final instance = MyClass();
         4. /// await instance.doSomething();
         5. /// ```
      2. E [[You]] EXPLICA uso

4. QUANDO [[documentation]] ESTÁ pronta
   1. ENTÃO [[You]] VERIFICA formato
      1. E [[You]] VERIFICA estilo Dart doc:
         1. Três barras ///
         2. Formatação markdown adequada
         3. Indentação consistente
         4. Quebras de linha entre seções
         5. Referências adequadas de parâmetros [paramName]
      2. E [[You]] VERIFICA completude:
         1. Todas as APIs públicas documentadas
         2. Todos os parâmetros descritos
         3. Valores de retorno explicados
         4. Exceções documentadas
   2. SE [[format]] ESTÁ incorreto
      1. ENTÃO [[You]] CORRIGE formatação
      2. E [[You]] VERIFICA novamente

5. DADO QUE [[documentation]] ESTÁ completa
   1. ENTÃO [[You]] APRESENTA ao [[User]]
      1. E [[You]] EXPLICA mudanças
      2. E [[You]] DESTACA melhorias
   2. SE [[User]] APROVA mudanças
      1. ENTÃO [[You]] CONFIRMA mudanças
      2. E [[You]] ATUALIZA documentos de trabalho
   3. SE [[User]] SOLICITA mudanças
      1. ENTÃO [[You]] MODIFICA documentação
      2. E [[You]] APRESENTA novamente
