# Anna Leonova 4CS-32

# Hometask8

**Topic:** Apache2 HTTPS configuration on AWS EC2 + self-signed TLS certificate

Objective

* Create a new EC2 instance using **Ubuntu 22.04** (`ami-053b0d53c279acc90`)
* Install and configure Apache2 using user-data
* Allow inbound ports 80 and 443 in the Security Group
* Configure HTTPS with a self-signed TLS certificate
* Generate the certificate using openssl with a custom config file
* Restart Apache and verify that HTTPS is working

Steps to Run

**Step 1 — Launch the EC2 Instance**

1. Open your AWS Management Console or use **AWS CLI**.
2. Launch a new **EC2 instance** with:

   * Image: `Ubuntu Server 22.04`
   * Instance type: `t3.micro`
   * Security Group: open inbound 80 and 443
   * Key pair: your existing key (`.pem` file)
   * **User data**: upload or paste your prepared setup script

Wait until the instance is in the **running** state.

**Step 2 — Verify Server Installation**

```bash
http://EC2_IP
```

**Step 3 — Check HTTPS**

```bash
https://EC2_IP
```
