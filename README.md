# Mapa Cultural

## Configuração do Ambiente

Antes de iniciar o projeto, configure o arquivo `.env` com as variáveis de ambiente necessárias. Um exemplo de configuração pode ser encontrado no arquivo `.env_sample`.

### Passos para Configuração

1. Copie o arquivo `.env_sample` para `.env`:
   ```bash
   cp .env_sample .env
   ```

2. Edite o arquivo `.env` para ajustar as variáveis conforme necessário:
   - `DB_HOST`: Host do banco de dados.
   - `DB_NAME`: Nome do banco de dados.
   - `DB_USER`: Usuário do banco de dados.
   - `DB_PASS`: Senha do banco de dados.
   - `DB_VERSION`: Versão do PostgreSQL.
   - `REDIS_CACHE`: Host do Redis.
   - `SESSIONS_SAVE_PATH`: Caminho para salvar sessões no Redis.
   - `BUILD_ASSETS`: Define se os assets devem ser construídos (0 ou 1).
   - `APP_MODE`: Modo de execução da aplicação (ex.: production).
   - `LOG_LEVEL`: Nível de log (ex.: DEBUG).
   - `LOG_ENABLED`: Habilitar ou desabilitar logs (true ou false).
   - `MAILER_TRANSPORT`: Configuração do transporte de e-mail.
   - `MAILER_FROM`: Endereço de e-mail do remetente.
   - `MAILER_ALWAYSTO`: Endereço de e-mail para sempre enviar cópias.
   - `GOOGLE_RECAPTCHA_SITEKEY`: Chave do site para Google Recaptcha.
   - `GOOGLE_RECAPTCHA_SECRET`: Chave secreta para Google Recaptcha.
   - `CACHE_NAMESPACE`: Namespace para cache.
   - `CACHE_AUTOLOAD`: Tempo de autoload do cache.
   - `CACHE_ASSETS_URL`: Tempo de cache para URLs de assets.
   - `CACHE_FILE_URL`: Tempo de cache para URLs de arquivos.
   - `CACHE_EVENTS`: Tempo de cache para eventos.
   - `CACHE_SUBSITE_ID`: Tempo de cache para IDs de subsites.
   - `CACHE_PERMISSIONS`: Tempo de cache para permissões.
   - `CACHE_REGISTER`: Tempo de cache para registros.
   - `CACHE_API`: Tempo de cache para a API.
   - `CACHE_QUOTAS`: Tempo de cache para cotas.
   - `CACHE_OPPORTUNITY_SUMARY`: Resumo de oportunidades no cache.
   - `CACHE_API_NOTIFICATION`: Tempo de cache para notificações da API.
   - `PENDING_PCACHE_RECREATION_INTERVAL`: Intervalo para recriação de cache pendente.
   - `JOBS_INTERVAL`: Intervalo para execução de tarefas.
   - `NUM_PROCESSES`: Número de processos.
   - `MC_UPDATES_PROCESSES`: Número de processos para atualizações.
   - `LOGO_IMAGE`: Caminho para o logo da aplicação.
   - `LOGO_HIDELABEL`: Define se o rótulo do logo será ocultado.
   - `SMTP_LOGIN`: Login para o servidor SMTP.
   - `SMTP_PASSWORD`: Senha para o servidor SMTP.
   - `SMTP_HOST`: Host do servidor SMTP.
   - `SMTP_PORT`: Porta do servidor SMTP.
   - `AUTH_SALT`: Salt para autenticação.
   - `AUTH_GOOGLE_CLIENT_ID`: ID do cliente Google para autenticação.
   - `AUTH_GOOGLE_CLIENT_SECRET`: Chave secreta do cliente Google para autenticação.

3. Certifique-se de usar valores seguros para as variáveis sensíveis, como `DB_PASS`, `SMTP_PASSWORD` e `AUTH_SALT`.

### Executando o Projeto

Após configurar o `.env`, inicie os serviços com o Docker Compose:
```bash
docker-compose up -d
```
