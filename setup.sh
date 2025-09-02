#!/usr/bin/env bash
set -e

############################
# Backend (dev, fast-restart)
############################

rebuild_backend() {
  echo "🗑️  Removendo imagem antiga (se existir)..."
  docker rmi -f "$IMAGE_NAME" 2>/dev/null || true

  echo "🔨 Buildando imagem do backend..."
  docker build -t "$IMAGE_NAME" "$BACKEND_DIR"
}

restart_backend() {
  echo "♻️  Reiniciando container do backend..."
  docker rm -f "$SERVICE_NAME" 2>/dev/null || true
  docker run -d --name "$SERVICE_NAME" \
    -p 8080:8080 \
    -v "$BACKEND_DIR":/app \
    "$IMAGE_NAME"
}

stop_backend() {
  echo "🛑 Parando container do backend..."
  docker stop "$SERVICE_NAME" 2>/dev/null || true
}

log_backend() {
  echo "📜 Logs do backend (CTRL+C para sair)..."
  docker logs -f --tail=200 "$SERVICE_NAME"
}

############################
# Database (PostgreSQL)
############################

build_db() {
  echo "🧱 Buildando imagem do DB..."
  docker build -t "$DB_IMAGE" "$DB_DIR"
}

run_db() {
  echo "🚀 Subindo container do DB..."
  docker run -d --name "$DB_CONTAINER" \
    -e POSTGRES_DB="$POSTGRES_DB" \
    -e POSTGRES_USER="$POSTGRES_USER" \
    -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
    -p "$DB_HOST_PORT":5432 \
    -v bussp_pgdata:/var/lib/postgresql/data \
    "$DB_IMAGE"
}

stop_db() {
  echo "🛑 Parando container do DB..."
  docker rm -f "$DB_CONTAINER" 2>/dev/null || true
}

rmi_db() {
  echo "🗑️  Removendo imagem do DB (se existir)..."
  docker rmi -f "$DB_IMAGE" 2>/dev/null || true
}

rebuild_db() {
  echo "🔁 Rebuild do DB (stop → rmi → build → run)..."
  stop_db
  docker volume rm bussp_pgdata >/dev/null 2>&1 || true
  rmi_db
  build_db
  run_db
}

remove_db() {
  echo "🧹 Removendo DB (stop → rmi)..."
  stop_db
  rmi_db
}

usage() {
  cat <<EOF
Uso:
  $0 backend [--rebuild|--restart|--stop|--log]
  $0 db [--rebuild|--remove]
EOF
  exit 1
}

main() {
  source env.sh

  case "$1" in
    backend)
      case "$2" in
        --rebuild)   rebuild_backend ;;
        --restart) restart_backend ;;
        --stop)    stop_backend ;;
        --log)     log_backend ;;
        *)         usage ;;
      esac
      ;;
    db)
      case "$2" in
        --rebuild) rebuild_db ;;
        --remove)  remove_db ;;
        *)         usage ;;
      esac
      ;;
    *) usage ;;
  esac
}

main "$@"
