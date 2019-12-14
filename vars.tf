# external variables 
variable "module_count" {}
variable "node_pool" {}
variable "public_url" {}
variable "password" {}
variable "persistent_disk" {}
variable "external_port" {}

#internal variables
variable "name" {
  default="jupyter"
}

variable "image" {
  default="gumlooter/dockerized-jupyter:latest"
}
  
variable "persistent_mount_path" {
  default="/home/jovyan/work"
}

variable "envs" {
  default = [
    {
      name="JUPYTER_ENABLE_LAB"
      value="yes"
    },
  ]
}

variable "command" {
  default = [
    "start-notebook.sh"
  ]
}

variable "args" {
  default = [
    "--notebook-dir=/home/jovyan/work/lab",
    "--NotebookApp.ip='0.0.0.0'",
    "--NotebookApp.token=''",
    "--NotebookApp.keyfile=/etc/certs/cert_key",
    "--NotebookApp.certfile=/etc/certs/cert"
  ]
}

variable "terraform_timeout" {
  default = "20m"
}

variable "main_port" {
  default = "8888"
}

