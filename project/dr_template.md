# Infrastructure

## AWS Zones

us-east-2a, us-east-2b, us-west-1a, us-west-1c

## Servers and Clusters

### Table 1.1 Summary


| Asset                     | Purpose                               | Size           | Qty                           | DR                                            |
| ------------------------- | ------------------------------------- | -------------- | ----------------------------- | --------------------------------------------- |
| Application Load Balancer | Internet-facing load balancer         | -              | 1                             | Replicated in both regions                    |
| EC2 instances             | Web servers.                          | t3.micro       | Minimum 3                     | Replicated in both regions                    |
| EKS Cluster               | Managed Kubernetes cluster.           | -              | 1 Cluster. Minimum of 2 nodes | Replicated in both regions                    |
| DB Cluster                | Amazon Aurora MySQL database cluster. | `db.t3.medium` | 1 Cluster.                    | Primary in us-east-2. Secondary in us-west-1. |


### Descriptions

The EC2 web servers have a custom ubuntu image and they are running a Flask application. We need a minimum of 3 instances at all times. The EKS cluster needs a minimum of 2 nodes, with ideally 3. There is a monitoring stack installed comprised of Prometheus and Grafana. The database cluster uses the Amazon Aurora MySQL engine. There is a primary db cluster in the us-east-2 region with 2 instances, one of them being a read replica. The secondary cluster is configured identically, but is located in the us-west-1 region.

All the infrastructure is replicated across two regions and uses multiple availability zones for maximum high availabilty.

## DR Plan

### Pre-Steps:

The infrastructure is set up using IaC with Terraform. Therefore, deploying all the required assets to another region is as simple as running Terraform in this case from another folder. We only need to modify references to reflect the other region and verify which azs are available through the following command:

```
aws ec2 describe-availability-zones
```

## Steps:

In AWS we can configure DNS failover using Route 53 so that the domain name will automatically point to the IP of the load balancer in the failover region. For the database, the secondary cluster must be properly configured to replicate data from the source, or primary, db cluster. Then, we should test the failover by temporarily deleting the primary cluster. Backups are also an important aspect of disaster recovery. We can achieve this just by adding the following parameter to our Terraform code and adjust the retention period according to our needs: 

```terraform
backup_retention_period = 5
```

