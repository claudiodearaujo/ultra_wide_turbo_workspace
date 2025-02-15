---
document_type: concept
goal: explicar a linguagem Turbo Gherkin e seu uso em nosso framework
gpt_action: referenciar isto quando precisar entender ou usar instruções no estilo Turbo Gherkin
---

A linguagem Turbo Gherkin fornece passos estruturados para documentação clara e consistente usando palavras-chave específicas.

# Palavras-chave e Regras Principais

- Primárias: `GIVEN` (pré-condição), `WHEN` (ação), `THEN` (resultado)
- Fluxo: `AND` (passo adicional), `OR` (alternativa)
- Condicionais: `IF`/`ELSE` (ramificação), `BUT` (exceção)
- Combinações: `BUT IF`, `ELSE IF`, `OR IF`

Regras:
1. Palavras-chave em MAIÚSCULAS
2. Use [[Actor]] ou [[Component]] entre colchetes duplos
3. Siga com UM VERBO/ESTADO em maiúsculas
4. Indente sub-passos adequadamente

# Exemplos

✅ Estrutura Correta:
```markdown
1. GIVEN [[User]] SENDS request
   1. WHEN [[You]] PROCESSES data
      1. IF [[data]] IS valid
         1. THEN [[You]] SAVES data
      2. ELSE [[You]] REPORTS error
   2. BUT [[error]] OCCURS
      1. THEN [[You]] RETRIES later
```

❌ Erros Comuns:
```markdown
Given user sends request                    # Palavras-chave em minúsculas
WHEN [[You]] PROCESSES THE DATA       # Múltiplos verbos
Then gpt agent returns response            # Colchetes faltando
IF response is empty                       # Formato incorreto
```

# Integração de Código

1. Código Inline (use backticks):
```markdown
WHEN [[You]] RUNS `./scripts/deploy.sh`
THEN [[You]] CHECKS `config.json`
```

2. Blocos de Código (indente sob o passo):
```markdown
1. WHEN [[You]] WRITES function
   1. THEN [[You]] ADDS code:
      ```dart
      void example() {
        print('Hello');
      }
      ```
   2. AND [[You]] TESTS function
```

Lembre-se:
- Mantenha a indentação adequada
- Use realce de sintaxe específico da linguagem
- Mantenha elementos de código inline curtos
- Continue o fluxo Gherkin após blocos de código
