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

3. Certifique-se de usar uma senha forte para `DB_PASS`.

### Executando o Projeto

Após configurar o `.env`, inicie os serviços com o Docker Compose:
```bash
docker-compose up -d
```
