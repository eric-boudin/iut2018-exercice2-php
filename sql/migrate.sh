#!/bin/bash
echo DB Username:
read USERNAME
echo DB Password:
read PASSWORD
echo DB Name:
read DB
cat migrations sql/*.sql | mysql -u$USERNAME -p$PASSWORD $DB