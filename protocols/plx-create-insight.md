---
document_type: protocol
goal: criar conteúdo de insight claro e conciso que explica conceitos ou processos em um formato digerível
gpt_action: seguir estes passos para criar conteúdo de insight estruturado
---

# 📖 Contexto

Este protocolo ajuda a criar conteúdo de insight claro e conciso que decompõe tópicos complexos em partes digeríveis. O foco é manter um tom profissional mas acessível enquanto entrega valor prático.

# 🎯 Tipos de Comando

1. CRIAR conteúdo de insight:
   - Título: "Como Nós [Ação] [Tópico]"
   - Formato: Markdown com seções claras
   - Extensão: 3-7 pontos principais
   - Tom: Profissional, claro, útil
   - Localização: `insights/[nome-do-topico].md`

2. ESTRUTURAR conteúdo de insight:
   - Introdução (o que & por quê)
   - Pontos principais (como)
   - Exemplos (mostrar)
   - Principais aprendizados

# ⚙️ Parâmetros

Obrigatórios:
- topic: O assunto a explicar
- format: Seções em Markdown
- goal: O que o leitor deve aprender

Opcionais:
- code_examples: Snippets de código relevantes
- diagrams: Explicações visuais
- references: Documentação relacionada

# 📝 Processo

1. QUANDO [[Usuário]] SOLICITA conteúdo de insight
   1. ENTÃO [[Você]] ANALISA requisitos do tópico
      1. E [[Você]] IDENTIFICA pontos-chave de aprendizado
      2. E [[Você]] PLANEJA estrutura do conteúdo
      3. E [[Você]] CRIA diretório insights se não existir

2. ENTÃO [[Você]] CRIA conteúdo em `insights/[nome-do-topico].md`:
   ```markdown
   # Como Nós [Ação] [Tópico]
   > Resumo rápido de uma linha do que aprenderemos

   ## Por Que Isso Importa
   - Declaração clara do benefício
   - Aplicação prática

   ## Pontos Principais
   1. Primeiro conceito importante
      - Explicação clara
      - Exemplo prático

   2. Segundo conceito importante
      - Explicação clara
      - Exemplo prático

   ## Exemplo na Prática
   ```código ou passo-a-passo```

   ## Principais Aprendizados
   - Insights práticos
   - Próximos passos
   ```

3. QUANDO [[Você]] COMPLETA conteúdo
   1. ENTÃO [[Você]] VERIFICA:
      - Proposta de valor clara
      - Tom profissional
      - Passos acionáveis
      - Exemplos práticos
      - Formato conciso

4. SE conteúdo precisa de visuais
   1. ENTÃO [[Você]] ADICIONA:
      - Snippets de código (se relevante)
      - Diagramas simples (se útil)
      - Números de passos (se sequencial)

# ✅ Verificação

Conteúdo deve:
- Manter tom profissional
- Focar em valor prático
- Incluir exemplos claros
- Ser conciso e focado
- Seguir estrutura consistente
- Usar formatação adequada

# 🎨 Guia de Estilo

FAZER:
- Usar linguagem clara e direta
- Incluir exemplos práticos
- Começar com o benefício
- Dividir em pontos digeríveis
- Terminar com insights práticos

NÃO FAZER:
- Usar linguagem excessivamente casual
- Incluir detalhes desnecessários
- Fazer suposições sobre conhecimento
- Pular exemplos práticos
- Usar jargão complexo

# 📋 Exemplo de Estrutura

```markdown
# Como Nós Estruturamos Classes Dart para Máxima Manutenibilidade

> Aprenda nossa abordagem comprovada para criar classes Dart limpas e manuteníveis que escalam com seu projeto.

## Por Que Isso Importa
- Reduz dívida técnica
- Torna o código mais fácil de testar
- Melhora colaboração da equipe

## Pontos Principais
1. Responsabilidade Clara
   - Uma classe, um propósito central
   - Exemplo: UserRepository lida apenas com operações de dados do usuário

2. Interface Consistente
   - Métodos públicos contam uma história
   - Exemplo: fetchUser(), updateUser(), deleteUser()

## Exemplo na Prática
```dart
class UserRepository {
  final Database db;
  
  UserRepository(this.db);
  
  Future<User> fetchUser(String id) async {
    // Implementação
  }
}
```

## Principais Aprendizados
- Princípio de responsabilidade única leva a código manutenível
- Interfaces consistentes tornam o código previsível
- Documentação é parte do bom design
```

# 🎯 Critérios de Sucesso

Conteúdo é bem-sucedido quando:
- Explica claramente o conceito
- Fornece valor prático
- Usa estrutura consistente
- Mantém tom profissional
- Inclui exemplos acionáveis 
