#!/bin/bash
set -e 
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ================================================================================================
# This script is only used to deploy the live demo instance, 99.99% of people can ignore this :)
# ================================================================================================

echo "😲 Warning! You are about to deploy to the live demo environment"; 
read -n 1 -s -r -p "Press any key to continue, or ctrl+c to exit..."; 
echo

export AZURE_TENANT="9334e33a-c607-4663-92e0-cc9eb3243cbe"
export AZURE_SUB="62f51b53-9e7e-4673-8fcf-e312c82e113b"
export GITHUB_REPO=https://github.com/allangxg/chatr
export AZURE_REGION=centralus
export AZURE_PREFIX=chatrlive
export AZURE_RESGRP=chatr-live

az account show > /dev/null 2>&1 || { echo "🔐 Not logged into Azure, logging into Microsoft tenant..."; az login --tenant ${AZURE_TENANT} > /dev/null ; }

echo "⛅ Switching to Azure subscription ${AZURE_SUB}..."
az account set -s ${AZURE_SUB} -o table

"${SCRIPT_DIR}"/deploy.sh