resource "google_monitoring_dashboard" "example_dashboard" {
  dashboard_json = jsonencode({
    displayName = var.dashboard_name
    gridLayout = {
      columns = 2
      widgets = var.widgets
    }
  })
}
