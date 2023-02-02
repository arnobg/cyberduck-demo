
/*
Here, we are using S3 as backend to store the state as a given key in a given bucket on Amazon S3. 
This backend also supports state locking via Dynamo DB, 
which can be enabled by setting the dynamodb_table field to an existing DynamoDB table name. 
A single DynamoDB table can be used to lock multiple remote state files. 
Terraform generates key names that include the values of the bucket and key variables.
*/

/*
terraform {
  backend "s3" {
    bucket         = "arnob-ghosh-terraform-backend"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "arnob-ghosh-terraform-backend-dynamodb"
  }
}

*/

