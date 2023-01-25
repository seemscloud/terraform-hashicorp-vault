### Cert Manager - Issuer

```bash
kubectl create secret generic vault-token-clusterissuer \
  --from-literal=token="hvs.EqbmHiyE4l1PNr8ZSgRqje98"

```

```yaml
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: vault
  namespace: vault-system
spec:
  vault:
    path: "pki-inter/sign/pki-inter"
    server: http://vault.vault-system.svc:8200
    auth:
      tokenSecretRef:
        name: vault-token-clusterissuer
        key: token
```