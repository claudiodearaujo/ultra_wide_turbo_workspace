---
document_type: protocol
goal: definir estrutura para criação e implementação de formulários
gpt_action: siga este template ao criar novos formulários
---

# Estrutura do Formulário

1. GIVEN [[Form]] PRECISA de criação
   1. THEN [[You]] CRIA enum para campos do formulário
   2. AND [[You]] ESTENDE FormConfig

2. WHEN [[You]] IMPLEMENTA formulário
   1. THEN [[You]] ADICIONA construtor privado
   2. AND [[You]] ADICIONA registro GetIt
   ```dart
   class ExampleForm extends FormConfig {
     ExampleForm._();
     
     static ExampleForm get locate => GetIt.I.get();
     static void registerFactory() => GetIt.I.registerFactory(ExampleForm._);
   }
   ```

3. WHEN [[You]] ADICIONA campos do formulário
   1. THEN [[You]] DECLARA late final formFieldConfigs
   2. AND [[You]] ADICIONA configurações dos campos
   ```dart
   @override
   late final Map<Enum, FormFieldConfig> formFieldConfigs = {
     _ExampleFormField.name: FormFieldConfig<String>(
       id: _ExampleFormField.name,
       formFieldType: FormFieldType.text,
       initialValue: _initialDto?.name,
       valueValidator: kValueValidatorsRequired(),
     ),
   };
   ```

4. WHEN [[You]] PRECISA de inicialização
   1. THEN [[You]] ADICIONA late final campo DTO
   2. AND [[You]] CRIA método initialize
   ```dart
   late final ExampleDto? _initialDto;
   
   void initialise({required ExampleDto? dto}) {
     _initialDto = dto;
   }
   ```

5. WHEN [[You]] EXPÕE campos
   1. THEN [[You]] CRIA getters para cada campo
   ```dart
   FormFieldConfig<String> get name => 
       formFieldConfig(_ExampleFormField.name);
   ```

6. WHEN [[You]] PRECISA de atualizações de campo
   1. THEN [[You]] ADICIONA métodos de atualização
   ```dart
   void updateName(String? value) => name.value = value;
   ```

# Uso do Formulário no ViewModel

1. WHEN [[You]] USA formulário no ViewModel
   1. THEN [[You]] ADICIONA dependência do formulário
   ```dart
   late final _form = ExampleForm.locate;
   ```
   2. AND [[You]] INICIALIZA no método initialise
   ```dart
   @override
   Future<void> initialise() async {
     final dto = await _service.tryFindById(args.id);
     _form.initialise(dto: dto);
     super.initialise();
   }
   ```
   3. AND [[You]] FAZ dispose do formulário
   ```dart
   @override
   void dispose() {
     _form.dispose();
     super.dispose();
   }
   ```

# Tipos de Campos de Formulário

1. GIVEN [[FormFieldType]] OPÇÕES
   1. THEN [[text]] É para entrada de texto
   2. AND [[counter]] É para entrada numérica
   3. AND [[dropDown]] É para seleção de enum
   4. AND [[toggle]] É para valores booleanos

# Validação de Formulário

1. WHEN [[You]] PRECISA de validação
   1. THEN [[You]] USA kValueValidators
   2. OR [[You]] COMBINA com kValueValidatorsMultiple
   ```dart
   valueValidator: kValueValidatorsMultiple([
     kValueValidatorsRequired(),
     kValueValidatorsMinLength(minLength: 1),
     kValueValidatorsMaxLength(maxLength: 50),
   ])
   ```

# Exemplo Completo

1. GIVEN [[CleaningTask]] PRECISA de formulário
   1. THEN [[You]] CRIA enum de campos do formulário
   ```dart
   enum _ManageCleaningTaskFormField {
     name,
     description,
     frequency,
     timespan,
   }
   ```

