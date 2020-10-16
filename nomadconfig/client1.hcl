log_level = "DEBUG"

data_dir = "/opt/nomad/client1"
bind_addr = "192.168.1.5"

name = "client1"


client {
        enabled = true
                servers = ["192.168.1.4:4647"]
}
ports {
        http = 5656
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
