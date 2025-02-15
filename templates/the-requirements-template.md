---
document_type: template
goal: fornecer uma maneira estruturada de documentar requisitos
gpt_action: usar como base para seu documento de requisitos
---

# 👤 Atores & 🧩 Componentes (Quem ou o quê)
> - Alguém ou algo que pode realizar ações ou ser interagido (exemplos incluem Usuário, Botão, Tela, Campo de Entrada, Mensagem, Sistema, API, Banco de Dados, e podem ser uma pessoa, serviço, visual ou não-visual).

> - Quem se beneficia disso? · Quem mantém isso? · Com o que os usuários interagem? · O que mostra informações? · O que processa dados? · O que armazena dados? · Quais sistemas externos estão envolvidos? · O que precisa ser monitorado?

> - Instruções GPT: Comece listando todos os substantivos da descrição do seu recurso - estes são seus potenciais atores e componentes. Em seguida, expanda esta lista perguntando: quem usa, com o que interagem, o que mostra informações, o que armazena dados e o que processa dados? Para cada item, decida se é um Ator (pode realizar ações) ou Componente (é atuado). Finalmente, divida quaisquer componentes complexos em partes menores e mais gerenciáveis.

> - Possíveis Pais: Ele mesmo
> - Vincule atores e componentes ao seu (opcional) pai começando com o pai em [[colchetes duplos]] e o(s) ator(es)/componente(s) abaixo dele. Exemplo:
> 	- [[pai]]
> 		- [[Ator]]
> 		- [[Componente]]
---

- [ ]

# 🎬 Atividades (Quem ou o quê faz o quê?)
> - Ações que um Ator ou Componente realiza (exemplos incluem Criar Lista, Excluir Item, Sincronizar Dados, e devem sempre conter um verbo + ação).

> - O que cada ator pode fazer? · O que deve acontecer automaticamente? · O que precisa de entrada do usuário? · O que acontece periodicamente? · O que desencadeia outras atividades? · O que precisa ser registrado? · O que precisa ser medido? · O que precisa de autorização?

> - Instruções GPT: Pegue cada Ator e Componente e liste tudo o que eles podem fazer, devem fazer ou deveriam fazer automaticamente. Comece cada atividade com um verbo (criar, atualizar, excluir, etc.) e torne-a específica. Pense em: interações do usuário, automações do sistema, tarefas periódicas e operações de dados. Não se preocupe com o "como" ainda - concentre-se no que precisa acontecer.

> - Possíveis Pais: Ator, Componente
> - Vincule atividades ao seu pai começando com o pai em [[colchetes duplos]] e a atividade abaixo dele. Exemplo:
> 	- [[pai]]
> 		- [[Criar item]]
> 		- [[Excluir item]]
---

- [ ]

## 🌊 Fluxos de Atividade & Cenários (O que em qual ordem?)
> - Sequências de Ações Atômicas (como "Tocar botão") que mapeiam os passos para completar uma Atividade. Podem ter caminhos opcionais para conclusão bem-sucedida (Fluxo Feliz), erros (Fluxo de Erro), e cenários como sem conexão, estados vazios, estados de carregamento, etc.

> - Qual é o caminho ideal? · O que poderia falhar? · O que precisa de validação? · O que precisa de confirmação? · O que é sensível ao tempo? · O que precisa de etapas de recuperação? · O que deve ser armazenado em cache? · O que deve ser tentado novamente? · O que precisa de reversão?

> - Instruções GPT: Para cada Atividade, pense no cenário perfeito (Fluxo Feliz) - o que acontece quando tudo funciona? Em seguida, adicione opcionalmente Fluxos de Erro perguntando "o que poderia dar errado?" em cada etapa. Finalmente, considere casos extremos como sem conexão, estados vazios ou estados de carregamento. Divida cada fluxo em ações atômicas (indivisíveis) que podem ser claramente implementadas e testadas. Prefixe cada ação atômica com palavras-chave BDD Gherkin: DADO, QUANDO, ENTÃO, E, MAS.

