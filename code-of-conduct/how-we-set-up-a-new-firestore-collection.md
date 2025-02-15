---
document_type: code of conduct
goal: definir processo para configurar novas coleções do Firestore com arquitetura adequada
gpt_action: siga estes passos ao implementar uma nova coleção do Firestore
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica requisitos da coleção]]
   1. [[verifica requisitos da coleção]]
      1. Verifica se a coleção já existe
      2. Revisa necessidades da estrutura de dados
      3. Verifica relacionamentos pai-filho
      4. Confirma requisitos de segurança

2. [[You]] [[confirma detalhes de implementação]]
   1. [[confirma detalhes de implementação]]
      1. Verifica estrutura do DTO
      2. Verifica necessidades da camada de serviço
      3. Revisa requisitos da API
      4. Confirma configuração de dependências

# 🛠️ Implementação

1. [[You]] [[configura estrutura da coleção]]
   1. [[configura estrutura da coleção]]
      1. Adiciona ao enum FirestoreCollection:
```dart
enum FirestoreCollection {
  users,
  items, // Nova coleção
  ;
}
```
      2. Cria DTO com campos necessários:
```dart
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ItemDto extends TurboWriteableId<String> {
  ItemDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.name,
    this.parentId,
  });

  @override
  final String id;
  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  final String createdBy;
  final String name;
  final String? parentId; // Opcional, para dados hierárquicos
}
```

2. [[You]] [[configura segurança]]
   1. [[configura segurança]]
      1. Atualiza regras de segurança:
```
match /items/{documentId} {
  allow create: if hasAuth() && 
    request.auth.uid == request.resource.data.createdBy && 
    isParentMember(request.resource.data.parentId);
  allow read: if hasAuth() && 
    isParentMember(resource.data.parentId);
  allow update: if hasAuth() && 
    isParentMember(resource.data.parentId);
  allow delete: if hasAuth() && 
    isParentMember(resource.data.parentId);
}
```

3. [[You]] [[implementa camada de serviço]]
   1. [[implementa camada de serviço]]
      1. Cria serviço da coleção:
```dart
class ItemsService extends CollectionService<ItemDto, ItemsApi> {
  ItemsService() : super(api: ItemsApi.locate);

  @override
  Stream<List<ItemDto>> Function(User user) get stream =>
      (user) => api.findStreamWithConverter();
}
```

4. [[You]] [[configura dependências]]
   1. [[configura dependências]]
      1. Registra no locator:
```dart
class Locator {
  static void _registerFactories() {
    ItemsApi.registerFactory();
  }

  static void _registerLazySingletons() {
    ItemsService.registerLazySingleton();
  }
}
```

5. [[You]] [[implementa uso]]
   1. [[implementa uso]]
      1. Cria implementação do view model:
```dart
class ItemViewModel extends BaseViewModel {
  // Acessa o serviço através do locator
  final _itemsService = ItemsService.locate;
}
```

# ✅ Verificação

1. [[You]] [[verifica estrutura]]
   1. [[verifica estrutura]]
      1. Enum da coleção está atualizado
      2. DTO implementa TurboWriteableId
      3. Campos obrigatórios estão definidos
      4. Timestamps usam o conversor adequado

2. [[You]] [[verifica segurança]]
   1. [[verifica segurança]]
      1. Regras de leitura estão devidamente definidas
      2. Regras de escrita incluem verificações de autenticação
      3. Relacionamentos pai-filho estão seguros
      4. Permissões de usuário validadas

3. [[You]] [[verifica implementação]]
   1. [[verifica implementação]]
      1. Serviço estende a classe base correta
      2. Registro da API está completo
      3. Dependências estão registradas corretamente
      4. Manipulação de stream está implementada
      5. Acesso do view model está configurado 
