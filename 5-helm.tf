resource "helm_release" "argocd" {
  name = "argocd"
  namespace = "argocd"
  create_namespace = true
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "6.10.0"

  values = [
    "${file("argocd/values.yaml")}"
  ]
}