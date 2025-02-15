---
document_type: code of conduct
goal: definir processo para implementação de atualizações granulares da UI
gpt_action: siga estes passos ao implementar atualizações de UI que precisam ser otimizadas
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica necessidades de atualização]]
   1. [[verifica necessidades de atualização]]
      1. Verifica se são atualizações simples de valor
      2. Verifica se são atualizações de coleção
      3. Revisa escopo de reconstrução da UI
      4. Identifica necessidades de gerenciamento de estado

2. [[You]] [[confirma abordagem]]
   1. [[confirma abordagem]]
      1. Verifica se ValueNotifier é suficiente
      2. Verifica se Informer é necessário
      3. Revisa necessidades de manipulação de coleção
      4. Verifica requisitos de encapsulamento

# 🛠️ Implementação

1. [[You]] [[implementa atualizações de valor]]
   1. [[implementa atualizações de valor]]
      1. Implementação básica de ValueNotifier:
```dart
// Exemplo básico de ValueNotifier
final counter = ValueNotifier<int>(0);

// Usando ValueListenableBuilder para atualizações granulares
ValueListenableBuilder<int>(
  valueListenable: counter,
  builder: (context, value, child) {
    return Text('Contagem: $value');
  },
)
```

2. [[You]] [[implementa informer]]
   1. [[implementa informer]]
      1. Cria Informer com suporte a coleção:
```dart
class InvitesService {
  // Informer privado
  final _invites = Informer<List<InviteModel>>(
    [],
    forceUpdate: true,
  );

  // ValueListenable público
  ValueListenable<List<InviteModel>> get invites => _invites;
}
```

3. [[You]] [[implementa exemplo real]]
   1. [[implementa exemplo real]]
      1. Implementação de convites de equipe:
```dart
class InvitesService {
  final _sentInvites = Informer<List<InviteModel>>(
    [],
    forceUpdate: true,
  );
  final _receivedInvites = Informer<List<InviteModel>>(
    [],
    forceUpdate: true,
  );

  ValueListenable<List<InviteModel>> get sentInvites => _sentInvites;
  ValueListenable<List<InviteModel>> get receivedInvites => _receivedInvites;

  @override
  Future<void> afterSyncNotifyUpdate(List<InviteDto> docs) async {
    final inviteModels = <InviteModel>[];
    // Processa docs...

    final currentUserId = gUserId;
    final sent = <InviteModel>[];
    final received = <InviteModel>[];

    for (final invite in inviteModels) {
      if (invite.dto.createdBy == currentUserId) {
        sent.add(invite);
      }
      if (invite.dto.recipientId == currentUserId) {
        received.add(invite);
      }
    }

    _sentInvites.update(sent);
    _receivedInvites.update(received);
  }
}
```

4. [[You]] [[implementa métodos de atualização]]
   1. [[implementa métodos de atualização]]
      1. Usa método de atualização apropriado:
```dart
// Substitui valor atual
_invites.update(newValue);

// Modifica valor atual in-place
_invites.updateCurrent((current) => current..add(newItem));

// Atualiza sem notificar
_invites.silentUpdate(newValue);

// Força notificação sem mudança de valor
_invites.rebuild();
```

# ✅ Verificação

1. [[You]] [[verifica controle de atualização]]
   1. [[verifica controle de atualização]]
      1. Métodos de atualização funcionam corretamente
      2. Atualizações silenciosas não disparam reconstruções
      3. Atualizações forçadas funcionam para coleções
      4. Reconstruções acontecem quando necessário

2. [[You]] [[verifica encapsulamento]]
   1. [[verifica encapsulamento]]
      1. Informers são privados
      2. Apenas ValueListenable é exposto
      3. Atualizações de coleção são confiáveis
      4. Estado está adequadamente isolado

3. [[You]] [[verifica melhores práticas]]
   1. [[verifica melhores práticas]]
      1. ValueListenableBuilder colocado profundamente na árvore
      2. forceUpdate habilitado para coleções
      3. Separação limpa de dados e UI
      4. Seleção adequada do método de atualização
