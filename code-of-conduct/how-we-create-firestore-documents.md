---
document_type: code of conduct
goal: definir estrutura e processo para criar documentos do Firestore
gpt_action: siga estes passos ao implementar funcionalidade de documentos do Firestore
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica componentes existentes]]
   1. [[verifica componentes existentes]]
      1. Procura por DTOs na pasta `dtos` da feature
      2. Verifica serviços na pasta `services` da feature
      3. Procura por APIs na pasta `apis` da feature
      4. Verifica implementações similares existentes

2. [[You]] [[confirma detalhes de implementação]]
   1. [[confirma detalhes de implementação]]
      1. Verifica estrutura da collection do Firestore
      2. Confirma se está usando `CollectionService` ou `DocumentService`
      3. Verifica relacionamentos necessários com outras collections
      4. Procura por implementações similares

3. [[You]] [[declara premissas]]
   1. [[declara premissas]]
      1. Estendemos `CollectionService` ou `DocumentService`
      2. Usamos DTOs implementando `TurboWriteableId<String>`
      3. Seguimos estrutura consistente de collection
      4. Implementamos logging adequado usando Loglytics
      5. Reutilizamos componentes existentes quando possível

4. [[You]] [[solicita esclarecimentos]]
   1. [[solicita esclarecimentos]]
      1. Confirma se dados pertencem a collection ou documento único
      2. Verifica requisitos de regras de segurança da collection
      3. Verifica requisitos específicos de tratamento de erros
      4. Confirma requisitos específicos de logging
      5. Pergunta sobre componentes reutilizáveis

# 🛠️ Implementação

1. [[You]] [[configura collection]]
   1. [[configura collection]]
      1. Cria collection do Firestore com estrutura adequada
      2. Configura regras de segurança:
```firestore-security-rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /items/{itemId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

2. [[You]] [[cria DTO]]
   1. [[cria DTO]]
      1. Implementa `TurboWriteableId<String>`
      2. Define campos obrigatórios
      3. Cria métodos factory:
```dart
class ItemDto implements TurboWriteableId<String> {
  @override
  final String id;
  final String name;
  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  final String createdBy;
  final String? parentId;

  @override
  bool get isLocalDefault => false;

  ItemDto({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.parentId,
  });

  factory ItemDto.defaultValue({
    required String id,
    required String userId,
    String? parentId,
    required String name,
  }) {
    final now = gNow;
    return ItemDto(
      id: id,
      name: name,
      createdAt: now,
      updatedAt: now,
      createdBy: userId,
      parentId: parentId,
    );
  }
}
```

3. [[You]] [[implementa serviço]]
   1. [[implementa serviço]]
      1. Cria API estendendo `BaseApi`:
```dart
class ItemsApi extends BaseApi<ItemDto> {
  ItemsApi()
      : super(
          firestoreCollection: FirestoreCollection.items,
        );
}
```
      2. Cria serviço estendendo serviço base:
```dart
class ItemsService extends CollectionService<ItemDto, ItemsApi> {
  ItemsService({
    required super.api,
  });

  Future<TurboResponse<DocumentReference>> createItem({
    required String name,
    String? parentId,
  }) async {
    log.debug('Criando item com nome: $name');
    
    final item = ItemDto.defaultValue(
      id: api.genId,
      userId: currentUser.id,
      parentId: parentId,
      name: name,
    );
    
    return createDoc(doc: item);
  }
}
```

4. [[You]] [[implementa UI]]
   1. [[implementa UI]]
      1. SE [[usando entrada de formulário]]
```dart
void onCreateShoppingListTapped() {
  _sheetService.showInputSheet(
    sheetBuilder: (context) {
      return TextFormFieldSheet(
        title: strings.createShoppingList,
        message: strings.enterTheNameForTheNewShoppingList,
        saveButtonText: strings.create,
        formFieldLabel: strings.name,
        formFieldHint: strings.shoppingLists,
        onSavedPressed: (context) => _onSaveNewShoppingListPressed(
          context: context,
        ),
        textFormFieldConfig: _shoppingListForm.nameField,
      );
    },
  );
}
```
      2. SE [[usando criação direta]]
```dart
Future<void> onCreateDefaultListTapped() async {
  try {
    log.debug('Criando lista de compras padrão');
    final response = await _shoppingListsService.createShoppingList(
      title: 'Minha Lista de Compras',
    );
    
    if (response.isSuccess) {
      gShowNotification(title: gStrings.createShoppingList);
    } else {
      gShowResponse(response: response);
    }
  } catch (error, stackTrace) {
    log.error(
      'Erro ao criar lista de compras padrão',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
```

# ✅ Verificação

1. [[You]] [[verifica implementação]]
   1. [[verifica implementação]]
      1. Collection do Firestore configurada adequadamente
      2. Regras de segurança configuradas corretamente
      3. Serviço estende serviço base apropriado
      4. Serviço registrado com dependências
      5. UI fornece feedback claro
      6. Validação de formulário implementada (se aplicável)
      7. Criação de documento testada
