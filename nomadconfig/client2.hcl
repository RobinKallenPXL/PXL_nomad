log_level = "DEBUG"

data_dir = "/opt/nomad/client2"
bind_addr = "192.168.1.6"
name = "client2"

client {
        enabled = true
                servers = ["192.168.1.4:4647"]
}
ports {
        http = 5657
}
plugin "docker" {
        config{
                gc {
                        dangling_containers {
                                enabled=false
                        }
                }
        }
}
