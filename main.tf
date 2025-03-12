
resource "kubernetes_manifest" "pv" {
  manifest = yamldecode(file("pv.yaml"))
}

resource "kubernetes_manifest" "pvc" {
  manifest = yamldecode(file("pvc.yaml"))
}

resource "kubernetes_manifest" "redis-configmap" {
  manifest = yamldecode(file("redis-comfigmap.yaml"))
}

resource "kubernetes_manifest" "redis-deployment" {
  manifest = yamldecode(file("redis-deployment.yaml"))
}

resource "kubernetes_manifest" "server-deployment" {
  manifest = yamldecode(file("server-deployment.yaml"))
}

resource "kubernetes_manifest" "redis-service" {
  manifest = yamldecode(file("redis-service.yaml"))
}

resource "kubernetes_manifest" "server-service" {
  manifest = yamldecode(file("server-service.yaml"))
}