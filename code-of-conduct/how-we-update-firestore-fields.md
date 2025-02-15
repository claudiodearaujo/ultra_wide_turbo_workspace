---
document_type: code of conduct
goal: definir processo para atualização de campos do Firestore com tratamento adequado de valores nulos
gpt_action: siga estes passos ao implementar atualizações de campos do Firestore
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica requisitos de atualização]]
   1. [[verifica requisitos de atualização]]
      1. Verifica se campos são nulos
      2. Revisa necessidades de integridade de dados
      3. Verifica necessidades de atualização em tempo real
      4. Identifica métodos de coleta de entrada

2. [[You]] [[confirma tipos de requisição]]
   1. [[confirma tipos de requisição]]
      1. Verifica se é requisição de atualização regular
      2. Verifica se é requisição de campos nulos
      3. Revisa necessidades de serialização JSON
      4. Verifica correspondência de campos DTO

# 🛠️ Implementação

1. [[You]] [[cria requisições de atualização]]
   1. [[cria requisições de atualização]]
      1. Requisição de atualização regular:
```dart
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UpdateItemDtoRequest extends Writeable {
  UpdateItemDtoRequest({
    required this.name,
  });

  final String name;
}
```
      2. Requisição de campos nulos:
```dart
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UpdateCompletedAtRequest extends Writeable {
  UpdateCompletedAtRequest({
    required this.completedAt,
    required this.completedBy,
  });

  @TimestampConverter()
  final DateTime? completedAt;
  final String? completedBy;
}
```

2. [[You]] [[implementa atualizações de serviço]]
   1. [[implementa atualizações de serviço]]
      1. Atualização de campo regular:
```dart
Future<TurboResponse<DocumentReference>> updateItemName({
  required String itemId,
  required String name,
}) async {
  final item = findById(itemId);
  final updatedItem = item.copyWith(name: name);
  
  return updateDoc(
    doc: updatedItem,
    remoteUpdateRequestBuilder: (doc) => UpdateItemDtoRequest(
      name: name,
    ),
  );
}
```
      2. Atualização de campo nulo:
```dart
Future<TurboResponse<DocumentReference>> updateCompletionStatus({
  required String itemId,
  required DateTime? completedAt,
  required String? completedBy,
}) async {
  final item = findById(itemId);
  final updatedItem = item.copyWith(
    completedAt: completedAt,
    completedBy: completedBy,
    forceNull: true, // Importante para campos nulos
  );
  
  return updateDoc(
    doc: updatedItem,
    remoteUpdateRequestBuilder: (doc) => UpdateCompletedAtRequest(
      completedAt: completedAt,
      completedBy: completedBy,
    ),
  );
}
```

3. [[You]] [[implementa suporte dto]]
   1. [[implementa suporte dto]]
      1. Adiciona copyWith com suporte a nulos:
```dart
YourDto copyWith({
  String? name,
  DateTime? completedAt,
  String? completedBy,
  bool forceNull = false, // Adicione este parâmetro
}) =>
    YourDto(
      // Campos regulares
      name: name ?? this.name,
      // Campos nulos
      completedAt: forceNull ? completedAt : completedAt ?? this.completedAt,
      completedBy: forceNull ? completedBy : completedBy ?? this.completedBy,
    );
```

4. [[You]] [[trata respostas]]
   1. [[trata respostas]]
      1. Implementa tratamento de resposta:
```dart
final response = await updateCompletionStatus(
  itemId: 'id',
  completedAt: null,
  completedBy: null,
);

if (response.isSuccess) {
  // Mostra feedback de sucesso
} else {
  // Mostra feedback de erro
}
```

# ✅ Verificação

1. [[You]] [[verifica objetos de requisição]]
   1. [[verifica objetos de requisição]]
      1. Atualizações regulares usam includeIfNull: false
      2. Atualizações nulas usam includeIfNull: true
      3. Nomes dos campos correspondem à estrutura DTO
      4. Suporte adequado à serialização JSON

2. [[You]] [[verifica camada de serviço]]
   1. [[verifica camada de serviço]]
      1. Atualizações de estado local imediatas funcionam
      2. Atualizações otimistas de UI funcionam
      3. Atualizações de campos específicos funcionam
      4. Campos nulos são tratados corretamente

3. [[You]] [[verifica implementação dto]]
   1. [[verifica implementação dto]]
      1. copyWith suporta campos nulos
      2. Parâmetro forceNull funciona
      3. Campos regulares atualizam corretamente
      4. Tratamento de erros funciona adequadamente 
