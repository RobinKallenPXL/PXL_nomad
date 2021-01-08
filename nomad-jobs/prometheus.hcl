job "prometheus" {
    datacenters = ["dc1"]
    type = "service"

    group "prometheus" {
        count = 1
    

        network {
            port "prometheus"{
                to = 9090
                static = 9090
            }
        }

        task "prometheus" {
            driver = "docker"

            config {
                image = "prom/prometheus"
                force_pull = true
            
                ports = ["prometheus"]
                logging {
                    type = "journald"
                    config {
                        tag = "prometheus"
                    }
                }
                
                mounts = [ {
                    type = "bind"
                    target = "/etc/prometheus/"
                    source = "/vagrant/prometheusConfig/"
                    readonly = "false"
                    bind_options = {
                        propagation = "rshared"
                    }
                }
                ]
            }
        
            service {
                name = "prometheus"
                port = "prometheus"
                tags = ["prometheus"]
            }
        }
    }
}