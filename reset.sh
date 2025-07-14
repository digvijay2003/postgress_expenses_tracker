#!/bin/bash

DB_USER="digvijay"
DB_NAME="expensetracker"

echo "🔥 Dropping and recreating database $DB_NAME..."

sudo -u postgres dropdb $DB_NAME
sudo -u postgres createdb -O $DB_USER $DB_NAME

echo "🚀 Running setup.sh..."
./setup.sh