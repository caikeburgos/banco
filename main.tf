# Criacao da Subnet Group (Se ela ja for criada, ela dar um erro)
resource "aws_docdb_subnet_group" "default" {
  name       = "aws_documentdb_subnets_group"
  subnet_ids = ["subnet-07b35b7675d09751a"]
}

# Criacao do Security Group com suas regras!
resource "aws_security_group" "this" {
  name        = "security_group_documentdb_fastfood" # Nome do grupo de segurança
  description = "Allow inbound traffic"

  vpc_id = "vpc-0e318cc5c6fca5a51" # ID da sua VPC

  # Inobound / Entrada
  ingress {
    from_port   = 27017 # Porta do DocumentDB
    to_port     = 27017 # Porta do DocumentDB
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound / Saida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Cria o cluster do DocumentDB
resource "aws_docdb_cluster" "document_db" {
  cluster_identifier     = "fastfood-docdb2-cluster"
  engine                 = "docdb"
  master_username        = var.db_username
  master_password        = var.db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = "aws_documentdb_subnets_group"
  vpc_security_group_ids = ["sg-0d1082460cf73ab1a"]
}

# Cria a instancia do DocumentDB
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "fastfood-db2-instance-${count.index}"
  cluster_identifier = aws_docdb_cluster.document_db.id
  instance_class     = "db.t3.medium"
}
