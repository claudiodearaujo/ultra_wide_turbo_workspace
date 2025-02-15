---
document_type: code of conduct
goal: definir processo para configurar Firebase em projetos mono repo
gpt_action: siga estes passos ao configurar Firebase para aplicações Flutter
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica requisitos]]
   1. [[verifica requisitos]]
      1. Verifica serviços Firebase necessários
      2. Verifica plataformas alvo
      3. Revisa necessidades do ambiente de desenvolvimento
      4. Confirma estrutura mono repo:
```
project_mono/
  ├── project_firebase/
  └── project_flutter/
```

2. [[You]] [[confirma detalhes de configuração]]
   1. [[confirma detalhes de configuração]]
      1. Verifica requisitos do Firebase CLI
      2. Verifica necessidades do FlutterFire CLI
      3. Revisa requisitos de emulador
      4. Confirma necessidades de troca de ambiente

# 🛠️ Implementação

1. [[You]] [[instala pré-requisitos]]
   1. [[instala pré-requisitos]]
      1. Instala CLIs necessários:
```bash
# Instala Firebase CLI
npm install -g firebase-tools

# Instala FlutterFire CLI
dart pub global activate flutterfire_cli

# Faz login no Firebase
firebase login
```

2. [[You]] [[configura projeto firebase]]
   1. [[configura projeto firebase]]
      1. Cria projeto no Console Firebase
      2. Inicializa Firebase:
```bash
# Navega para diretório Firebase
cd your_project_firebase

# Inicializa Firebase
firebase init

# Seleciona recursos necessários:
# - Firestore
# - Authentication
# - Storage
# - Emulators
```

3. [[You]] [[configura flutter]]
   1. [[configura flutter]]
      1. Executa configuração FlutterFire:
```bash
# Navega para diretório Flutter
cd your_project_flutter

# Executa configuração FlutterFire
flutterfire configure --project=your-firebase-project
```
      2. Adiciona configuração de ambiente:
```dart
enum Environment {
  production,
  emulators;

  static Environment get current => 
    const String.fromEnvironment('env') == 'emulators' 
      ? Environment.emulators 
      : Environment.production;
}
```
      3. Inicializa Firebase no app:
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  if (Environment.isEmulators) {
    await connectToEmulators();
  }
  
  runApp(const MyApp());
}
```

4. [[You]] [[testa configuração]]
   1. [[testa configuração]]
      1. Executa com emuladores:
```bash
flutter run --dart-define=env=emulators
```
      2. Verifica conexão Firebase nos logs

# ✅ Verificação

1. [[You]] [[verifica instalação]]
   1. [[verifica instalação]]
      1. Firebase CLI instalado e logado
      2. FlutterFire CLI instalado
      3. Projeto criado no Console Firebase
      4. Firebase inicializado no projeto

2. [[You]] [[verifica configuração]]
   1. [[verifica configuração]]
      1. FlutterFire configurado no app Flutter
      2. Configuração de ambiente estabelecida
      3. Inicialização do Firebase funcionando
      4. App conecta aos serviços Firebase

3. [[You]] [[verifica emuladores]]
   1. [[verifica emuladores]]
      1. Configuração de emulador funcionando
      2. App conecta aos emuladores
      3. Serviços acessíveis no modo emulador
      4. Troca de ambiente funciona 
