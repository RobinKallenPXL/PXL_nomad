log_level = "DEBUG"

data_dir = "/opt/nomad/server"

# enable the server
server {
    enabled = true

    #self-elect
    bootstrap_expect = 1
}
