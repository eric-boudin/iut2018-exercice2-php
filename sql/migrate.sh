#!/bin/bash
if [ -f .env ]
then
    source .env
else
    echo "Enter DB USERNAME:"
    read $DATABASE_USERNAME

    echo "Enter DB PASSWORD:"
    read $DATABASE_PASSWORD
fi
cat migrations/*.sql | mysql -u$DATABASE_USERNAME -p$DATABASE_PASSWORD