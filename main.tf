resource "helm_release" "karpenter_crd" {
  chart      = "karpenter-crd"
  name       = "karpenter-crd"
  repository = "oci://public.ecr.aws/karpenter"
  version    = "1.0.6"
  namespace  = "karpenter"
}

resource "helm_release" "karpenter" {
  depends_on = [
    helm_release.karpenter_crd
  ]

  chart      = "karpenter"
  name       = "karpenter"
  repository = "oci://public.ecr.aws/karpenter"
  version    = "1.0.6"
  namespace  = "karpenter"
  skip_crds  = true
  wait       = true
}
