

variable "requiredtags" {
  type = map(string)
  default = {
    "environment"   = "dev"
    "cost-centre"   = "1111"
    "app-name"      = "data"
    "business-unit" = "digital"
    "created-By"    = "user"
  }
}



variable "appendtags" {
  type = map(string)
  default = {
    "environment"   = "dev"
    "cost-centre"   = "1111"
    "app-name"      = "data"
    "business-unit" = "digital"
    "created-By"    = "user"
  }
}