2. WHEN [[You]] IMPLEMENTA classe do formulário
   ```dart
   class ManageCleaningTaskForm extends FormConfig {
     ManageCleaningTaskForm._();

     static ManageCleaningTaskForm get locate => GetIt.I.get();
     static void registerFactory() => GetIt.I.registerFactory(ManageCleaningTaskForm._);

     late final CleaningTaskDto? _initialCleaningTaskDto;

     void initialise({required CleaningTaskDto? cleaningTaskDto}) {
       _initialCleaningTaskDto = cleaningTaskDto;
     }

     @override
     late final Map<Enum, FormFieldConfig> formFieldConfigs = {
       _ManageCleaningTaskFormField.name: FormFieldConfig<String>(
         id: _ManageCleaningTaskFormField.name,
         formFieldType: FormFieldType.text,
         initialValue: _initialCleaningTaskDto?.name,
         valueValidator: kValueValidatorsMultiple([
           kValueValidatorsRequired(
             errorText: () => 'Este campo é obrigatório',
           ),
           kValueValidatorsMinLength(
             minLength: 1,
             errorText: () => 'Nome deve ter pelo menos 1 caractere.',
           ),
           kValueValidatorsMaxLength(
             maxLength: 50,
             errorText: () => 'Nome pode ter no máximo 50 caracteres.',
           ),
         ]),
       ),
       _ManageCleaningTaskFormField.description: FormFieldConfig<String>(
         id: _ManageCleaningTaskFormField.description,
         formFieldType: FormFieldType.text,
         initialValue: _initialCleaningTaskDto?.description,
         valueValidator: kValueValidatorsMaxLength(
           maxLength: 200,
           errorText: () => 'Descrição pode ter no máximo 200 caracteres.',
         ),
       ),
       _ManageCleaningTaskFormField.frequency: FormFieldConfig<String>(
         id: _ManageCleaningTaskFormField.frequency,
         formFieldType: FormFieldType.counter,
         initialValue: _initialCleaningTaskDto?.frequency?.toString(),
         valueValidator: kValueValidatorsMultiple([
           kValueValidatorsRequired(
             errorText: () => 'Este campo é obrigatório',
           ),
           kValueValidatorsIsValidNumber(
             errorText: () => 'Por favor, insira um número válido.',
           ),
         ]),
       ),
       _ManageCleaningTaskFormField.timespan: FormFieldConfig<CleaningScheduleTimeSpan>(
         id: _ManageCleaningTaskFormField.timespan,
         formFieldType: FormFieldType.dropDown,
         initialValue: _initialCleaningTaskDto?.cleaningScheduleTimeSpan ?? CleaningScheduleTimeSpan.week,
         valueValidator: kValueValidatorsRequired(
           errorText: () => 'Este campo é obrigatório',
         ),
       ),
     };

     FormFieldConfig<String> get name => formFieldConfig(_ManageCleaningTaskFormField.name);
     FormFieldConfig<String> get description => formFieldConfig(_ManageCleaningTaskFormField.description);
     FormFieldConfig<String> get frequency => formFieldConfig(_ManageCleaningTaskFormField.frequency);
     FormFieldConfig<CleaningScheduleTimeSpan> get timespan => formFieldConfig(_ManageCleaningTaskFormField.timespan);

     void updateName(String? value) => name.value = value;
     void updateDescription(String? value) => description.value = value;
     void updateFrequency(String? value) => frequency.value = value;
     void updateTimespan(CleaningScheduleTimeSpan? value) => timespan.value = value;
   }
   ```

3. WHEN [[You]] USA formulário no ViewModel
   ```dart
   class ManageCleaningTaskViewModel extends BaseViewModel<OriginArguments<ManageCleaningTaskOrigin, ManageCleaningTaskArguments>> {
     final _cleaningTasksService = CleaningTasksService.locate;
     late final _form = ManageCleaningTaskForm.locate;

     @override
     Future<void> initialise() async {
       final cleaningTask = await _cleaningTasksService.tryFindById(args.id);
       _form.initialise(cleaningTaskDto: cleaningTask);
       super.initialise();
     }

     @override
     void dispose() {
       _form.dispose();
       super.dispose();
     }

     ManageCleaningTaskForm get form => _form;
   }
   ``` 