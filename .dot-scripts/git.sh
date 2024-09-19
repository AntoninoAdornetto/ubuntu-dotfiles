#!/bin/bash

echo "Set git global settings"
echo ""

echo "Enter git username:"
read user_name
git config --global user.name user_name

echo "Enter git email:"
read email
git config --global user.email email

git config --global init.defaultBranch master
