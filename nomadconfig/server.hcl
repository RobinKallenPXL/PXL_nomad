log_level = "DEBUG"

data_dir = "/opt/nomad/server"
bind_addr = "192.168.1.4"

# enable the server
server {
    enabled = true

    #self-elect
    bootstrap_expect = 3
}
