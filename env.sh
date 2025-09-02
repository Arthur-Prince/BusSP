# .env.sh
export BACKEND_DIR="./bussp"
export SERVICE_NAME="bussp-backend-dev"
export IMAGE_NAME="bussp-backend-dev"

export DB_DIR="./db"
export DB_IMAGE="bussp-postgres"
export DB_CONTAINER="bussp-db"

# Defaults de dev (passe outros via compose/CI se quiser)
export POSTGRES_DB="${POSTGRES_DB:-bussp}"
export POSTGRES_USER="${POSTGRES_USER:-bussp}"
export POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-bussp}"
export DB_HOST_PORT=5433
