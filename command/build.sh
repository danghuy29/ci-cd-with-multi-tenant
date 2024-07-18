#!/bin/bash

CLIENT=$1
ENV=$2

if [ -z "$CLIENT" ]; then
  echo "No client specified. Usage: pnpm run build client1 dev"
  exit 1
fi

if [ -z "$ENV" ]; then
  echo "No environment specified. Usage: pnpm run build client1 dev"
  exit 1
fi

echo "Building for client: $CLIENT"
echo "Environment: $ENV"

tsc

cross-env ENV=$CLIENT.$ENV CLIENT=$CLIENT vite build

echo "Build completed for client: $CLIENT"
