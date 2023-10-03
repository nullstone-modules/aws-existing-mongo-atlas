# Existing MongoDB Atlas

This module creates an Atlas PrivateLink connection to an existing MongoDB Atlas cluster.
Mongo Atlas is a managed service offering provided by the creators of MongoDB.

## When to use

Use this module when you have an existing Mongo Atlas cluster that you want to connect to from a different AWS account.
This module will establish a new Atlas PrivateLink for the connected network.
You can then connect to this datastore via a Mongo Atlas Access capability to establish a private connection.

## Security & Compliance

Security scanning is graciously provided by [Bridgecrew](https://bridgecrew.io/).
Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-existing-mongo-atlas/general)
![CIS AWS V1.3](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-existing-mongo-atlas/cis_aws_13)
![PCI-DSS V3.2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-existing-mongo-atlas/pci)
![NIST-800-53](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-existing-mongo-atlas/nist)
![ISO27001](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-existing-mongo-atlas/iso)
![SOC2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-existing-mongo-atlas/soc2)
![HIPAA](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-existing-mongo-atlas/hipaa)

## Secure Connection

This module creates a secure connection from your AWS network to the new MongoDB cluster.
As a result, the existing MongoDB cluster can only be accessed from your AWS network.

It does so with a Private Link Endpoint. See the Mongo Atlas guide on [Private Link](https://www.mongodb.com/docs/atlas/security-cluster-private-endpoint/) for more information.

In order to establish this secure connection, an AWS VPC Endpoint from your AWS account is connected to a Mongo Atlas Private Link Endpoint.
This is the recommended and most secure way to connect to your Mongo Atlas cluster. It does make this module AWS specific.

## Logs

Logs for this infrastructure can be access through Atlas.
