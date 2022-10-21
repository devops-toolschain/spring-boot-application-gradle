variable "location" {
  type    = string
  default = "UK South"
}

variable "env" {
  type = string
}

variable "tags" {
  type = map(string)
  default  = {
    project = "Publicis"
  }
}