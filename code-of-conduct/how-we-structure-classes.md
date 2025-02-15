---
document_type: código de conduta
goal: definir estrutura padrão para organizar código de classes com seções claras
gpt_action: siga estes padrões de seção ao criar ou modificar arquivos de classe
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica necessidades da classe]]
   1. [[verifica necessidades da classe]]
      1. Verifica se é classe de serviço
      2. Verifica se é view model
      3. Verifica se é classe de widget
      4. Identifica seções necessárias

2. [[You]] [[confirma requisitos de seção]]
   1. [[confirma requisitos de seção]]
      1. Verifica necessidades de injeção de dependência
      2. Revisa necessidades de gerenciamento de estado
      3. Verifica necessidades de tratamento de eventos
      4. Identifica métodos auxiliares necessários

# 🛠️ Implementação

1. [[You]] [[configura seções da classe]]
   1. [[configura seções da classe]]
      1. Adiciona cabeçalhos de seção com divisores:
```dart
// 📍 LOCATOR ------------------------------------------------------------------------------- \\
// Para injeção de dependência e localização de serviço
- Getters/métodos estáticos para injeção de dependência
- Métodos de registro de factory

// 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
// Para dependências e serviços injetados
- Instâncias finais de serviço
- Instâncias de API
- Outras dependências

// 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
// Para inicialização e limpeza
- Sobrescritas de initState/dispose
- Métodos de inicialização personalizados
- Métodos de limpeza

// 👂 LISTENERS ----------------------------------------------------------------------------- \\
// Para ouvintes de eventos e assinaturas
- Assinaturas de stream
- Manipuladores de eventos
- Métodos de callback

// ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
// Para sobrescritas de métodos das classes pai
- Sobrescritas obrigatórias
- Sobrescritas opcionais
- Implementações de interface

// 🎩 STATE --------------------------------------------------------------------------------- \\
// Para gerenciamento de estado
- ValueNotifiers
- StateNotifiers
- Controladores de formulário
- Variáveis de estado local

// 🛠 UTIL ---------------------------------------------------------------------------------- \\
// Para utilitários técnicos
- Mutexes
- Debouncers
- Auxiliares técnicos

// 🧲 FETCHERS ------------------------------------------------------------------------------ \\
// Para recuperação de dados
- Getters
- Métodos de busca de dados

// 🏗️ HELPERS ------------------------------------------------------------------------------- \\
// Para operações complexas e lógica de negócio
- Métodos de lógica de negócio
- Cálculos complexos
- Transformações de dados
- Funções auxiliares
- Formatadores

// 🪄 MUTATORS ------------------------------------------------------------------------------ \\
// Para mutações e atualizações de estado
- Métodos que alteram estado
- Operações de atualização
- Chamadas de API
```

2. [[You]] [[implementa exemplo de serviço]]
   1. [[implementa exemplo de serviço]]
      1. Cria classe de serviço de exemplo:
```dart
class DataService extends BaseService {
  // 📍 LOCATOR
  static DataService get locate => GetIt.I.get();
  static void registerLazySingleton() => GetIt.I.registerLazySingleton(DataService.new);

  // 🧩 DEPENDENCIES
  final _parentService = ParentService.locate;
  final _api = DataApi.locate;

  // 🎬 INIT & DISPOSE
  @override
  Future<void> dispose() async {
    _items.dispose();
    await super.dispose();
  }

  // 🎩 STATE
  final _items = Informer<List<ItemDto>>([]);
  final _isProcessing = ValueNotifier<bool>(false);

  // 🧲 FETCHERS
  ValueListenable<List<ItemDto>> get items => _items;
  ValueListenable<bool> get isProcessing => _isProcessing;
  String get genId => _api.genId;

  // 🏗️ HELPERS
  List<ItemDto> _processItems(List<ItemDto> items) {
    return items..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // 🪄 MUTATORS
  Future<TurboResponse<DocumentReference>> createItem({
    required String name,
    String? parentId,
  }) async {
    try {
      _isProcessing.value = true;
      
      final item = ItemDto(
        id: genId,
        name: name,
        parentId: parentId,
        createdAt: gNow,
        updatedAt: gNow,
        createdBy: currentUser.id,
      );
      
      return createDoc(doc: item);
    } finally {
      _isProcessing.value = false;
    }
  }
}
```

3. [[You]] [[implementa exemplo de view model]]
   1. [[implementa exemplo de view model]]
      1. Cria classe de view model de exemplo:
```dart
class ItemViewModel extends BaseViewModel {
  // 📍 LOCATOR
  static ItemViewModel get locate => GetIt.I.get();
  static void registerFactory() => GetIt.I.registerFactory(ItemViewModel.new);

  // 🧩 DEPENDENCIES
  final _service = DataService.locate;
  final _dialogService = DialogService.locate;

  // 🎩 STATE
  late final _form = ItemForm();
  final _isSaving = ValueNotifier<bool>(false);

  // 🧲 FETCHERS
  ValueListenable<List<ItemDto>> get items => _service.items;
  ValueListenable<bool> get isSaving => _isSaving;
  bool get isValid => _form.isValid;

  // 🪄 MUTATORS
  Future<void> onSavePressed() async {
    if (gIsBusy || !isValid) return;

    try {
      gSetBusy();
      _isSaving.value = true;

      final response = await _service.createItem(
        name: _form.nameField.value!,
        parentId: currentParent?.id,
      );

      response.fold(
        ifSuccess: (_) => gShowNotification(title: gStrings.itemCreated),
        orElse: (response) => gShowResponse(response: response),
      );
    } catch (error, stackTrace) {
      log.error(
        'Erro ao criar item',
        error: error,
        stackTrace: stackTrace,
      );
    } finally {
      _isSaving.value = false;
      gSetIdle();
    }
  }
}
```

# ✅ Verificação

1. [[You]] [[verifica estrutura de seções]]
   1. [[verifica estrutura de seções]]
      1. Todas as seções presentes e em ordem
      2. Divisores e emojis apropriados usados
      3. Comentários de seção explicam propósito
      4. Código organizado nas seções corretas

2. [[You]] [[verifica exemplos]]
   1. [[verifica exemplos]]
      1. Exemplo de serviço demonstra seções
      2. Exemplo de view model mostra padrões
      3. Código segue diretrizes de seção
      4. Exemplos são claros e completos

3. [[You]] [[verifica snippet]]
   1. [[verifica snippet]]
      1. Salva como snippet `allheaders`:
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
