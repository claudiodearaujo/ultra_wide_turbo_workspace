---
document_type: code of conduct
goal: definir processo para excluir documentos do Firestore de forma segura e consistente
gpt_action: siga estes passos ao implementar exclusão de documentos do Firestore
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica requisitos de exclusão]]
   1. [[verifica requisitos de exclusão]]
      1. Verifica se documento pode ser excluído
      2. Verifica quaisquer documentos dependentes
      3. Verifica regras de segurança para exclusão
      4. Revisa padrões de exclusão existentes

2. [[You]] [[confirma detalhes de implementação]]
   1. [[confirma detalhes de implementação]]
      1. Verifica implementação da camada de serviço
      2. Verifica requisitos de UI
      3. Revisa necessidades de tratamento de erros
      4. Confirma requisitos de logging

# 🛠️ Implementação

1. [[You]] [[implementa camada de serviço]]
   1. [[implementa camada de serviço]]
      1. Adiciona funcionalidade de exclusão com validação:
```dart
Future<TurboResponse<void>> deleteItem(ItemDto item) async {
  // Adiciona lógica de validação
  if (item.isProtected) {
    log.debug('Não é possível excluir item protegido');
    return TurboResponse.error(
      title: gStrings.somethingWentWrong,
      message: 'Este item não pode ser excluído.',
    );
  }
  
  log.debug('Excluindo item com id: ${item.id}');
  return deleteDoc(doc: item);
}
```

2. [[You]] [[implementa UI]]
   1. [[implementa UI]]
      1. Adiciona botão de exclusão à view:
```dart
BaseAppBar(
  context: context,
  header: EmojiHeader.scaffoldTitle(
    emoji: Emoji.yourEmoji,
    title: model.title,
  ),
  actions: [
    if (item?.isProtected == false)
      RightPadding(
        child: IconButton(
          iconData: Icons.delete_rounded,
          onPressed: () => model.onDeletePressed(context),
        ),
      ),
  ],
),
```

3. [[You]] [[implementa view model]]
   1. [[implementa view model]]
      1. Adiciona lógica de exclusão com confirmação:
```dart
Future<void> onDeletePressed(BuildContext context) async {
  if (gIsBusy) return;

  final shouldDelete = await gShowOkCancelDialog(
    title: (strings) => gStrings.deleteItem,
    message: (strings) => gStrings.areYouSureYouWantToDeleteThis,
  );

  if (shouldDelete != true) return;

  try {
    gSetBusy();
    final item = _item.value;
    if (item == null) {
      throw const UnexpectedResultException(reason: 'Item não encontrado');
    }
    
    _ignoreChanges = true;
    
    final response = await _service.deleteItem(item);
    response.fold(
      ifSuccess: (response) {
        gShowNotification(title: gStrings.itemDeleted);
        gPop(context);
      },
      orElse: (response) {
        gShowOkDialog(
          title: (strings) => strings.somethingWentWrong,
          message: (strings) => gStrings.failedToDeleteItemPleaseTryAgainLater,
        );
        _ignoreChanges = false;
      },
    );
  } catch (error, stackTrace) {
    log.error(
      '$error capturado durante exclusão do item',
      error: error,
      stackTrace: stackTrace,
    );
    _ignoreChanges = false;
  } finally {
    gSetIdle();
  }
}
```

4. [[You]] [[trata estados vazios]]
   1. [[trata estados vazios]]
      1. Implementa tratamento de estado vazio:
```dart
ValueListenableBuilder<List<ItemDto>>(
  valueListenable: model.items,
  builder: (context, items, child) {
    if (items.isEmpty) {
      return EmptyPlaceholder(
        message: strings.noItemsFound,
        ctaText: strings.goBack,
        onCtaPressed: () => model.onGoBackPressed(context),
      );
    }
    
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemListTile(item: item);
      },
    );
  },
);
```

# ✅ Verificação

1. [[You]] [[verifica camada de serviço]]
   1. [[verifica camada de serviço]]
      1. Valida se método de exclusão funciona
      2. Confirma tratamento do TurboResponse
      3. Verifica implementação de logging

2. [[You]] [[verifica camada de UI]]
   1. [[verifica camada de UI]]
      1. Testa funcionalidade do widget de exclusão
      2. Verifica tratamento de estado vazio
      3. Verifica exibição de estado de erro

3. [[You]] [[verifica view model]]
   1. [[verifica view model]]
      1. Testa tratamento de estado ocupado
      2. Verifica diálogo de confirmação
      3. Verifica bloqueio de atualizações durante exclusão
      4. Testa tratamento de erros
      5. Verifica navegação após exclusão
      6. Confirma limpeza adequada no dispose
