# 🤖 Ultra Wide Turbo Workspace
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

> Um framework estruturado para agentes GPT manterem contexto, seguirem processos e entregarem resultados consistentes através de protocolos bem definidos e padrões de documentação.

*🥇 Este sistema de modos é inspirado no conceito original de modo plano vs ato de [DaleLJefferson](https://forum.cursor.com/t/plan-vs-act-modes/43550), que foi estendido para incluir modos operacionais adicionais para controle aprimorado do fluxo de trabalho.*

```markdown
Você tem cinco (6) modos de operação:

1. Modo PLANO - Você trabalhará com o usuário para definir um plano, reunirá todas as informações necessárias para fazer as alterações, mas não fará nenhuma alteração.
2. Modo REFINAR - Você refinará ainda mais seus passos de desenvolvimento atômico para sua execução passo a passo mais detalhada.
2. Modo DOC - Você atualizará documentos de trabalho relevantes, mas não fará outras alterações.
3. Modo ATO - Você fará alterações na base de código com base no plano.
4. Modo REFLETIR - Você refletirá sobre o trabalho realizado e se perguntará se tem 100% de certeza de que está perfeito? Você escaneará todos os arquivos relacionados até ter 100% de certeza de que nada pode dar errado. Você usará todas as ferramentas à sua disposição até alcançar 100% de certeza.
5. Modo QA - Você processará feedback escaneando por TODO's em arquivos alterados e qualquer entrada do usuário.

- Você começa cada conversa no modo PLANO. Você escaneará todos os arquivos relacionados ao pedido para obter uma boa primeira compreensão do pedido.
- Você NUNCA passará para o modo ATO até que o plano seja aprovado pelo usuário digitando `ACT`.
- Após mudar para REFINAR, DOC, ATO, REFLETIR ou QA -- SEMPRE volte para o modo PLANO.
- Você imprimirá `# Mode: NAMEOFMODE` no início de cada resposta.
- A menos que o usuário peça explicitamente para você mudar para o modo ato, digitando `ACT`, você permanecerá no modo atual.
- Você voltará para o modo PLANO após cada resposta.
- Se o usuário pedir para você tomar uma ação enquanto estiver no modo PLANO, você lembrará a ele que está no modo PLANO e que ele precisa aprovar o plano primeiro.
- Quando estiver no modo PLANO, sempre saia com o plano atualizado completo em cada resposta.
- Um plano deve sempre incluir uma lista de verificação numerada com passos de desenvolvimento atômico super claros de no máximo 1 frase.
- Cada passo deve começar com um verbo e incluir a ação.
- Cada passo deve incluir uma lista de arquivos (uma frase) e suas edições propostas (uma frase).

Documentos de trabalho:
- your-planning.md
- your-requirements.md
- your-ticket.md

Exemplo de PLANO:

# 1. Problema(s)
- 1.1 · TÍTULO_DO_PROBLEMA
   - 1.1.1 · FRASE_DO_PROBLEMA

# 2. Solução(ões)
- [1.1.1] · FRASE_DO_PROBLEMA
   - 2.1 · TÍTULO_DA_SOLUÇÃO
      - 2.1.1 · FRASE_DA_SOLUÇÃO
   - 2.2 · TÍTULO_DA_SOLUÇÃO
      - 2.2.1 · FRASE_DA_SOLUÇÃO
      - 2.2.2 · FRASE_DA_SOLUÇÃO
# 3. Passos de Desenvolvimento Atômico
- [2.1.1] · FRASE_DA_SOLUÇÃO
   - 3.1 · PASSO_ATÔMICO
      - arquivos · NOMESDOSARQUIVOS
      - edições · EDIÇÕES
   - 3.2 · PASSO_ATÔMICO
      - arquivos · NOMESDOSARQUIVOS
      - edições · EDIÇÕES
```

## 📑 Índice
1. [Início Rápido](#-quick-start)
2. [Pilares Centrais](#-core-pillars)
3. [Visão Geral do Framework](#-framework-overview)
4. [Problemas](#-issues)
5. [Código de Conduta](#-code-of-conduct)
6. [Objetos](#-objects)
7. [Integração de API](#-api-integration)
8. [Comandos PLX](#-plx-commands)
10. [Protocolos](#-protocols)

## 🔍 Início Rápido

Este método realmente brilha ao usar o Mason CLI. Ele permitirá que você convoque rapidamente um espaço de trabalho em qualquer pasta digitando `mason make workspace` e, em seguida, selecione os documentos que deseja em qual pasta.

### 1. Instale o Mason CLI

[Referência: Guia de Instalação do Mason CLI](https://docs.brickhub.dev/installing/)

> ℹ️ Pré-requisito: Você deve ter o Dart SDK instalado em sua máquina.

**Opção 1: Usando pub.dev (Recomendado)**
```bash
# 🎯 Ative a partir de https://pub.dev
dart pub global activate mason_cli
```

**Opção 2: Usando Homebrew**
```bash
# 🍺 Instale a partir de https://brew.sh
brew tap felangel/mason
brew install mason
```

Verifique a instalação:
```bash
mason
# Deve mostrar: 🧱  mason • lay the foundation!
```

### 2. Adicione o Workspace ao Mason

Primeiro, adicione o brick do workspace globalmente para torná-lo disponível em qualquer lugar do seu sistema:

**Método 1: Usando o script (Recomendado)**
```bash
# Adicione o brick do workspace usando o script fornecido
./scripts/add_workspace_bricks.sh
```

**Método 2: Instalação manual**
```bash
# Adicione o brick do workspace globalmente
cd ./_mason
mason add workspace --path . -g
```

### 3. Crie Seu Workspace

Agora você pode criar um workspace em qualquer repositório ou pasta usando o mason.

#### Exemplo
```bash
# Navegue até seu repositório/pasta
cd your-repository

# Crie o workspace interativamente
mason make workspace
```
Isso irá:
- Perguntar quais componentes você deseja incluir
- Permitir que você personalize seu workspace
- Lidar com a criação e substituição de arquivos de forma segura
- Configurar automaticamente a estrutura do seu workspace em uma pasta específica

## 📚 Pilares Centrais

Este framework aprimora as capacidades do seu agente de IA através de três pilares centrais. Ele garante implementações de alta qualidade e testadas, mantendo requisitos claros, tickets detalhados e listas de tarefas organizadas.

Acreditamos que agentes de IA desempenham seu melhor quando três elementos-chave se alinham:

1. **Treinamento de Qualidade** (fora do nosso controle, de certa forma)
   - Treinado em dados relevantes
   - Capacidades adequadas do modelo
   - Boa compreensão básica

2. **Direção Clara**
   - Requisitos bem definidos
   - Processos estruturados
   - Documentação clara
   - Modelos adequados
   - Escopo de tarefa pequeno e claro

3. **Foco Mantido**
   - Acompanhamento regular do progresso
   - Documentação consistente
   - Comunicação clara
   - Adesão ao processo
   - Preservação do contexto entre sessões
   - Consciência ativa do contexto
   - Gerenciamento adequado de estado
   - Transferência de agente sem interrupções

## 🔍 Visão Geral do Framework

O framework é construído sobre sete documentos de trabalho centrais que guiam o processo de desenvolvimento:

1. **[Requisitos](work-docs/your-requirements.md)**
   Usado para detalhar todos os aspectos do que precisa ser construído, incluindo atores, componentes, atividades, propriedades, comportamentos, critérios de aceitação e cenários de teste.

2. **[Ticket](work-docs/your-ticket.md)**
   Usado para conter descrições de tarefas, histórias de usuário, especificações técnicas, detalhes de implementação, considerações de segurança, modelos de dados e requisitos de API.

3. **[Planejamento](work-docs/your-planning.md)**
   Usado para planejamento detalhado de desenvolvimento, dividindo tarefas e organizando a abordagem de implementação.

4. **[Marcos](work-docs/your-milestones.md)**
   Usado para dividir o trabalho em marcos claros e testáveis, rastrear dependências, detalhes técnicos, progresso e critérios de conclusão, mantendo links para testes e tarefas relacionadas.

5. **[Lista de Tarefas](work-docs/your-todo-list.md)**
   Usado para rastrear tarefas atômicas cronológicas organizadas por marco, incluindo rastreamento de progresso, dependências de tarefas e tarefas de teste para cada componente testável.

6. **[Testes](work-docs/your-tests.md)**
   Usado para definir cenários de teste (estilo BDD Gherkin), validar critérios de aceitação, escrever testes de integração e unitários, e rastrear cobertura de teste.

7. **[Backlog](work-docs/your-backlog.md)**
   Usado para manter uma lista cronológica de itens de trabalho futuros que não requerem ação imediata e só serão implementados mediante solicitação do usuário, preservando o contexto e os requisitos originais.

## 🎯 Problemas

O framework fornece uma abordagem estruturada para lidar com problemas de desenvolvimento. Cada problema contém um conjunto focado de documentos necessários para rastrear e implementar itens de trabalho, reduzindo a complexidade e prevenindo sobrecarga de informações.

### Trabalhando com Problemas

Cada problema é organizado em seu próprio diretório com documentos essenciais:
- `your-backlog.md`: Para rastrear itens de trabalho futuros
- `your-hours.md`: Para registrar o tempo de trabalho
- `your-milestones.md`: Para rastrear o progresso
- `your-planning.md`: Para planejamento detalhado de desenvolvimento
- `your-requirements.md`: Para documentar requisitos
- `your-tests.md`: Para cenários de teste
- `your-todo-list.md`: Para rastreamento de tarefas

Para criar um novo problema, primeiro adicione o brick de problema globalmente executando:

```bash
./scripts/add_make_issue_brick.sh
```

Este script irá:
- Verificar se o Mason CLI está instalado
- Navegar até o diretório _mason
- Adicionar o brick de problema globalmente se ainda não estiver presente
- Fornecer feedback claro sobre o processo

Uma vez que o brick é adicionado, você pode criar novos problemas usando:

```bash
mason make issue
```

Ele perguntará pelo diretório e nome do problema, criando um espaço de trabalho estruturado para esse problema específico com toda a documentação necessária.

Se você encontrar algum problema:
1. Certifique-se de que o Mason CLI está instalado (`dart pub global activate mason_cli`)
2. Garanta que o script é executável (`chmod +x scripts/add_make_issue_brick.sh`)
3. Verifique se você está no diretório raiz do workspace

## 🔄 Protocolos

O framework inclui um conjunto abrangente de protocolos que guiam vários aspectos do desenvolvimento e documentação. Cada protocolo é projetado para manter a consistência e a qualidade ao longo do processo de desenvolvimento.

| Protocolo                           | Categoria          | Descrição                                             |
|-------------------------------------|--------------------|-------------------------------------------------------|
| plx-activate-code-red               | Emergência         | Inicia protocolo de emergência para problemas críticos|
| plx-analyze                         | Análise            | Realiza análise detalhada de código ou requisitos     |
| plx-ask                             | Comunicação        | Formula perguntas claras para melhor compreensão      |
| plx-ask-big-brother                 | Suporte            | Solicita orientação de desenvolvedores/sistema sênior |
| plx-ask-questions                   | Comunicação        | Gera conjuntos de perguntas abrangentes para clareza  |
| plx-check-todo                      | Gerenciamento de Tarefas | Revisa e valida itens de tarefas                    |
| plx-commit                          | Controle de Versão | Lida com commits de código com documentação adequada  |
| plx-continue-and-follow-the-process | Processo           | Garante adesão aos fluxos de trabalho estabelecidos   |
| plx-create-brick                    | Desenvolvimento    | Cria novos bricks Mason para geração de código        |
| plx-create-case-study               | Documentação       | Desenvolve estudos de caso detalhados                 |
| plx-create-code-of-conduct          | Documentação       | Estabelece diretrizes e padrões de desenvolvimento    |
| plx-create-concept                  | Documentação       | Documenta novos conceitos e decisões arquitetônicas   |
| plx-create-doc                      | Documentação       | Gera vários tipos de documentação                     |
| plx-create-feature-breakdown        | Planejamento       | Divide recursos em componentes implementáveis         |
| plx-create-insight                  | Análise            | Gera insights a partir de análise de código ou processo|
| plx-create-milestone-gherkin-tests  | Testes             | Cria testes BDD para marcos                           |
| plx-create-milestones               | Planejamento       | Define marcos e objetivos do projeto                  |
| plx-create-plan-in-chat             | Planejamento       | Desenvolve planos de ação durante sessões de chat     |
| plx-create-planning                 | Planejamento       | Cria planos de projeto abrangentes                    |
| plx-create-protocol                 | Processo           | Estabelece novos protocolos de processo               |
| plx-create-tests                    | Testes             | Desenvolve vários tipos de testes                     |
| plx-create-ticket                   | Gerenciamento de Tarefas | Cria tickets de tarefa bem estruturados            |
| plx-create-todo                     | Gerenciamento de Tarefas | Gera itens de tarefas e listas de tarefas          |
| plx-create-tutorial                 | Documentação       | Cria tutoriais passo a passo                          |
| plx-do                              | Execução           | Executa tarefas seguindo processos definidos          |
| plx-document-dart-file              | Documentação       | Documenta arquivos de código Dart de forma abrangente |
| plx-explain-yourself                | Comunicação        | Fornece explicações claras de decisões/ações          |
| plx-fix-linting-errors              | Qualidade          | Resolve problemas de linting de código                |
| plx-focus                           | Processo           | Mantém foco na tarefa/objetivo atual                  |
| plx-follow-the-docs                 | Processo           | Garante adesão à documentação                         |
| plx-log-hours                       | Gerenciamento de Projetos | Rastreia tempo gasto em tarefas                    |
| plx-pause-work                      | Processo           | Pausa o trabalho adequadamente com preservação de contexto |
| plx-prepare-content                 | Conteúdo           | Prepara vários tipos de conteúdo                      |
| plx-prepare-release                 | Lançamento         | Gerencia tarefas de preparação de lançamento          |
| plx-reflect                         | Qualidade          | Revisa e valida o trabalho concluído                  |
| plx-resume-work                     | Processo           | Retoma o trabalho com restauração adequada de contexto|
| plx-run-tests                       | Testes             | Executa e valida testes                               |
| plx-scan-project-for-context        | Análise            | Analisa o projeto para coleta de contexto             |
| plx-scan-project-for-todo           | Gerenciamento de Tarefas | Identifica e coleta itens de tarefas                |
| plx-stick-to-the-process            | Processo           | Mantém adesão ao processo                             |
| plx-stick-to-your-prompt            | Processo           | Garante adesão ao prompt/instruções                   |
| plx-sync-work-documents             | Documentação       | Sincroniza documentos relacionados ao trabalho        |
| plx-test-live                       | Testes             | Realiza procedimentos de teste ao vivo                |
| plx-transfer-context                | Processo           | Lida com transferência de contexto entre sessões      |
| plx-update-read-me-and-changelog    | Documentação       | Atualiza documentação do projeto                      |
| plx-update-todo                     | Gerenciamento de Tarefas | Atualiza itens e listas de tarefas                  |
| plx-update-translations             | Localização        | Gerencia atualizações de tradução                     |
| plx-use-api                         | Desenvolvimento    | Lida com integração e uso de API                      |
