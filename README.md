# BusSP — Projeto da disciplina de Engenharia de Software

Projeto desenvolvido para a disciplina de **Engenharia de Software**.
Este repositório contém a configuração para rodar o **banco de dados (PostgreSQL)** e o **backend (Spring)** em containers Docker, utilizando o script `setup.sh`.

---

## Como rodar o **Banco de Dados (PostgreSQL)**

### 1. Build e execução (recria o volume e aplica os scripts de `db/init/`)

```bash
./setup.sh db --rebuild
```

Isso irá:

* Parar e remover o container existente (se houver).
* Remover o volume de dados (`bussp_pgdata`).
* Buildar a imagem do Postgres usando `db/Dockerfile`.
* Subir um novo container, aplicando os scripts de inicialização em `db/init/`.

O banco ficará disponível em:

* **Host:** `localhost`
* **Porta:** `5433`
* **Database:** `bussp`
* **Usuário:** `bussp`
* **Senha:** `bussp`

### 2. Remover completamente (container, volume e imagem)

```bash
./setup.sh db --remove
```

---

## Como rodar o **Backend (Spring)**

### 1. Build da imagem

```bash
./setup.sh backend --rebuild
```

### 2. Subir ou reiniciar o container

```bash
./setup.sh backend --restart
```

Isso vai:

* Subir um novo container mapeando `8080:8080` e montando o código local para **hot reload**.

### 3. Ver logs do backend

```bash
./setup.sh backend --log
```

### 4. Parar o backend

```bash
./setup.sh backend --stop
```

