SET search_path TO week2, public;

-- 1) Transfer funds transaction with balance check and logging
-- Transfer 200.00 from arun -> sneha atomically
BEGIN;

-- Lock source row and verify sufficient balance
DO $tx$
DECLARE
  src_balance NUMERIC;
  v_from BIGINT;
  v_to   BIGINT;
BEGIN
  SELECT tx5_account_id, balance
  INTO v_from, src_balance
  FROM tx5_accounts
  WHERE user_name = 'arun'
  FOR UPDATE;

  IF src_balance < 200 THEN
    RAISE EXCEPTION 'Insufficient funds for arun. Balance: %', src_balance;
  END IF;

  SELECT tx5_account_id INTO v_to FROM tx5_accounts WHERE user_name = 'sneha' FOR UPDATE;

  UPDATE tx5_accounts SET balance = balance - 200 WHERE tx5_account_id = v_from;
  UPDATE tx5_accounts SET balance = balance + 200 WHERE tx5_account_id = v_to;

  INSERT INTO tx5_transactions_log(from_account, to_account, amount)
  VALUES (v_from, v_to, 200.00);
END;
$tx$;

COMMIT;

-- Verify balances
SELECT user_name, balance FROM tx5_accounts ORDER BY user_name;


-- 2) Demonstrate REPEATABLE READ snapshot stability (run part of this in another session)
-- Session A:
BEGIN ISOLATION LEVEL REPEATABLE READ;
  SELECT balance AS sA_read1 FROM tx5_accounts WHERE user_name = 'sneha';
  -- In Session B (separate session), try: UPDATE tx5_accounts SET balance = balance + 50 WHERE user_name = 'sneha';
  -- Back in Session A, read again; you should see the same value within the same transaction
  SELECT balance AS sA_read2 FROM tx5_accounts WHERE user_name = 'sneha';
COMMIT;


-- 3) Row-level locking with FOR UPDATE to serialize changes
BEGIN;
  SELECT tx5_account_id, user_name, balance
  FROM tx5_accounts
  WHERE user_name = 'vikram'
  FOR UPDATE;  -- holds row lock until commit

  UPDATE tx5_accounts
  SET balance = balance + 100
  WHERE user_name = 'vikram';
COMMIT;


-- 4) Deadlock simulation (requires two sessions)
-- Session 1:
-- BEGIN;
-- SELECT * FROM tx5_accounts WHERE user_name = 'arun'  FOR UPDATE;
-- In Session 2:
-- BEGIN;
-- SELECT * FROM tx5_accounts WHERE user_name = 'sneha' FOR UPDATE;
-- Back to Session 1: SELECT * FROM tx5_accounts WHERE user_name = 'sneha' FOR UPDATE;
-- Back to Session 2: SELECT * FROM tx5_accounts WHERE user_name = 'arun'  FOR UPDATE; -- one session will deadlock


-- 5) Job queue consumer with SKIP LOCKED
-- Worker picks one unlocked job without blocking others
BEGIN;
  WITH picked AS (
    SELECT job_id
    FROM tx5_jobs
    WHERE locked = false
    ORDER BY job_id
    FOR UPDATE SKIP LOCKED
    LIMIT 1
  )
  UPDATE tx5_jobs j
  SET locked = true, picked_at = now()
  FROM picked p
  WHERE j.job_id = p.job_id
  RETURNING j.job_id, j.job_data, j.locked, j.picked_at;
COMMIT;

-- After processing, mark job done (id returned from the previous step)
-- Example placeholder (replace :job_id with the actual id you got)
-- UPDATE tx5_jobs SET locked = false WHERE job_id = :job_id;


-- 6) Read your transfer history
SELECT
  l.tx5_transaction_id,
  fa.user_name AS from_user,
  ta.user_name AS to_user,
  l.amount,
  l.transacted_at
FROM tx5_transactions_log l
JOIN tx5_accounts fa ON fa.tx5_account_id = l.from_account
JOIN tx5_accounts ta ON ta.tx5_account_id = l.to_account
ORDER BY l.tx5_transaction_id DESC;
