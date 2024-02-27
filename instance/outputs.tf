output "vps_ip_address" {
  value = vultr_instance.my_vps.main_ip
  description = "The IP address of the VPS instance"
}
