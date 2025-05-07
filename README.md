# SNS and SQS Terraform Project

This project contains a complete Terraform configuration for setting up a distributed messaging architecture using **Amazon SNS** and **Amazon SQS**. This setup is ideal for microservices or serverless applications that need to communicate asynchronously, ensuring scalability, reliability, and decoupled communication.

##  Project Structure

```
.
├── main.tf          # Main Terraform configuration
├── .gitignore       # Files to ignore in the repository
├── README.md        # Project documentation (this file)
└── outputs.tf       # Output resources for easy reference
```

## Features

- **SNS Topic** for broadcasting messages to multiple services.
- **SQS Queues** for reliable message delivery.
- **IAM Role** to allow SNS to send messages to SQS queues securely.
- **Subscriptions** to connect SNS to SQS queues.

##  Prerequisites

Ensure you have the following installed:
- Terraform (v1.0+)
- AWS CLI configured with the correct IAM permissions

##  Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Copubah/sns-sqs-terraform
   cd sns-sqs-terraform
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Plan the Infrastructure:**
   ```bash
   terraform plan
   ```

4. **Apply the Configuration:**
   ```bash
   terraform apply
   ```

5. **Verify the Deployment:**
   Use the output values to verify that the resources were created successfully.

## Resources Created

- **SNS Topic:** Order notifications topic for broadcasting messages.
- **SQS Queues:**
  - Inventory Queue
  - Shipping Queue
  - Analytics Queue
- **IAM Role:** SNS to SQS permissions for secure message delivery.

##  Outputs

- SNS Topic ARN
- SQS Queue URLs (Inventory, Shipping, Analytics)

##  Next Steps

- Add **Dead-Letter Queues (DLQs)** for better error handling.
- Implement **Message Filtering** for more precise message routing.
- Integrate with **Lambda** for serverless processing.
- Use **Terraform Cloud** or **S3 Backend** for remote state management.

## 🤝 Contributing
Feel free to fork the repository and submit pull requests for improvements or additional features.

## 📝 License
This project is licensed under the MIT License 