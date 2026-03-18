# Deploying Highly Available Infrastructure on AWS

This project demonstrates the design and deployment of a **highly available, multi-region infrastructure** on AWS, along with **observability and reliability metrics** using Prometheus and Grafana.

The goal was to build a system capable of **handling failures, maintaining availability, and providing measurable SLO/SLI insights**.

## Overview

Implemented a resilient architecture across multiple AWS regions using:

- Terraform (Infrastructure as Code)
- Amazon EKS (Kubernetes)
- EC2 and Application Load Balancer
- Amazon RDS (multi-region replication)
- Prometheus and Grafana (monitoring)

## Key Features

### Infrastructure as Code
Provisioned multi-zone infrastructure using Terraform, ensuring consistency and reproducibility.

### High Availability & Disaster Recovery
Deployed infrastructure across multiple regions with failover capabilities and replicated database clusters.

### Observability & SLO/SLI Tracking
Configured Prometheus and Grafana to monitor:
- Availability  
- Error budget  
- Throughput  
- Latency  

### Load Testing & Validation
Generated application traffic using Postman to validate system performance and monitoring accuracy.

## Outcome

- Built a **fault-tolerant, multi-region architecture**  
- Implemented **SLO/SLI-based monitoring dashboards**  
- Enabled **disaster recovery and failover readiness**  
- Demonstrated **real-world SRE and infrastructure design principles**
