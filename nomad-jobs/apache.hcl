job "apache" {
    datacenters = ["dc1"]
    type = "service"

    group "apache" {
        count = 1
    

        network {
            port "apache"{
                to = 80
            }
             port "metrics"{
                to = 9117
                static = 9117
            }
        }

        task "apache" {
            driver = "docker"

            config {
                image = "httpd"
                force_pull = true
            
                ports = ["apache"]
                logging {
                    type = "journald"
                    config {
                        tag = "apache"
                    }
                }
            }
        
            service {
                name = "apache"
            }
        }
        task "apache-exporter" {
            driver = "docker"

            config {
                image = "solsson/prometheus-exporter-apache"
                force_pull = true
            
                ports = ["metrics"]
                logging {
                    type = "journald"
                    config {
                        tag = "apache-exporter"
                    }
                }
                args = [
                    "--scrape_uri='http://192.168.1.5/"
                ]
            }
        
            service {
                name = "apache-exporter"
                port = "metrics"
                tags = ["metrics"]
            }
        }
    }
}