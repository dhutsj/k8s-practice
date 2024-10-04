Yes, you can use Kubernetes Secrets to store the sensitive `config.toml` file and then mount it into the pod. Here's how you can do it:

### Step 1: Create the Secret
You will first need to create a Kubernetes Secret that contains the contents of `config.toml`. You can either create the secret manually or use AWS SecretManager as the source.

If you want to create the Secret manually, you can do so with the following command:

```bash
kubectl create secret generic config-toml-secret \
  --from-file=config.toml=/path/to/your/config.toml \
  -n your-namespace
```

If you're using the AWS SecretManager CSI driver, you should configure the `SecretProviderClass` to pull the `config.toml` directly from AWS.

### Step 2: Create the `SecretProviderClass`

Here’s an example of how to define a `SecretProviderClass` for AWS SecretManager:

```yaml
apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
metadata:
  name: aws-secretmanager-config
  namespace: your-namespace
spec:
  provider: aws
  parameters:
    objects: |
      - objectName: "arn:aws:secretsmanager:region:account-id:secret:config-toml-secret"
        objectAlias: "config.toml"
        objectVersion: "AWSCURRENT"
```

### Step 3: Update the Deployment to Mount the Secret

Once the `SecretProviderClass` is set, you can mount the secret in your deployment.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: your-namespace
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        volumeMounts:
        - name: config-volume
          mountPath: /etc/config/config.toml
          subPath: config.toml
      volumes:
      - name: config-volume
        csi:
          driver: secrets-store.csi.k8s.io
          readOnly: true
          volumeAttributes:
            secretProviderClass: aws-secretmanager-config
```

### Step 4: Apply the Deployment

After everything is configured, apply the deployment:

```bash
kubectl apply -f deployment.yaml
```

This setup will mount the `config.toml` file from AWS SecretManager directly into your pod using the CSI driver.
