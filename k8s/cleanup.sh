#!/usr/bin/env bash
set -euo pipefail

# Deletes the namespace which removes all namespaced resources created in it.
kubectl delete namespace wordpress-app --ignore-not-found

# In case any resource was created in other namespaces, you can also delete manifests directly:
# kubectl delete -f k8s/ --ignore-not-found

echo "Deleted namespace 'wordpress-app' and attempted to clean up related resources."
