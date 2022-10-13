output "gateway_url" {
  description = "The url of the fluxbb"
  value       = "http://${hcloud_server.fluxbb.ipv4_address}/install.php"
   }

output "ipv4_address" {
  value = hcloud_server.fluxbb.ipv4_address
}