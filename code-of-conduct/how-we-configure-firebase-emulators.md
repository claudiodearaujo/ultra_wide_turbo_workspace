---
document_type: code of conduct
goal: definir processo para configurar emuladores Firebase em estrutura mono repo
gpt_action: siga estes passos ao configurar emuladores Firebase para desenvolvimento local
---

# 🔍 Configuração Inicial

1. [[You]] [[verifica estrutura do projeto]]
   1. [[verifica estrutura do projeto]]
      1. Verifica estrutura mono repo
      2. Verifica localização do projeto Firebase
      3. Verifica localização do projeto Flutter
      4. Confirma existência do diretório scripts

2. [[You]] [[confirma requisitos]]
   1. [[confirma requisitos]]
      1. Verifica instalação do Firebase CLI
      2. Verifica instalação do Node.js
      3. Verifica instalação do Flutter SDK
      4. Confirma disponibilidade de portas

# 🛠️ Configuração

1. [[You]] [[configura estrutura do projeto]]
   1. [[configura estrutura do projeto]]
      1. Cria estrutura do projeto Firebase:
```
project_mono/
  ├── project_firebase/        # Projeto Firebase
  │   ├── firebase.json            # Configuração Firebase
  │   ├── firestore.rules          # Regras de segurança Firestore
  │   ├── storage.rules            # Regras de segurança Storage
  │   ├── functions/               # Cloud Functions
  │   └── scripts/                 # Scripts de emulador
  │       ├── run_emulators.sh
  │       └── export_emulators_firebase_data.sh
  │
  └── project_flutter/        # Projeto Flutter
      ├── lib/
      │   └── core/
      │       ├── config/
      │       │   └── emulator_config.dart
      │       └── utils/
      │           ├── app_setup.dart
      │           └── environment.dart
      └── scripts/
          └── run_emulators.sh
```

2. [[You]] [[configura firebase]]
   1. [[configura firebase]]
      1. Configura portas do emulador em `firebase.json`:
```json
{
  "functions": [
    {
      "source": "functions",
      "codebase": "default",
      "ignore": [
        "node_modules",
        ".git",
        "firebase-debug.log",
        "firebase-debug.*.log"
      ],
      "predeploy": [
        "npm --prefix \"$RESOURCE_DIR\" run lint",
        "npm --prefix \"$RESOURCE_DIR\" run build"
      ]
    }
  ],
  "firestore": {
    "rules": "firestore.rules"
  },
  "storage": {
    "rules": "storage.rules"
  },
  "emulators": {
    "auth": {
      "port": 9099
    },
    "functions": {
      "port": 5001
    },
    "firestore": {
      "port": 8080
    },
    "storage": {
      "port": 9199
    },
    "ui": {
      "enabled": true,
      "port": 4000
    }
  }
}
```

3. [[You]] [[cria scripts]]
   1. [[cria scripts]]
      1. Cria script do emulador Firebase:
```bash
#!/bin/bash

# Mata quaisquer emuladores Firebase em execução
echo "Matando quaisquer emuladores firebase em execução..."
lsof -t -i:9099 -i:5001 -i:8080 -i:9199 -i:4000 | while read -r pid; do
    if ps -p $pid -o command | grep -q "firebase"; then
        kill -9 $pid 2>/dev/null || true
    fi
done

# Navega para o diretório functions e faz uma build limpa
cd ../functions || exit
rm -rf lib/
npm run build

cd ../ || exit

if [ -d "exports/firestore_export" ] || [ -f "exports/auth_export.json" ]; then
    echo "Iniciando emuladores com importação de dados..."
    firebase emulators:start --import=exports
else
    echo "Nenhum export encontrado, iniciando emuladores limpos..."
    firebase emulators:start
fi
```
      2. Cria script de exportação de dados:
```bash
#!/bin/bash

cd ../ || exit

echo "Exportando dados do emulador..."
firebase emulators:export exports
```
      3. Cria script do emulador Flutter:
```bash
#!/bin/bash

# Navega para o diretório de scripts do firebase e executa emuladores
cd ../../project_firebase/scripts && ./run_emulators.sh
```

4. [[You]] [[implementa configuração flutter]]
   1. [[implementa configuração flutter]]
      1. Cria configuração de ambiente:
```dart
abstract class Environment {
  static String? currentVersion;

  static const String _emulators = 'emulators';
  static const String _dev = 'dev';
  static const String _prod = 'prod';

  static const argumentKey = 'env';

  static EnvironmentType get current {
    switch (const String.fromEnvironment(
      Environment.argumentKey,
      defaultValue: _prod,
    )) {
      case _emulators:
        return EnvironmentType.emulators;
      case _dev:
        return EnvironmentType.dev;
      case _prod:
      default:
        return EnvironmentType.prod;
    }
  }

  static bool get isEmulators => current == EnvironmentType.emulators;
  static bool get isDev => current == EnvironmentType.dev;
  static bool get isProd => current == EnvironmentType.prod;
}

enum EnvironmentType {
  emulators,
  dev,
  prod;
}
```
      2. Cria configuração do emulador:
```dart
class EmulatorConfig {
  static const _localhost = 'localhost';
  static const _host = '127.0.0.1';

  static const _portAuth = 9099;
  static const _portFirestore = 8080;
  static const _portFunctions = 5001;
  static const _portStorage = 9199;

  static void configureEmulators() {
    if (kDebugMode && Environment.isEmulators) {
      final host = kIsWeb ? _localhost : _host;
      log.debug('Configurando emuladores Firebase em $host');

      FirebaseAuth.instance.useAuthEmulator(host, _portAuth);
      FirebaseFirestore.instance.useFirestoreEmulator(host, _portFirestore);
      FirebaseFunctions.instance.useFunctionsEmulator(host, _portFunctions);
      FirebaseStorage.instance.useStorageEmulator(host, _portStorage);

      log.debug('Emuladores Firebase configurados com sucesso');
    }
  }
}
```

# ✅ Verificação

1. [[You]] [[verifica configuração]]
   1. [[verifica configuração]]
      1. Torna scripts executáveis:
```bash
chmod +x scripts/run_emulators.sh
cd ../../project_firebase/scripts
chmod +x run_emulators.sh
chmod +x export_emulators_firebase_data.sh
```
      2. Inicia emuladores:
```bash
cd project_mono/project_flutter/scripts
./run_emulators.sh
```
      3. Executa app Flutter:
```bash
flutter run --dart-define=env=emulators
```

2. [[You]] [[confirma funcionalidade]]
   1. [[confirma funcionalidade]]
      1. Verifica logs de inicialização do emulador
      2. Verifica UI do emulador em localhost:4000
      3. Confirma que serviços Firebase conectam aos emuladores
      4. Testa operações básicas no ambiente do emulador
      5. Verifica persistência de dados com exportação/importação
