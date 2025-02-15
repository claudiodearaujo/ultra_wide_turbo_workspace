---
document_type: code of conduct
goal: definir processo para sincronização de dados do Firestore dependentes de pai
gpt_action: siga estes passos ao implementar sincronização de dados dependentes de pai
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica requisitos de sincronização]]
   1. [[verifica requisitos de sincronização]]
      1. Verifica se dados precisam de pré-processamento (BeforeParentSyncService)
      2. Verifica se dados precisam de pós-processamento (AfterParentSyncService)
      3. Verifica se não precisa de processamento (ParentSyncService)
      4. Confirma requisitos do campo parentId

2. [[You]] [[confirma necessidades de segurança]]
   1. [[confirma necessidades de segurança]]
      1. Verifica regras de associação ao pai
      2. Verifica requisitos de controle de acesso
      3. Revisa necessidades de limpeza de dados
      4. Confirma gerenciamento de assinatura

# 🛠️ Implementação

1. [[You]] [[cria modelo de dados]]
   1. [[cria modelo de dados]]
      1. Cria DTO com parentId:
```dart
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ItemDto extends TurboWriteableId<String> {
  ItemDto({
    required this.id,
    required this.parentId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  final String parentId;
  final String name;
  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  final String createdBy;
}
```

2. [[You]] [[implementa serviço de sincronização]]
   1. [[implementa serviço de sincronização]]
      1. Escolhe serviço base apropriado:
```dart
// Para pré-processamento de dados
class ItemsService extends BeforeParentSyncService<ItemDto, ItemsApi> {
  // ...
}

// Para sincronização direta
class SubItemsService extends ParentSyncService<SubItemDto, SubItemsApi> {
  // ...
}

// Para pós-processamento de dados
class InvitesService extends AfterParentSyncService<InviteDto, InvitesApi> {
  // ...
}
```

3. [[You]] [[configura stream do pai]]
   1. [[configura stream do pai]]
      1. Implementa método de stream do pai:
```dart
@override
FutureOr<Stream<List<ItemDto?>>> parentStream(User user, String? parentId) {
  if (parentId == null) return Stream.value(null);
  return api.findStreamByQueryWithConverter(
    whereDescription: 'parentId é $parentId',
    collectionReferenceQuery: (collectionReference) => 
      collectionReference.where(kKeysParentId, isEqualTo: parentId),
  );
}
```

4. [[You]] [[configura regras de segurança]]
   1. [[configura regras de segurança]]
      1. Adiciona regras de segurança do Firestore:
```
match /items/{documentId} {
  allow create: if hasAuth() && 
    request.auth.uid == request.resource.data.createdBy && 
    isParentMember(request.resource.data.parentId);
  allow read, update, delete: if hasAuth() && 
    isParentMember(resource.data.parentId);
}
```

# ✅ Verificação

1. [[You]] [[verifica implementação]]
   1. [[verifica implementação]]
      1. DTO inclui campo parentId
      2. Serviço estende classe base correta
      3. Método parentStream filtra corretamente
      4. Regras de segurança aplicam associação ao pai

2. [[You]] [[verifica limpeza]]
   1. [[verifica limpeza]]
      1. Assinaturas antigas são limpas
      2. Dados são resetados na mudança de pai
      3. Dados do novo pai são reassinados
      4. Não há vazamentos de memória

3. [[You]] [[verifica tratamento de erros]]
   1. [[verifica tratamento de erros]]
      1. Casos de parentId nulo são tratados
      2. Erros de stream são capturados
      3. Violações de regras de segurança são tratadas
      4. Erros de mudança de pai são gerenciados
