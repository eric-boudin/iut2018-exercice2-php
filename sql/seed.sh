#!/bin/bash
if [ -f .env ]
then
    source .env
else
    echo "Enter DB USERNAME:"
    read $DATABASE_USERNAME

    echo "Enter DB PASSWORD:"
    read $DATABASE_PASSWORD

    echo "Enter DB NAME:"
    read $DATABASE_PASSWORD
fi
cat seeds/*.sql | mysql -u$DATABASE_USERNAME -p$DATABASE_PASSWORD $DATABASE_NAME