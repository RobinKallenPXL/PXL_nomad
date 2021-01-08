job "node-exporter" {
    datacenters = ["dc1"]
    type = "system"

    group "node-exporter" {
        count = 1
        network {
            port "node-exporter"{
                to = 9100
                static = 9100
            }
        }
        task "node-exporter" {
            driver = "docker"

            config {
                image = "prom/node-exporter:latest"
                force_pull = true
                network_mode = "host"            
                logging {
                    type = "journald"
                    config {
                        tag = "node-exporter"
                    }
                }
            }
        
            service {
                name = "node-exporter"
                tags = ["metrics", "node-exporter"]
                port = "node-exporter"
            }
        }
    }
}