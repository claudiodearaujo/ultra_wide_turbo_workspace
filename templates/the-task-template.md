---
document_type: template
goal: fornecer uma maneira estruturada de documentar tarefas
gpt_action: usar como base para seu ticket de tarefa
name: 📋 Task
about: Ação de desenvolvimento específica para alcançar um objetivo
title: "📋"
labels: 📋 task
assignees: ''
---
# 🔖 Descrição
> 💡 *Uma introdução curta e descritiva do problema que vamos resolver.*
---

# ⚙️ Requisitos
> 💡 *Descreva os requisitos para esta tarefa. O que precisa ser feito? Quais são os resultados esperados?*
---

# 💾 Modelo de Dados
> 💡 *Modelos de dados antigos e novos que serão criados e/ou alterados quando este recurso for adicionado.*
---

# 🔒 Regras de Segurança
> 💡 *Regras de segurança antigas e novas com papéis e acessos que devem ser criados e/ou alterados. Inclua criar, ler, atualizar e excluir.*
---

# 🐒 API
> 💡 *Chamadas de API antigas e novas que devem ser criadas e/ou alteradas.*
---

# 📊 Análises
> 💡 *Análises antigas e novas que devem ser criadas e/ou alteradas quando este recurso for adicionado. Inclua um nome, quando é disparado e propriedades opcionais.*
---

# ☎️ Comunicação de Impacto
> 💡 *Quem / quais equipes devemos informar sobre o impacto de liberar este ticket? Vendas, marketing, dados, CS, outros?*
---

# 🧪 Testes
> 💡 *Componentes/fluxos/código que se beneficiariam de testes e quais cenários devem ser testados.*
---

# 🤝 Teste de Aceitação
> 💡 *Quais cenários devemos testar no teste de aceitação? Para que possamos garantir que este ticket faz o que se propõe a fazer sem erros inesperados.*
---

# 🎨 Comportamento UI/UX
> 💡 *Algo a ser observado em relação ao comportamento dos elementos UI/UX (se aplicável). Pense em posição, comportamento quando elementos não cabem na tela, feedback em elementos e propriedades de animações.*
---

# 📝 Abordagem Sugerida
> 💡 *Com conhecimento da base de código atual, tente definir uma melhor abordagem sugerida. Pense nos componentes atuais usados, fluxo de dados e elementos UI.*
---

# 👉️ Observações Finais
> 💡 *Algo a ser observado que ainda não está devidamente definido. Pense em notas fora do escopo, dependências, algo para ter cuidado extra e/ou informações sobre problemas relacionados.*
---

# ✅ Lista de Verificação de Pull Request
> 💡 *Antes de enviar seu PR, certifique-se de ter passado por esta lista de verificação cuidadosamente. Cada item representa um aspecto crucial da qualidade e confiabilidade do código. Leve seu tempo para verificar cada ponto - sua minuciosidade aqui ajuda a manter nossos altos padrões e torna o processo de revisão mais suave.*
---

- [ ] Eu li a 'Descrição' e 'Requisitos'/'Resultado Esperado' uma última vez e confirmo ter testado a funcionalidade/correção deste ticket minuciosamente, e tudo está funcionando exatamente como descrito nessas seções.
- [ ] Eu testei a funcionalidade em ambos Android e iOS.
- [ ] Eu verifiquei o arquivo de design e confirmo que a implementação atual é uma cópia fiel do design original.
- [ ] Considerei quaisquer riscos de segurança e tomei as ações apropriadas, como colocar a tag de segurança correta e definir e/ou implementar quaisquer ações sob o título 'Segurança'.
- [ ] Adicionei documentação curta, descritiva e sustentável a todas as novas classes e métodos.
- [ ] Adicionei logs curtos, descritivos e sustentáveis a cada novo pedaço de código onde parece lógico fazer isso para fins de depuração/relatório de falhas.
- [ ] Adicionei tratamento de erros sensato usando instruções try/catch e exceções personalizadas opcionais onde necessário.
- [ ] Fiz uma rodada completa de QA do meu próprio código e posso confirmar que o próximo PR contém minha melhor versão possível deste ticket.
