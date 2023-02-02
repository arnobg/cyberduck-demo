Provision three tier architecture on AWS using Terraform :

USE CASE:

Please set up an RDS service on AWS. You can assume that the service will need to
be highly available, with sufficient performance to serve requests from a cluster of EC2
instances. Let’s say that for illustration purposes, this RDS instance will store data for a high-
profile e-commerce website. It should be MySQL compatible.

--------------------------------------

SOLUTION:

As part of the exercise, I have considered high availability and performance to be the major factors (rather than cost which is not mentioned). This will deploy the below three tier architechture on AWS , using Aurora RDS with MySQL DB engine as our database service. 

![Web App Reference Architecture](https://user-images.githubusercontent.com/78933256/216273290-5e360b4e-264d-4cc7-aab8-0a5eeda3fb27.png)


![Web App Reference Architecture_2d](https://user-images.githubusercontent.com/78933256/216273438-cb72b54f-9244-4e96-8a4b-cacb8040e80c.png)


We will need the solution to be highly available and using Aurora RDS will provide us with the best High Avaiability solution.
Also, another primary reason we have chosen to go with Aurora RDS instead of the MySQL Multi-AZ RDS option is the performance benefits which Aurora provides. Given that this will be serving an ecommerce website , performance will be a very important factor for business and Aurora RDS for MySQL provides 5x better performance compared to the MySQL RDS. 

Other features which can be considered as factors and configured easily on top of the current Aurora RDS infrastructure:

 – Read Replicas - If the application is having a high volume of read requests to the database, we can easily provision Read Replicas to segregate and improve the performance of all read requests made. 
 – Performance insights - We can use this to get a better understanding of the performance 
 - Can use Aurora Global database to span across multiple AWS regions and provide high latency to end users.
 – Scales automatically to keep up with your applications.
 – Can make six copies of your data, distributed across multiple locations and continuously backed up to Amazon S3.
– Transparently recovers from storage failures
– Best RTO / RPO 


I have designed the stack to use a frontend application load balancer which is configured to serve the auto-scaling group of EC2 instances (Can call this as the web-tier). Current configuration is set to 3 as per desired capacity ( 1 per AZ) . We can tweak the ASG values as per requirements and plan to scale up/down based on CloudWatch alarms (currently no alarms configured)
The second layer, which is the application logic layer, is also configured to use an application load balancer which is onfigured to serve the auto-scaling group of EC2 instances (Can call this as the app-tier). Current configuration is set to 3 as per desired capacity ( 1 per AZ). 

If the ecommerce website users are distributed globally , we can configure our stack to use Cloudfront service to act as the CDN solution and improve performance through caching.

We can configure the launch templates for the ASGs, to use application specific user data and customize our code further.

Instead of reinventing the wheel, the terraform code I have written, makes use of certain AWS terraform modules , such as VPC, Security Group, ALB, Auto-Scaling Groups. I have also made use of the S3 backend inorder to manage the terraform state file locking. (This is optional, I have a habit of using this in my current workplace). Currently I have commented out the backend.tf file and this can be setup if necessary (We will then need to setup the bucket and a dynamoDB table). Without it in use, we will have the terraform state file managed locally. Please choose to use .gitignore file to make sure the terraform state file is not uploaded into Github repository.

We can add more modules in the sub-folders if needed.Example

cyberduck-demo-project/
  ├── alb.tf
  ├── asg.tf
  │── rds.tf
  │── main.tf
  │── backend.tf
  │── variables.tf
  │── vpc.tf
  │── terraform.tfvars
  
  



