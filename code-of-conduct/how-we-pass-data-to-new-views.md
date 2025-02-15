---
document_type: code of conduct
goal: definir processo para passar dados entre views usando ViewArguments e routing
gpt_action: siga estes passos ao implementar passagem de dados entre views
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica requisitos]]
   1. [[verifica requisitos]]
      1. Verifica se dados precisam ser passados via parâmetros de URL
      2. Verifica se objetos complexos precisam ser passados
      3. Revisa parâmetros obrigatórios vs opcionais
      4. Verifica padrões de argumentos existentes

2. [[You]] [[confirma detalhes de implementação]]
   1. [[confirma detalhes de implementação]]
      1. Verifica necessidades específicas de argumentos da view
      2. Verifica requisitos de routing
      3. Revisa necessidades de gerenciamento de estado
      4. Confirma valores padrão

# 🛠️ Implementação

1. [[You]] [[cria argumentos da view]]
   1. [[cria argumentos da view]]
      1. Cria classe de argumentos específica da view:
```dart
class MyViewArguments extends ViewArguments {
  MyViewArguments({
    required this.requiredField,
    this.optionalField,
  });

  final String requiredField;
  final String? optionalField;

  @override
  Map<String, dynamic> toMap() => {
    'requiredField': requiredField,
    'optionalField': optionalField,
  };
}
```
      2. Atualiza ViewArgumentsImpl:
```dart
class ViewArgumentsImpl extends ViewArguments {
  ViewArgumentsImpl({
    // ... campos existentes
    this.requiredField,
    this.optionalField,
  });

  final String? requiredField;
  final String? optionalField;
}
```

2. [[You]] [[implementa extensão de estado]]
   1. [[implementa extensão de estado]]
      1. Adiciona getters ao GoRouterState:
```dart
extension on GoRouterState {
  ViewArgumentsImpl? arguments() => extra?.asType<ViewArgumentsImpl>();
  
  // Campo obrigatório com valor padrão
  String get requiredField => arguments()?.requiredField ?? '';
  
  // Campo opcional
  String? get optionalField => arguments()?.optionalField;
  
  // Exemplo de parâmetro URL
  String? get itemId => 
      pathParameters[kKeysItemId] ?? 
      uri.queryParameters[kKeysItemId] ?? 
      arguments()?.itemId;
}
```

3. [[You]] [[configura routing]]
   1. [[configura routing]]
      1. Cria rota no BaseRouter:
```dart
static GoRoute get myView => GoRoute(
  path: MyView.path.asRootPath,
  pageBuilder: (context, state) => CustomTransitionPage(
    child: MyView(
      arguments: MyViewArguments(
        requiredField: state.requiredField,
        optionalField: state.optionalField,
      ),
    ),
  ),
);
```
      2. Adiciona às rotas do router:
```dart
final coreRouter = GoRouter(
  routes: [
    // ... rotas existentes
    myView,
  ],
);
```

4. [[You]] [[implementa navegação]]
   1. [[implementa navegação]]
      1. Cria método de navegação:
```dart
Future<void> pushMyView({
  required String requiredField,
  String? optionalField,
}) async =>
    push(
      location: MyView.path.asRootPath,
      extra: ViewArgumentsImpl(
        requiredField: requiredField,
        optionalField: optionalField,
      ),
    );
```

# ✅ Verificação

1. [[You]] [[verifica manipulação de argumentos]]
   1. [[verifica manipulação de argumentos]]
      1. Verifica se campos obrigatórios são não-nulos nos argumentos da view
      2. Verifica se campos opcionais são nulos no ViewArgumentsImpl
      3. Confirma valores padrão na extensão de estado
      4. Testa passagem de argumentos com diferentes tipos de dados

2. [[You]] [[verifica routing]]
   1. [[verifica routing]]
      1. Testa manipulação de parâmetros URL
      2. Verifica registro de rota
      3. Verifica métodos de navegação
      4. Testa preservação de argumentos durante navegação

3. [[You]] [[verifica nomenclatura]]
   1. [[verifica nomenclatura]]
      1. Classe de argumentos da view segue padrão `[ViewName]Arguments`
      2. Getter de rota segue padrão `get [viewName]`
      3. Constante de path segue padrão `path = '[view-name]'`
      4. Métodos de navegação seguem convenções de nomenclatura estabelecidas 
