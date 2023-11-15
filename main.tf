provider "aws" {
  # access_key = var.access_key
  # secret_key = var.secret_key  
  region  = var.aws_region
}


resource "aws_lightsail_instance" "lightsail_instance" {
  name              = var.project_name                      ## Name of lightsail instance in AWS
  availability_zone = "${var.aws_region}b"                  ## AZ
  #blueprint_id      = var.lightsail_blueprints["wordpress"] ## Options for "wordpress"
  blueprint_id      = var.lightsail_blueprints               ## Options for "ubuntu"
  bundle_id         = var.bundle_id                         ## Options for instance size
  user_data         = file("setup.sh")

}


## Creates a static public IP address on Lightsail
resource "aws_lightsail_static_ip" "static_ip" {
  name = "${var.project_name}_static_ip" ## Name of static IP in AWS
}


## Attaches static IP address to Lightsail instance
resource "aws_lightsail_static_ip_attachment" "static_ip_attach" {
  static_ip_name = aws_lightsail_static_ip.static_ip.id
  instance_name  = aws_lightsail_instance.lightsail_instance.id
}

## Manage firewall port to Lightsail instance
resource "aws_lightsail_instance_public_ports" "public_ports" {
  instance_name = aws_lightsail_instance.lightsail_instance.name

  port_info {
    protocol  = "tcp"
    from_port = 20
    to_port   = 22
  }
  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }
  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
  port_info {
    protocol  = "tcp"
    from_port = 3306
    to_port   = 3306
  }
  port_info {
    protocol  = "tcp"
    from_port = 2083
    to_port   = 2083
  }
  port_info {
    protocol  = "tcp"
    from_port = 12000
    to_port   = 12100
  }
  port_info {
    protocol  = "tcp"
    from_port = 8083
    to_port   = 8083
  }
}