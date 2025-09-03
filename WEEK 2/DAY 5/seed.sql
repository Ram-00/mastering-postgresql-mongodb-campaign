SET search_path TO week2, public;

INSERT INTO tx5_accounts (user_name, balance) VALUES
('arun',   10000.00),
('sneha',   3500.00),
('vikram',  1200.00)
ON CONFLICT (user_name) DO NOTHING;

-- Seed some jobs
INSERT INTO tx5_jobs (job_data) VALUES
('Send welcome email to arun'),
('Recompute loyalty points for sneha'),
('Generate monthly statement for vikram')
ON CONFLICT DO NOTHING;
