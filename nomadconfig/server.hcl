log_level = "DEBUG"

data_dir = "/opt/nomad/server"
bind_addr = "192.168.1.4"

advertise {
  # Defaults to the first private IP address.
  http = "192.168.1.4"
  rpc  = "192.168.1.4"
  serf = "192.168.1.4"
}
# enable the server
server {
    enabled = true

    #self-elect
    bootstrap_expect = 1
}
