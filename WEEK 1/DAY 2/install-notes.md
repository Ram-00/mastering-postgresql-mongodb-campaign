# Installation Notes & Troubleshooting

## My Setup (Specify OS: e.g., macOS)
1. Installed via Homebrew: `brew install postgresql`.
2. Started server: `brew services start postgresql`.
3. Verified: `psql --version` → PostgreSQL 16.0.

## Troubleshooting
- Issue: "psql: command not found" → Solution: Add to PATH (e.g., `export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"`).
- pgAdmin: Downloaded from [pgAdmin Site](https://www.pgadmin.org/download/); connected to localhost:5432.

**Success Output:** Server running, psql connects without errors.