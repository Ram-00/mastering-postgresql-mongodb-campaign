\c week2_testdb;
CREATE SCHEMA IF NOT EXISTS week2;
SET search_path TO week2, public;

-- Isolated accounts for transaction demos
CREATE TABLE IF NOT EXISTS tx5_accounts (
  tx5_account_id BIGSERIAL PRIMARY KEY,
  user_name TEXT NOT NULL UNIQUE,
  balance NUMERIC(14,2) NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS tx5_transactions_log (
  tx5_transaction_id BIGSERIAL PRIMARY KEY,
  from_account BIGINT NOT NULL REFERENCES tx5_accounts(tx5_account_id),
  to_account   BIGINT NOT NULL REFERENCES tx5_accounts(tx5_account_id),
  amount NUMERIC(14,2) NOT NULL CHECK (amount > 0),
  transacted_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Simple job queue to demonstrate SKIP LOCKED pattern
CREATE TABLE IF NOT EXISTS tx5_jobs (
  job_id BIGSERIAL PRIMARY KEY,
  job_data TEXT NOT NULL,
  locked BOOLEAN NOT NULL DEFAULT false,
  picked_at TIMESTAMPTZ
);
