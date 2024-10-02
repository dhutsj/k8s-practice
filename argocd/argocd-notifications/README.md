## ArgoCD Notification
ArgoCD notification is a sub-project of ArgoCD which continuously monitors Argo CD applications and provides a flexible way to notify users about important changes in the application state.

You can refer to the [Overview](https://argocd-notifications.readthedocs.io/en/stable/) of it. Basically, you just need to define the nitification channels(Email, Slack, Webhook, etc). [Triggers](https://argocd-notifications.readthedocs.io/en/stable/triggers/) and [Template](https://argocd-notifications.readthedocs.io/en/stable/templates/) is already built-in by ArgoCD notification.

### Email
You can refer to `email.yaml` to create the [Email](https://argocd-notifications.readthedocs.io/en/stable/services/email/) and use it in `argocd-notifications-cm`. Then you just need to annotate your app in ArgoCD to subscribe to state change by `notifications.argoproj.io/subscribe.on-sync-succeeded.163:"dhutsj@gmail.com"`.

You can refer to `patch_app.txt`.

### Slack
You can refer to https://argocd-notifications.readthedocs.io/en/stable/services/slack/ for Slack notification.
