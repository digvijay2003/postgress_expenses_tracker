#!/bin/bash

# ─────────────────────────────────────────────────────────────
# 💾 PostgreSQL Expense Tracker - Auto Setup Script
# Author: Digvijay (2025)
# Run this script from the project root directory.
# Usage: bash setup.sh
# ─────────────────────────────────────────────────────────────

# Customize these:
DB_USER="digvijay"        # ← change to your actual PostgreSQL username
DB_NAME="expensetracker"        # ← change to your target database

echo "🚀 Starting PostgreSQL Expense Tracker Setup..."

# Check if schema/init.sql exists
if [ ! -f "schema/init.sql" ]; then
  echo "❌ Error: schema/init.sql not found!"
  exit 1
fi

# Run the init.sql master script
psql -U "$DB_USER" -d "$DB_NAME" -W -f schema/init.sql

if [ $? -eq 0 ]; then
  echo "✅ Database setup complete!"
else
  echo "❌ Error during setup. Please check logs."
fi