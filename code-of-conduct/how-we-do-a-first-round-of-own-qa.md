---
document_type: code of conduct
goal: definir processo para realizar primeira rodada de garantia de qualidade no próprio código
gpt_action: siga estes passos ao fazer QA próprio em features implementadas
---

# 🔍 Revisão Inicial

1. [[You]] [[verifica estrutura do código]]
   1. [[verifica estrutura do código]]
      1. Verifica se estrutura do arquivo segue o padrão:
```dart
// 📍 LOCATOR ------------------------------------------------------------------------------- \\
// 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
// 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
// 👂 LISTENERS ----------------------------------------------------------------------------- \\
// ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
// 🎩 STATE --------------------------------------------------------------------------------- \\
// 🛠 UTIL ---------------------------------------------------------------------------------- \\
// 🧲 FETCHERS ------------------------------------------------------------------------------ \\
// 🏗️ HELPERS ------------------------------------------------------------------------------- \\
// 🪄 MUTATORS ------------------------------------------------------------------------------ \\
```
      2. Verifica modificadores de acesso público/privado
      3. Verifica convenções de nomenclatura de métodos
      4. Ordena itens alfabeticamente quando possível
      5. Remove código não utilizado

2. [[You]] [[revisa métodos]]
   1. [[revisa métodos]]
      1. Verifica implementação de logging
      2. Verifica rastreamento de analytics
      3. Revisa documentação
      4. Valida estados ocupados e feedback do usuário
      5. Verifica implementações de timeout
      6. Revisa tratamento de erros
      7. Verifica traduções
      8. Avalia tamanho e complexidade dos métodos

# 🛠️ Revisão de Implementação

1. [[You]] [[verifica logging]]
   1. [[verifica logging]]
      1. Verifica logging de debug adequado:
```dart
// Bom: Logging adequado
Future<void> updateItem(ItemDto item) async {
  log.debug('Atualizando item: ${item.id}');
  try {
    await _api.updateItem(item);
    log.debug('Item atualizado com sucesso');
  } catch (error, stackTrace) {
    log.error(
      'Erro ao atualizar item',
      error: error,
      stackTrace: stackTrace,
    );
    rethrow;
  }
}
```

2. [[You]] [[verifica feedback do usuário]]
   1. [[verifica feedback do usuário]]
      1. Verifica implementação adequada de feedback:
```dart
// Bom: Feedback adequado
Future<void> deleteItem(String id) async {
  if (gIsBusy) return;

  try {
    gSetBusy();
    final response = await _api.deleteItem(id);
    response.fold(
      ifSuccess: (_) => gShowNotification(title: gStrings.itemDeleted),
      orElse: (response) => gShowResponse(response: response),
    );
  } catch (error, stackTrace) {
    log.error(
      'Erro ao excluir item',
      error: error,
      stackTrace: stackTrace,
    );
  } finally {
    gSetIdle();
  }
}
```

3. [[You]] [[verifica gerenciamento de estado]]
   1. [[verifica gerenciamento de estado]]
      1. Verifica implementação adequada de limpeza:
```dart
// Bom: Limpeza adequada
class GoodViewModel extends BaseViewModel {
  final _subscription = StreamController<List<ItemDto>>();
  final _items = ValueNotifier<List<ItemDto>>([]);

  @override
  Future<void> dispose() async {
    await _subscription.close();
    _items.dispose();
    super.dispose();
  }
}
```

4. [[You]] [[verifica tratamento de erros]]
   1. [[verifica tratamento de erros]]
      1. Verifica tratamento adequado de erros com timeouts:
```dart
// Bom: Tratamento adequado de erros com timeouts
Future<void> fetchData() async {
  try {
    final data = await _api.getData().timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeoutException('Timeout ao buscar dados'),
    );
    _items.value = data;
  } on TimeoutException catch (error) {
    log.error('Timeout ao buscar dados', error: error);
    gShowDialog(
      title: gStrings.error,
      message: gStrings.connectionTimeout,
    );
  } catch (error, stackTrace) {
    log.error(
      'Erro ao buscar dados',
      error: error,
      stackTrace: stackTrace,
    );
    gShowDialog(
      title: gStrings.error,
      message: gStrings.generalError,
    );
  }
}
```

# ✅ Verificação

1. [[You]] [[verifica qualidade do código]]
   1. [[verifica qualidade do código]]
      1. Documentação está completa
      2. Sem números/strings mágicos
      3. Convenções de nomenclatura consistentes
      4. Sem código comentado

2. [[You]] [[verifica tratamento de erros]]
   1. [[verifica tratamento de erros]]
      1. Blocos try/catch implementados
      2. Feedback do usuário para todas as ações
      3. Logging de erros adequado
      4. Timeouts onde necessário

3. [[You]] [[verifica gerenciamento de estado]]
   1. [[verifica gerenciamento de estado]]
      1. Todos os disposables limpos
      2. Sem vazamentos de memória
      3. Atualizações de UI eficientes

4. [[You]] [[verifica performance]]
   1. [[verifica performance]]
      1. Sem reconstruções desnecessárias
      2. Operações pesadas fora da thread principal
      3. Cache adequado de recursos

5. [[You]] [[verifica segurança]]
   1. [[verifica segurança]]
      1. Sem dados sensíveis nos logs
      2. Toda entrada do usuário validada
      3. Controle de acesso adequado
      4. Sem credenciais hardcoded
