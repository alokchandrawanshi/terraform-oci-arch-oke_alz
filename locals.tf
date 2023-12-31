locals {
  availability_domains       = var.availability_domain == "" ? data.oci_identity_availability_domains.ADs.availability_domains : data.oci_identity_availability_domains.AD.availability_domains
  is_arm_node_shape          = length(regexall("A1", var.node_shape)) > 0 ? true : false
  arm_node_shape             = local.is_arm_node_shape ? "aarch64-" : ""
  k8s_version_length         = length(var.k8s_version)
  k8s_version_only           = substr(var.k8s_version,1,local.k8s_version_length)
  #node_image_regex           = "Oracle-Linux-${var.node_linux_version}-${local.arm_node_shape}[0-9]{4}.+-OKE-${local.k8s_version_without_v_char}-[0-9]+"
  node_pool_image_ids        = data.oci_containerengine_node_pool_option.oci_oke_node_pool_option.sources
}
