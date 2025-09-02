# BusSP — Projeto da disciplina de Engenharia de Software

O **BusSP** é um aplicativo que mostra a posição atual dos ônibus, trazendo uma **pegada de gamificação**: quanto mais o usuário anda de ônibus, mais pontos acumula.
Além disso, o projeto tem um viés **ecológico**, incentivando o transporte público como alternativa sustentável.

---

## 🚀 Dependência: Docker

Para executar o projeto, é necessário ter o **Docker** instalado.
Você pode instalar o Docker seguindo a documentação oficial:
👉 [Guia de instalação do Docker](https://docs.docker.com/engine/install/)

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
