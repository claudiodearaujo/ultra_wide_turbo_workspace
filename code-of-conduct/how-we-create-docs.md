---
document_type: code of conduct
goal: definir estrutura para documentos de conhecimento, protocolo e processo
gpt_action: siga este template ao criar novos documentos
---

# Formato do Documento

Todo documento deve ter este cabeçalho:
```markdown
---
document_type: [protocol|code of conduct|prompt|template]
goal: [declaração clara do objetivo]
gpt_action: [instrução específica para o GPT]
---
```

# Regras de Escrita

1. Cada passo deve seguir este formato:
   - Começa com palavra-chave Gherkin em maiúsculas: GIVEN, WHEN, THEN, AND, OR, IF, IF ELSE, ELSE
   - Seguido por um [[Actor]] ou [[Component]] entre colchetes duplos
   - Seguido por uma palavra VERBO ou ESTADO (IS, HAS, NEEDS, EXISTS) em maiúsculas
   - Máximo 1 palavra em MAIÚSCULAS após [[Actor]] ou [[Component]]
   - Sempre use [[colchetes duplos]] para atores, conceitos repetidos e componentes

2. Hierarquia de passos:
   1. Estado e pré-condições rígidas começam com GIVEN
   2. Passos começam com WHEN
   3. Sub-passos indentam e começam com THEN, AND ou OR
   4. Condicionais indentam e começam com IF, ELSE, ELSE IF

# Exemplo

```markdown
1. GIVEN [[User]] GIVES [[input]]
2. WHEN [[You]] START [[implementation]]
   1. AND [[You]] WRITE tests
   2. AND [[You]] ADD code
   3. WHEN [[implementation]] IS complete
      1. THEN [[You]] RUN tests
   4. IF [[tests]] FAIL
      1. THEN [[You]] FIX issues
      2. AND [[You]] RETRY tests
```

Exemplos de código usam três backticks com linguagem:
```dart
void example() {
  print('Hello');
}
```
