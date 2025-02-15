---
document_type: code of conduct
goal: definir processo para gerenciar traduções de strings multilíngues
gpt_action: siga estes passos ao adicionar ou modificar traduções
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica necessidades de tradução]]
   1. [[verifica necessidades de tradução]]
      1. Verifica se string existe em inglês (en)
      2. Verifica se string existe em holandês (nl)
      3. Revisa contexto de uso da string
      4. Identifica necessidades de conteúdo dinâmico

2. [[You]] [[confirma localizações de arquivo]]
   1. [[confirma localizações de arquivo]]
      1. Arquivo inglês em `lib/core/strings/intl_en.arb`
      2. Arquivo holandês em `lib/core/strings/intl_nl.arb`
      3. Verifica se estrutura de arquivo corresponde
      4. Verifica consistência na ordenação de chaves

# 🛠️ Implementação

1. [[You]] [[adiciona chaves de tradução]]
   1. [[adiciona chaves de tradução]]
      1. Usa nomes descritivos em camelCase:
```json
{
  "welcomeUser": "Mensagem de boas-vindas aqui",
  "itemCreated": "Mensagem de criação aqui",
  "itemUpdated": "Mensagem de atualização aqui"
}
```

2. [[You]] [[implementa traduções]]
   1. [[implementa traduções]]
      1. Adiciona traduções em inglês primeiro:
```json
// Inglês (intl_en.arb)
{
  "welcomeUser": "👋 Welcome, {username}!",
  "itemCreated": "Item created",
  "itemUpdated": "Item updated",
  "itemDeleted": "Item deleted",
  "status": {
    "active": "Active",
    "inactive": "Inactive",
    "pending": "Pending"
  }
}
```
      2. Adiciona traduções em holandês:
```json
// Holandês (intl_nl.arb)
{
  "welcomeUser": "👋 Welkom, {username}!",
  "itemCreated": "Item aangemaakt",
  "itemUpdated": "Item bijgewerkt",
  "itemDeleted": "Item verwijderd",
  "status": {
    "active": "Actief",
    "inactive": "Inactief",
    "pending": "In afwachting"
  }
}
```

3. [[You]] [[trata conteúdo dinâmico]]
   1. [[trata conteúdo dinâmico]]
      1. Usa placeholders com nomes descritivos:
```json
{
  "welcomeUser": "👋 Welcome, {username}!",
  "itemCount": "You have {count} items",
  "lastUpdated": "Last updated on {date}"
}
```

4. [[You]] [[implementa no código]]
   1. [[implementa no código]]
      1. Acessa traduções através do gStrings:
```dart
Text(gStrings.welcomeUser(username: user.name)),
Text(gStrings.itemCount(count: items.length)),
Text(gStrings.lastUpdated(date: formatDate(item.updatedAt))),
```

# ✅ Verificação

1. [[You]] [[verifica traduções]]
   1. [[verifica traduções]]
      1. Todas as chaves presentes em ambos os arquivos
      2. Linguagem natural usada (não literal)
      3. Contexto cultural considerado
      4. Ordenação de chaves consistente

2. [[You]] [[verifica placeholders]]
   1. [[verifica placeholders]]
      1. Todas as variáveis adequadamente nomeadas
      2. Placeholders correspondem em ambos os arquivos
      3. Variáveis usadas corretamente no código
      4. Strings de formato funcionam como esperado

3. [[You]] [[verifica implementação]]
   1. [[verifica implementação]]
      1. Traduções acessíveis via gStrings
      2. Sem traduções faltando
      3. Sem erros em tempo de execução
      4. Comportamento de fallback adequado
