#creating the lightsail instance
			resource "aws_lightsail_instance" "lightsail_instance" {
			  name          = "Centos_devops"
			  availability_zone = "us-east-1a"
			  blueprint_id  = "centos_7_2009_01"
			  bundle_id     = "nano_1_0"
			  #Key_pair_name = "centos-key" #Key must already exist in AWS or else it wont work.
			  tags = {
				name = "utrains devops"
				env  = "dev"
                work = "project 3"
			  }
            }
            user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "web-server"  # Replace with your desired tag
  }