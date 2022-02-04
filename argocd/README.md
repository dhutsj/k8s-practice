## ArgoCD 

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes according to [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) official. It has a lot of advanced features:

* Automated deployment of applications to specified target environments
* Support for multiple config management/templating tools (Kustomize, Helm, Ksonnet, Jsonnet, plain-YAML)
* Ability to manage and deploy to multiple clusters
* etc

It also has a lot of useful sub-projects like [ApplicationSet](https://argocd-applicationset.readthedocs.io/en/stable/Getting-Started/) and [ArgoCD Notifications](https://argocd-notifications.readthedocs.io/en/stable/) to make it more flexible and strong.

### ApplicationSet 

[ApplicationSet](https://github.com/argoproj-labs/applicationset) project provides a better solution for managing applications across multiple clusters. It provides four kinds of generator to do so.

1. Install the ApplicationSet Controller

   ```shell
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/applicationset/v0.3.0/manifests/install.yaml
   ```

2. Choose the right generator for your projects. I have done some sample code for these four generators in `applicationset` folder. 
   * [List Generator](  https://argocd-applicationset.readthedocs.io/en/stable/Generators-List/)
   * [Cluster Generator]( https://argocd-applicationset.readthedocs.io/en/stable/Generators-Cluster/): In Argo CD, managed clusters [are stored within Secrets](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#clusters) in the Argo CD namespace. So use `kubectl describe secret cluster-kubernetes.default.svc-3396314289 -n argocd` to check the cluster label.
   * [Git Generator]( https://argocd-applicationset.readthedocs.io/en/stable/Generators-Git/)
   * [Matrix Generator]( https://argocd-applicationset.readthedocs.io/en/stable/Generators-Matrix/)
3. After you installed `applicationset` controller and the releted yaml file. Just run `kubectl apply -f $your_generator.yaml`. The related applications will be automatically deployed in multiple clusters.

### ArgoCD Notifications 

[Argo CD Notifications](https://argocd-notifications.readthedocs.io/en/stable/) continuously monitors Argo CD applications and provides a flexible way to notify users about important changes in the application state.

It supports multiple notification services.

1. [Email](https://argocd-notifications.readthedocs.io/en/stable/services/email/)
2. [Slack](https://argocd-notifications.readthedocs.io/en/stable/services/slack/)
3. [OpsGenie](https://argocd-notifications.readthedocs.io/en/stable/services/opsgenie/)
4. [WebHook](https://argocd-notifications.readthedocs.io/en/stable/services/webhook/)
5. etc