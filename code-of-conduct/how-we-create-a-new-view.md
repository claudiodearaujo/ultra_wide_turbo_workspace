---
document_type: code of conduct
goal: definir processo para criar novas views na aplicação
gpt_action: siga estes passos ao criar uma nova view
---

# 🎯 Processo de Criação de View

1. [[You]] [[gera arquivos base]]
   1. [[gera arquivos base]]
      - 1. Navega para o projeto: `cd project_flutter`
      - 2. Executa script: `dart scripts/create_view.dart`
      - 3. Insere nome da feature quando solicitado (ex: "items")
      - 4. Insere nome do arquivo em snake_case sem '_view' (ex: "manage_item")

2. [[You]] [[configura view]]
   1. [[configura view]]
      - 1. Atualiza path da view com parâmetros
      - 2. Adiciona argumentos e origem necessários
      - 3. Atualiza elementos de UI
      ```dart
      class ManageItemView extends StatelessWidget {
        static const String path = 'manage-item/:$kKeysItemId';
        
        final ManageItemViewArguments arguments;
        final ManageItemViewOrigin origin;
        
        header: EmojiHeader.scaffoldTitle(
          emoji: Emoji.box,
          title: 'Manage Item',
        ),
      }
      ```

3. [[You]] [[configura argumentos]]
   1. [[configura argumentos]]
      - 1. Cria classe de argumentos com tipagem segura
      - 2. Define propriedades obrigatórias
      - 3. Implementa método toMap
      ```dart
      class ManageItemViewArguments extends ViewArguments {
        ManageItemViewArguments({required this.itemId});

        final String? itemId;

        @override
        Map<String, dynamic> toMap() => {
          if (itemId != null) kKeysItemId: itemId,
        };
      }
      ```

4. [[You]] [[configura routing]]
   1. [[configura routing]]
      - 1. Adiciona extensão de manipulação de parâmetros
      - 2. Cria rota no base router
      - 3. Adiciona rota ao router pai
      ```dart
      extension on GoRouterState {
        String? get itemId =>
            pathParameters[kKeysItemId] ?? 
            uri.queryParameters[kKeysItemId] ?? 
            arguments()?.itemId;
      }

      static GoRoute get manageItemView => GoRoute(
        path: ManageItemView.path,
        redirect: (context, state) {
          if (!AuthService.locate.hasAuth.value) {
            return AuthView.path.asRootPath;
          }
          return null;
        },
        pageBuilder: (context, state) => _buildPage(
          child: ManageItemView(
            arguments: ManageItemViewArguments(
              itemId: state.itemId!,
            ),
            origin: ManageItemViewOrigin.core,
          ),
        ),
      );
      ```

5. [[You]] [[adiciona navegação]]
   1. [[adiciona navegação]]
      - 1. Cria método de navegação no router da feature
      ```dart
      Future<void> pushManageItemView({
        required String itemId,
      }) async =>
          push(
            location: '$root'
                '/${ManageItemView.path}'.withItemId(itemId),
            extra: [
              ManageItemViewArguments(itemId: itemId),
            ],
          );
      ```

6. [[You]] [[registra view model]]
   1. [[registra view model]]
      - 1. Adiciona registro na configuração do app
      ```dart
      void registerViewModels() {
        ManageItemViewModel.registerFactory();
      }
      ```

# ✅ Lista de Verificação

1. [[You]] [[verifica implementação]]
   1. [[verifica implementação]]
      - 1. Confirma que arquivos da view foram gerados com nomes corretos
      - 2. Verifica se path da view inclui parâmetros necessários
      - 3. Verifica se argumentos estendem ViewArguments
      - 4. Confirma que enum de origem existe com valores apropriados
      - 5. Verifica se base router inclui rota com verificações de autenticação
      - 6. Verifica manipulação de parâmetros de todas as fontes
      - 7. Confirma que router da feature tem métodos de navegação
      - 8. Verifica registro do view model na configuração do app
      - 9. Verifica se elementos de UI usam widgets base apropriados
      - 10. Confirma que métodos de navegação seguem padrões estabelecidos 
