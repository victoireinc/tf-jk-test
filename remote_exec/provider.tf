variable "path" {default = "/home/terraform/terraform/credentials"}

provider "google" {
    project = "yan-one"
    region = "europe-west2-a"
    credentials = "${file("${var.path}/Yan-One-6a96d3209b88.json")}"
}

