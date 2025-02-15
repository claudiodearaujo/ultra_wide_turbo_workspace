---
document_type: code of conduct
goal: definir processo para testar operações de arquivo usando IOOverrides
gpt_action: siga estes passos ao testar código que usa Directory.current
---

# 🔍 Pesquisa Inicial

1. [[You]] [[analisa desafios de teste]]
   1. [[analisa desafios de teste]]
      1. Testes podem interagir com arquivos reais do projeto
      2. Caminhos de arquivo vinculados ao diretório de trabalho atual
      3. Difícil isolar operações de arquivo de teste
      4. Risco de poluir diretório do projeto

2. [[You]] [[confirma abordagem de solução]]
   1. [[confirma abordagem de solução]]
      1. Usa IOOverrides do Dart para controlar Directory.current
      2. Intercepta operações de arquivo e diretório
      3. Redireciona para diretório de teste
      4. Mantém código de produção inalterado

# 🛠️ Implementação

1. [[You]] [[cria override de teste]]
   1. [[cria override de teste]]
      1. Implementa classe IOOverrides:
```dart
class _TestIOOverrides extends IOOverrides {
  final Directory _testDir;
  _TestIOOverrides(this._testDir);

  @override
  Directory getCurrentDirectory() => _testDir;
}
```

2. [[You]] [[configura ambiente de teste]]
   1. [[configura ambiente de teste]]
      1. Cria diretório e override de teste:
```dart
setUp(() async {
  // Cria diretório de teste novo
  tempDir = await Directory.systemTemp.createTemp('test_workspace');
  
  // Configura arquivos de teste
  await sourceDir.create(recursive: true);
  await File(...).writeAsString(...);
  
  // Sobrepõe Directory.current
  IOOverrides.global = _TestIOOverrides(tempDir);
});
```

3. [[You]] [[implementa limpeza]]
   1. [[implementa limpeza]]
      1. Limpa após os testes:
```dart
tearDown(() async {
  // Remove override
  IOOverrides.global = null;
  
  // Limpa diretório de teste
  await tempDir.delete(recursive: true);
});
```

# ✅ Verificação

1. [[You]] [[verifica isolamento de teste]]
   1. [[verifica isolamento de teste]]
      1. Testes usam diretórios temporários
      2. Sem interação com arquivos reais do projeto
      3. Operações de arquivo adequadamente interceptadas
      4. Código de produção permanece inalterado

2. [[You]] [[verifica processo de limpeza]]
   1. [[verifica processo de limpeza]]
      1. Overrides removidos após cada teste
      2. Diretórios de teste limpos
      3. Sem arquivos de teste remanescentes
      4. Estado do sistema restaurado

3. [[You]] [[verifica melhores práticas]]
   1. [[verifica melhores práticas]]
      1. Sempre use diretórios temporários
      2. Limpe após cada teste
      3. Remova overrides no tearDown
      4. Mantenha código de produção usando Directory.current
      5. Não modifique implementação para teste 