> - Possíveis Pais: Atividades, Ele mesmo
> - Vincule fluxos de atividade ao seu pai começando com o pai em [[colchetes duplos]] e o fluxo de atividade abaixo dele. Exemplo:
> 	- [[pai]]
> 		- DADO [[Usuário]] está em [[Tela Inicial]]
> 		- QUANDO [[Usuário]] [[toca no botão criar item]]
> 		- ENTÃO [[Sistema]] [[mostra feedback de criação de item]]
> 		- E [[Sistema]] [[cria item no banco de dados]]
> 		- MAS [[Sistema]] [[não navega]]
---

- [ ]

# 📝 Propriedades (Quais valores?)
> - Descreve um valor ou configuração que pertence a um objeto (exemplos incluem largura, cor, id, nome).

> - O que o identifica? · O que o descreve? · O que o configura? · O que o mede? · O que o estiliza? · O que o formata? · O que o rastreia? · O que o agrupa? · O que o ordena?

> - Instruções GPT: Para cada objeto em seu sistema, pense sobre suas necessidades de dados em três categorias: identidade (o que o torna único), configuração (o que pode ser alterado) e estado (o que pode variar). Considere o que precisa ser armazenado, exibido, medido ou rastreado. Certifique-se de que cada propriedade tenha um tipo e propósito claros.

> - Possíveis Pais: Ator, Componente, Atividade, Fluxo de Atividade, Cenário, Ação Atômica, Cenário, Comportamento
> - Vincule propriedades ao seu pai começando com o pai em [[colchetes duplos]] e a propriedade abaixo dele. Exemplo:
> 	- [[pai]]
> 		- [[nome : string]]
---

- [ ]

# 🛠️ Comportamentos (Como age quando.. em termos de.. ?)
> - Define como algo parece, funciona e executa Exemplos incluem ui/ux, regras & limites, dados & análises, segurança, desempenho e escalabilidade.

> - Quando deve mudar? · Como deve responder? · Quais são os limites? · O que precisa de validação? · O que precisa de animação? · O que precisa de proteção? · O que deve ser armazenado em cache? · O que deve ser otimizado? · O que deve ser monitorado? · O que precisa de fallback? · Como deve escalar? · O que deve ser registrado? · Como deve falhar? · O que deve ser medido? · O que precisa de autorização?

> - Instruções GPT: Pense sobre as regras e restrições de cada objeto em termos de: limites (valores máximos/mínimos, entradas permitidas), tempo (quando, com que frequência), segurança (quem pode acessar) e desempenho (o que precisa ser rápido). Concentre-se em comportamentos que podem ser claramente testados - se você não pode escrever um teste para isso, torne-o mais específico.

> - Possíveis Pais: Ator, Componente, Atividade, Fluxo de Atividade, Cenário, Ação Atômica, Cenário, Propriedade
> - Vincule comportamentos ao seu pai começando com o pai em [[colchetes duplos]] e o comportamento abaixo dele. Exemplo:
> 	- [ ] [[pai]]
> 		- [ ] [[Deve falhar quando o comprimento for 100+ caracteres]]
> 		- [ ] [[Não deve mostrar quando a lista estiver vazia]]
---

- [ ]

# 💡 Ideias & 🪵 Backlog
> - Qualquer coisa que poderia ser adicionada mais tarde, muito complexa agora, precisa de mais pesquisa, seria bom ter, ou abordagens alternativas.

> - O que poderia ser adicionado mais tarde? · O que é muito complexo agora? · O que precisa de mais pesquisa? · O que seria bom ter? · Quais são as abordagens alternativas? · O que poderia ser automatizado?

> - Instruções GPT: Enquanto trabalha nos requisitos, anote quaisquer ideias que surgirem, mas não se encaixam no escopo atual. Pense em: melhorias futuras, abordagens alternativas, melhorias de desempenho e recursos desejáveis. Não descarte ideias apenas porque são complexas - elas podem ser valiosas mais tarde.

> - Possíveis Pais: Qualquer coisa (opcional)
> - Vincule ideias e itens de backlog ao seu (opcional) pai começando com o pai em [[colchetes duplos]] e a ideia/item de backlog abaixo dele. Exemplo:
> 	- [ ] [[pai]]
> 		- [ ] [[Precisamos de um limite?]]
> 		- [ ] [[Isso é seguro?]]
---

- [ ]

# ❓ Perguntas
> - Perguntas que precisam ser respondidas para esclarecer requisitos.

