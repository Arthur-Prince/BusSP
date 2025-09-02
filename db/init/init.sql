-- Cria a tabela "test_data"
CREATE TABLE IF NOT EXISTS test_data (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Insere um registro inicial
INSERT INTO test_data (name) VALUES ('test');
