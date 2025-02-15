---
document_type: code of conduct
goal: definir processo para criar novas cloud functions para o backend Roomy
gpt_action: siga estes passos ao criar uma nova cloud function
---

# 🎯 Processo de Criação de Cloud Function

1. [[You]] [[configura estrutura da feature]]
   1. [[configura estrutura da feature]]
      1. Cria novo diretório: `functions/src/[feature-name]`
      2. Cria subdiretórios seguindo estrutura do projeto:
      ```
      [feature-name]/
      ├── abstracts/      # Classes abstratas específicas da feature
      ├── analytics/      # Analytics específicos da feature
      ├── api/           # Código de API específico da feature
      ├── constants/     # Constantes específicas da feature
      ├── dtos/          # DTOs específicos da feature
      ├── enums/         # Enums específicos da feature
      ├── exceptions/    # Exceções específicas da feature
      ├── functions/     # Functions específicas da feature
      ├── middleware/    # Middleware específico da feature
      ├── models/        # Modelos específicos da feature
      ├── requests/      # Tipos de request específicos da feature
      ├── responses/     # Respostas específicas da feature
      ├── services/      # Serviços específicos da feature
      └── util/          # Utilitários específicos da feature
      ```

2. [[You]] [[configura collection]]
   1. [[configura collection]]
      1. Atualiza `core/enums/firestoreCollectionType.ts`
      2. Adiciona novo tipo de collection ao enum
      3. Atualiza função firestoreDto
      4. Atualiza função firestorePath
      ```typescript
      enum FirestoreCollectionType {
          // tipos existentes...
          yourCollection,
      }

      function firestoreDto<T>(type: FirestoreCollectionType, data: any): T {
          switch (type) {
              // casos existentes...
              case FirestoreCollectionType.yourCollection:
                  return YourDto.fromJson(data) as T;
          }
      }

      function firestorePath(type: FirestoreCollectionType): string {
          switch (type) {
              // casos existentes...
              case FirestoreCollectionType.yourCollection:
                  return 'yourCollection';
          }
      }
      ```

3. [[You]] [[cria tipos de dados]]
   1. [[cria tipos de dados]]
      1. Cria classe DTO em `[feature-name]/dtos/your_dto.ts`
      2. Implementa métodos fromJson e toJson
      ```typescript
      export class YourDto {
          constructor(
              public field1: string,
              public field2: number,
          ) {}

          static fromJson(json: any): YourDto {
              return new YourDto(
                  json.field1,
                  json.field2,
              );
          }

          toJson(): any {
              return {
                  field1: this.field1,
                  field2: this.field2,
              };
          }
      }
      ```
      3. Cria interface de request em `[feature-name]/requests/your_request.ts`
      ```typescript
      export interface YourRequest {
          param1: string;
          param2: number;
      }
      ```

4. [[You]] [[implementa function]]
   1. [[implementa function]]
      1. Cria arquivo da function em `[feature-name]/functions/your_function.ts`
      2. Importa dependências necessárias
      3. Adiciona middleware de autenticação
      4. Implementa lógica da function
      5. Retorna CloudResponse
      ```typescript
      import {onCall} from "firebase-functions/v2/https";
      import {CloudResponse} from "../core/responses/cloudResponse";
      import {callableAuthMiddleware} from "../core/middleware/callableAuthMiddleware";
      import {YourRequest} from "./requests/your_request";

      export const yourFunction = onCall(async (request) => {
          const auth = await callableAuthMiddleware(request);
          const data = request.data as YourRequest;
          
          // Sua implementação
          
          return new CloudResponse({
              statusCode: 200,
              result: yourResult
          });
      });
      ```

5. [[You]] [[exporta function]]
   1. [[exporta function]]
      1. Atualiza `functions/src/index.ts`
      ```typescript
      export {yourFunction} from './[feature-name]';
      ```

# ✅ Lista de Verificação

1. [[You]] [[verifica implementação]]
   1. [[verifica implementação]]
      1. Confirma que estrutura de diretórios da feature está completa
      2. Verifica se tipo de collection está configurado corretamente
      3. Verifica se implementação do DTO está completa
      4. Valida definições de tipos de request
      5. Testa function com middleware de autenticação
      6. Verifica tratamento de erros usando utilitários core
      7. Confirma se formato do CloudResponse está correto
      8. Verifica se function está exportada corretamente
      9. Testa function com request de exemplo
      10. Verifica se casos de erro são tratados

# 🔧 Guia de Tratamento de Erros

1. [[You]] [[trata erros]]
   1. [[trata erros]]
      1. Importa utilitários de erro
      ```typescript
      import {throwNotFound} from "../core/util/throwNotFound";
      import {throwPermissionDenied} from "../core/util/throwPermissionDenied";
      ```
      2. Usa funções de erro apropriadas
      ```typescript
      // Not Found (404)
      throwNotFound("Recurso não encontrado");

      // Permission Denied (403)
      throwPermissionDenied("Usuário não autorizado");
      ```
      3. Retorna CloudResponse adequado
      ```typescript
      new CloudResponse({
          statusCode: 200,     // Código de status HTTP
          message?: string,    // Mensagem opcional
          result: T | null     // Dados da resposta
      });
      ``` 