> - O que está incerto? · O que precisa de decisão? · Quais são os casos extremos? · O que poderia ser melhorado? · O que estamos perdendo? · Quais suposições estamos fazendo? · Quais riscos existem? · Quais dependências existem?

> - Instruções GPT: Ao longo do processo, anote quaisquer incertezas ou suposições que você fizer. Concentre-se em perguntas que possam impactar a implementação ou a experiência do usuário.

> - Possíveis Pais: Tudo (opcional)
> - Vincule perguntas ao seu (opcional) pai começando com o pai em [[colchetes duplos]] e a pergunta abaixo dele. Exemplo:
> 	- [ ] [[pai]]
> 		- [ ] [[Precisamos de um limite?]]
> 		- [ ] [[Isso é seguro?]]
---

- [ ]

# 🎯 Papéis, 📝 Tarefas & 🎓 Abordagem Sugerida
> - Cada comportamento, propriedade, atividade (fluxo), cenário, ação atômica, ator, componente deve direta ou indiretamente (por pais) se desdobrar em uma tarefa com papel atribuído. Criar uma tarefa para um pai e completá-la automaticamente cobre seus filhos, a menos que os filhos tenham tarefas abertas.

> - Quem é responsável por quê?

> - Instruções GPT: Revise todos os itens nos requisitos e crie tarefas claras e específicas para implementação. Cada item deve ter pelo menos uma tarefa. Agrupe tarefas por papel (UI/UX, Frontend, Backend, etc.) e certifique-se de que sejam específicas o suficiente para serem acionáveis e testáveis.

> - Possíveis Pais: Tudo (opcional)
> - Vincule tarefas ao seu pai começando com o pai em [[colchetes duplos]] e a tarefa abaixo dele. Exemplo:
> 	- [ ] [[pai]]
> 		- [ ] Faça um design legal
> 		- [ ] Obtenha algum feedback
---

- [ ] Designer UI/UX
- [ ] Desenvolvedor Frontend
- [ ] Desenvolvedor Backend
- [ ] Engenheiro de Dados
- [ ] Engenheiro DevOps
- [ ] Gerente de Projeto
- [ ] Profissional de Marketing

<!--
# 🎯 Guia de Estratégia
> Como usar este modelo.
---
Comece em qualquer lugar que faça sentido: focado no usuário (Atores), focado no recurso (Atividades), focado nos dados (Propriedades) ou focado nas regras (Comportamentos). Para cada item que você adicionar, vincule-o a itens relacionados usando [[colchetes duplos]], adicione suas propriedades e comportamentos e crie tarefas para implementação.

Cada item neste modelo tem uma caixa de seleção. Marcar um item significa:
- O próprio item está totalmente implementado
- Todos os seus filhos (sub-itens) estão totalmente implementados
- Todos os seus relacionamentos estão devidamente conectados
- Todos os seus testes necessários estão passando

Só marque um item pai quando TODOS os seus filhos estiverem completos.

# 🔗 Guia de Relacionamento (Como conectar itens)
> Cada item nos requisitos deve estar conectado a outros itens e/ou uma tarefa. Isso cria uma rede completa e rastreável de requisitos. Criar uma tarefa para um pai e completá-la automaticamente cobre seus filhos, a menos que os filhos tenham tarefas abertas.
---

## Relacionamentos Comuns
- [[Ator]]
	- [[Atividades]]
		- [[Fluxos de Atividade]]
			- [[Ações Atômicas]]
		- [[Comportamentos]]
- [[Componente]]
	- [[Atividades]]
		- [[Fluxos de Atividade]]
			- [[Ações Atômicas]]
		- [[Comportamentos]]
- [[Propriedades]]
	- [[Comportamentos]]

## Como Mapear
Comece com qualquer item e pergunte:
- O que usa isso?
- O que isso usa?
- Quais propriedades isso tem?
- Quais comportamentos isso segue?
- Em quais atividades está envolvido?

## Validação
Após completar cada seção, verifique:
1. Todos os itens usam [[colchetes]] para indicar relacionamentos (se aplicável)
2. Todos os itens têm relacionamentos (se aplicável)
3. Todos os itens têm tarefas
-->
