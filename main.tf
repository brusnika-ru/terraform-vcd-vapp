# Создание vApp
resource "vcd_vapp" "vApp" {
  name = var.name
  power_on = "true"
}

# Присоединение routed сети организации к vApp
resource "vcd_vapp_org_network" "orgNettoVapp" {
  vapp_name         = vcd_vapp.vApp.name

  for_each         = var.networks
  org_network_name = each.key

  depends_on = [vcd_vapp.vApp] # TODO: Добавить зависимость от модуля сети
}
