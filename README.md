# Kali SOC in AWS (Terraform Version)

This project is a Terraform-based implementation for deploying a Security Operations Center (SOC) using Kali Linux in AWS. It provides an Infrastructure as Code (IaC) solution that allows users to easily replicate and manage a complete SOC environment using the Kali Purple suite. This implementation is inspired by the original CloudFormation-based deployment by [ZoccoCss](https://github.com/ZoccoCss/kalisoc).

Once resources have been deployed follow [Kali Purple Documentation](https://gitlab.com/kalilinux/kali-purple/documentation/-/wikis/home) to configure ElasticSearch and the other tools.

## Overview

The Kali SOC project allows you to deploy a fully functional Security Operations Center in AWS, leveraging Kali Linux tools for purple team activities. This setup is suitable for practicing security operations, threat detection, response activities, and training.

This Terraform implementation provides:

- Modularized infrastructure management using best practices for reusability and scalability.
- Equivalent components to the CloudFormation stack with added flexibility for those more familiar with Terraform as an IaC tool.
- Automation of VPC creation, subnets, routing, security groups, network interfaces, and EC2 instances.

## Modules Overview

The Terraform code is organized into modules, each of which handles a specific piece of the infrastructure:

### 1. IAM Module

This module manages IAM roles and policies for accessing the SOC components, ensuring each instance has the necessary permissions.

### 2. VPC Module

The VPC module creates the Virtual Private Cloud (VPC) in AWS that will host all the resources for the SOC. It defines the IP ranges, enables DNS support, and sets up a logically isolated network environment.

### 3. Subnets Module

The subnets module creates public, LAN, and SOC subnets:

- **Public Subnet**: For instances that need internet exposure.
- **LAN Subnet**: For internal network communication.
- **SOC Subnet**: Used for secure communication for security operations.

### 4. Internet Gateway Module

This module creates the Internet Gateway, providing internet access for instances in the public subnet.

### 5. Route Tables Module

This module configures routing for the VPC by creating route tables and associating them with subnets to control network traffic flow, including routes for the internet gateway.

### 6. Security Groups Module

The security groups module creates an open security group for the SOC instances, with rules that control inbound access for various services, including SSH, RDP, HTTP, HTTPS, and custom ports used by different components.

### 7. Network Interfaces Module

This module creates network interfaces for instances, connecting them to the appropriate subnets with specific security groups to control traffic flow. These interfaces are key for enabling secure and isolated communication between different SOC components.

### 8. EC2 Module

The EC2 module launches Kali Linux-based instances for the SOC environment:

- **Kali Purple**: Core SOC platform.
- **Kali Violet, Eminence, Heliotrope, Byzantium**: Various specialized instances, each for different testing, monitoring, or threat simulation purposes.
- Each instance is linked to its corresponding network interface, security group, and IAM profile.

## EC2 Instances Overview

| Machine Name    | Primary Purpose                          |
| --------------- | ---------------------------------------- |
| Kali-Basic      | Customization base machine               |
| Kali-Pearly     | Vulnerable machine with DVWA             |
| Kali-Heliotrope | Attack platform with desktop environment |
| Kali-Eminence   | Runs Malcolm (network monitoring)        |
| Kali-Bizantium  | OPNsense firewall                        |
| Kali-Purple     | Central Elasticsearch instance           |
| Kali-Violet     | Runs OpenCTI and other tools             |

## AMI Subscriptions

Before deploying the SOC environment, make sure to subscribe to the following Amazon Machine Images (AMIs):

- [Kali Purple AMI](https://aws.amazon.com/marketplace/pp/prodview-fznsw3f7mq7to?sr=0-1&ref_=beagle&applicationId=AWSMPContessa)
- [OPNsense AMI](https://aws.amazon.com/marketplace/pp/prodview-lu5v2tokic3py)
- [Guacamole AMI](https://aws.amazon.com/marketplace/pp/prodview-hl2sry7k37mgq?ref_=aws-mp-console-subscription-detail)

## Requirements

To deploy this Terraform setup, you need:

- An AWS account with permissions to create VPC, EC2 instances, IAM roles, and other necessary resources.
- [Terraform](https://www.terraform.io/) installed on your local machine.
- An SSH key pair for accessing the instances (configured via key_name variable). To generate a new SSH key pair, use the following command:
    ```
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/kali_purple_key
    ```
This command will create a new SSH key pair named kali_purple_key and store it in your .ssh directory.
- Adjustments to CIDR ranges, security group rules, and instance types based on your specific requirements.

## Deployment Instructions

1. Clone the repository:

   ```sh
   git clone https://github.com/tayontech/kali-soc-terraform.git
   cd kali-soc-terraform
   ```

2. Initialize Terraform to set up the necessary providers:

   ```sh
   terraform init
   ```

3. Plan the deployment to see what changes will be made:

   ```sh
   terraform plan
   ```

4. Apply the changes to create the infrastructure in AWS:

   ```sh
   terraform apply
   ```

5. Once deployment is complete, you can access the SOC instances via SSH, RDP, or other configured protocols.

## Accessing the OPNsense Firewall

To check the system log for the OPNsense EC2 password, follow these steps:

1. Go to the Amazon EC2 console ([https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/)).

2. Navigate to the "Instances" section and select your OPNsense instance.

3. Click on the "Actions" dropdown menu, then select "Monitor and troubleshoot" > "Get system log".

4. In the system log window, scroll up to find the initial passwords. You should see a section that looks like this:

   ```
   **********************************************************************************************************
   *** set initial ec2-user password to : [password]
   ***!!! remember to change this immediately
   *** openssh-key provided, set to ec2-user
   *** set initial root password to : [password]
   *** remember to change this immediately
   **********************************************************************************************************
   ```

5. Note down both the ec2-user and root passwords. The password from the system log will be used to initially log into the OPNsense firewall.

After logging in, upload the firewall configuration file to set all the rules, configurations, and passwords for the OPNsense firewall.

Important points to remember:

- It may take 5-10 minutes after the instance boots for the password message to appear in the system log.
- If the output of "Get System Log" is empty or doesn't contain the expected output, try "Get Instance Screenshot" instead.
- For security reasons, it's crucial to change these initial passwords immediately after your first login.

Remember to change the default passwords as soon as possible for security reasons. You can do this through the OPNsense web interface after your initial login.

Additionally, **disable SSH access to the root user** through the OPNsense console settings for better security.

## SSH Access After OPNsense Setup

After the OPNsense firewall has been set up with the new configuration file, follow these steps:

1. SSH into the firewall while connected to the VPN:

   ```sh
   ssh root@192.168.1.10
   ```

   Use the password `VPZaE9268J51pb#P*4ur`.

2. Once inside the firewall, SSH into the Kali Eminence instance:

   ```sh
   ssh kali@192.168.1.230
   ```

3. Navigate to the Malcolm directory and start the service:

   ```sh
   cd ~/Malcolm/scripts
   ./start
   ```

## Login Credentials

### Byzantium: Default Credentials

To log in to the Byzantium (OPNsense Firewall) after uploading the configuration file, use the following credentials:

```plaintext
Username: root
Password: VPZaE9268J51pb#P*4ur
```

### Kali Instances: Default Credentials

To log in to all EC2 instances, use the following credentials:

```plaintext
Username: kali
Password: kali2023
```

### Instance-Specific Access

- **Kali Purple**: Access Elasticsearch via the following credentials:

  ```plaintext
  Username: elastic
  Password: 9voOW_WV6AO3EifKz=uu
  ```

  Access via browser at: `https://192.168.253.105:5601`

- **Kali Violet**: Includes OpenCTI and GVM services.

  - **OpenCTI**:
    ```plaintext
    Username: admin@opencti.io
    Password: kalipurpleSOCCTI
    ```
  - **OpenCTI Portainer**:
    ```plaintext
    Username: admin
    Password: kalipurpleSOCPortainer
    ```
  - **GVM**:
    ```plaintext
    Username: admin
    Password: efa72ac9-95fe-496e-b110-e68baa757ea5
    ```

  Access via browser at:

  - `https://192.178.253.107:8080`
  - `https://192.178.253.107:9392`

- **Kali Eminence**: Malcolm monitoring tools are accessible via the following links:

  - `https://192.168.253.103/`
  - `https://192.168.253.103/dashboard`
  - `https://192.168.253.103/upload`
  - `https://192.168.253.103/netbox`
  - `https://192.168.253.103/cyberchef`
  - `https://192.168.253.103/readme`
  - `https://192.168.253.103/name-map-ui`
  - `https://192.168.253.103:488`
  - `https://192.168.253.103:9443`
  - `https://192.168.253.103:8022/files`

## Kali Byzantium Configuration

Rather than using a pre-built AMI, the Byzantium machine is set up using its configuration file. To configure it:

1. Download the configuration file: `config-byzantium.localdomain.xml`

2. Edit the file and replace all instances of `XXX.XXX.XXX.XXX` with your Byzantium EC2 instance public address.

3. Launch the default OPNsense image in the stack and upload the configuration file.

OpenVPN configuration is also included in the Byzantium setup. The default credentials for OpenVPN are:

```plaintext
Username: kaliopenvpn
Password: bizantium
```

## Notes on Security

- **SSH Access**: By default, the security group allows SSH access from anywhere (`0.0.0.0/0`). For production environments, this should be restricted to trusted IP ranges.
- **IAM Roles**: Roles are configured with specific permissions for SSM and other services. Make sure these permissions are correctly scoped to avoid overprivileged access.

## Cleanup

To destroy the infrastructure and avoid any ongoing costs, run:

```sh
terraform destroy
```

## Contributing

Contributions are welcome! If you have ideas for improvements, feel free to open a pull request or issue.

The original CloudFormation implementation by ZoccoCss is available at [ZoccoCss/kalisoc](https://github.com/ZoccoCss/kalisoc). This Terraform version aims to provide an alternative deployment option for those comfortable with Terraform.

## License

This project is open-sourced under the MIT License. See the `LICENSE` file for more details.
