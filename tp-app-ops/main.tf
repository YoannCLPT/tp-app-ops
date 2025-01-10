module "vpc" {
  source           = "./terraform/modules/vpc"
  network_name     = "vpc-network"
  subnet_name      = "subnet-network"
  ip_cidr_range    = "10.0.0.0/24"
  region           = "europe-west9"
}

module "dns" {
  source           = "./terraform/modules/dns"
  zone_name        = "example-zone"
  dns_name         = "example.com."
  description      = "Zone DNS pour exemple"
  record_name      = "www.example.com."
  record_type      = "A"
  ttl              = 300
  rrdatas          = ["34.123.45.67"]
}

module "monitoring" {
  source           = "./terraform/modules/monitoring"
  dashboard_name   = "Example Dashboard"
  widgets          = [
    {
      title = "CPU Utilization"
      xyChart = {
        dataSets = [
          {
            timeSeriesQuery = {
              timeSeriesFilter = {
                filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\""
                comparison = "COMPARISON_GT"
                thresholdValue = 0
              }
            }
          }
        ]
      }
    }
  ]
}

module "load_balancer" {
  source               = "./terraform/modules/load_balancer"
  forwarding_rule_name = "http-content-rule"
  proxy_name           = "http-proxy"
  url_map_name         = "default-url-map"
}
