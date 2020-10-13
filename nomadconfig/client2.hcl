log_level = "DEBUG"

data_dir = "/opt/nomad/client2"

name = "client2"
client {
        enabled = true
                servers = ["server:4647"]
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
