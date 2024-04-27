resource "helm_release" "argo" {
  name       = "argo"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.4"
}