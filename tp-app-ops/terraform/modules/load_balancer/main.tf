resource "google_compute_global_forwarding_rule" "http" {
  name       = var.forwarding_rule_name
  target     = google_compute_target_http_proxy.http.self_link
  port_range = "80"
}

resource "google_compute_target_http_proxy" "http" {
  name    = var.proxy_name
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_url_map" "default" {
  name           = var.url_map_name
  default_service = google_compute_backend_service.default.self_link
}
