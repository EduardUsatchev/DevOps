resource "helm_release" "example" {
  name       = var.release_name
  namespace = var.env
  create_namespace = var.create_namespace
  repository = var.registry
  chart      = var.chart

  set {
    name  = "metrics.enabled"
    value = "true"
  }
}

variable "create_namespace" {default = true}
variable "chart" {
  default = "redis"
}
variable "registry" {
  default = "oci://registry-1.docker.io/bitnamicharts"
}
variable "release_name" {default = "my-release"}
variable "env" {default = "dev"}