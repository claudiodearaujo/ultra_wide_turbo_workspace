---
document_type: code of conduct
goal: definir processo para organização e uso de constantes e globais
gpt_action: siga estes padrões ao trabalhar com constantes e globais
---

# 🔍 Pesquisa Inicial

1. [[You]] [[verifica tipo de constante]]
   1. [[verifica tipo de constante]]
      1. Verifica se é constante global do app
      2. Verifica se é constante específica de feature
      3. Revisa escopo de uso
      4. Identifica categoria da constante

2. [[You]] [[confirma localização]]
   1. [[confirma localização]]
      1. Constantes core em `/lib/core/constants/`
      2. Constantes de feature em `/features/*/constants/`
      3. Verifica categoria do arquivo
      4. Verifica convenção de nomenclatura

# 🛠️ Implementação

1. [[You]] [[implementa constantes chave]]
   1. [[implementa constantes chave]]
      1. Use k_keys.dart para chaves string:
```dart
// Ruim
map['parentId'] = value;

// Bom
map[kKeysParentId] = value;
```

2. [[You]] [[implementa constantes de valor]]
   1. [[implementa constantes de valor]]
      1. Use k_values.dart para valores padrão:
```dart
// Ruim
final defaultDuration = 60;

// Bom
final defaultDuration = kValuesDefaultDurationInMinutes;
```

3. [[You]] [[implementa constantes de assets]]
   1. [[implementa constantes de assets]]
      1. Organiza por tipo de asset:
```dart
// k_svgs.dart
final kSvgLogo = 'assets/svgs/logo.svg';

// k_pngs.dart
final kPngBackground = 'assets/images/background.png';

// k_lottie.dart
final kLottieSuccess = 'assets/lottie/success.json';

// k_mds.dart
final kMdChangelog = 'assets/markdown/changelog.md';
```

4. [[You]] [[implementa globais]]
   1. [[implementa globais]]
      1. Implementação de globais core:
```dart
// g_strings.dart
Text(gStrings.hello);

// g_print.dart
log.debug('Info de debug');

// g_feedback.dart
gFeedback.showSnackBar(...);

// g_settings.dart
TimeFormat get gTimeFormat => SettingsService.locate.timeFormat;
DateFormat get gDateFormat => SettingsService.locate.dateFormat;
```

5. [[You]] [[organiza estrutura de arquivos]]
   1. [[organiza estrutura de arquivos]]
      1. Segue estrutura padrão:
```
lib/
├── core/
│   ├── constants/
│   │   ├── k_keys.dart      # Chaves Map/JSON
│   │   ├── k_values.dart    # Valores padrão
│   │   ├── k_sizes.dart     # Tamanhos de UI
│   │   ├── k_colors.dart    # Cores
│   │   ├── k_svgs.dart      # Assets SVG
│   │   └── k_lottie.dart    # Animações Lottie
│   └── globals/
│       ├── g_strings.dart   # Localização
│       ├── g_print.dart     # Logging
│       └── g_feedback.dart  # Feedback do usuário
└── features/
    └── feature_name/
        ├── constants/
        │   └── k_feature_specific.dart
        └── globals/
            └── g_feature_specific.dart
```

# ✅ Verificação

1. [[You]] [[verifica nomenclatura]]
   1. [[verifica nomenclatura]]
      1. Constantes usam prefixo `k`
      2. Globais usam prefixo `g`
      3. Nomes são descritivos
      4. Categorias são claras

2. [[You]] [[verifica organização]]
   1. [[verifica organização]]
      1. Arquivos nas localizações corretas
      2. Constantes adequadamente categorizadas
      3. Itens específicos de feature nas pastas de feature
      4. Itens compartilhados no core

3. [[You]] [[verifica melhores práticas]]
   1. [[verifica melhores práticas]]
      1. Nenhum valor mágico usado
      2. Constantes usadas consistentemente
      3. Documentação clara
      4. Organização de features correta 
