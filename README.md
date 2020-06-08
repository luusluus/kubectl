# Github Action for Kubernetes CLI with namespace

- This action provides `kubectl` for Github Actions.
- folked for installing `aws-iam-authenticator`
- This docker image can use `aws-iam-authenticator`
- Option to use namespace `-n` in commands.

## Usage

`.github/workflows/push.yml`

```hcl
on: push
name: deploy
jobs:
  deploy:
    name: deploy to cluster
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: deploy to cluster
      uses: rsooo/kubectl@v1.0.1
      env:
        KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}
      with:
        args: set image --record deployment/my-app container=${{ github.repository
          }}:${{ github.sha }}
    - name: verify deployment
      uses: steebchen/kubectl@master
      env:
        KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}
      with:
        args: '"rollout status deployment/my-app"'
```

## Secrets

`KUBE_CONFIG_DATA` – **required**: A base64-encoded kubeconfig file with credentials for Kubernetes to access the cluster. You can get it by running the following command:

```bash
cat $HOME/.kube/config | base64
```

**Note**: Do not use kubectl config view as this will hide the certificate-authority-data.
