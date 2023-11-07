# FastFood - Infraestrutura DocumentDB com Terraform

Este projeto Terraform cria e gerencia a infraestrutura necessária para o banco de dados DocumentDB do sistema FastFood.

## Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Terraform](https://www.terraform.io/)
- [Conta na AWS](https://aws.amazon.com/)
- [AWS CLI](https://aws.amazon.com/cli/)

## Configuração

1. Clone este repositório:

   ```bash
   git clone https://seurepositorio.com/fastfood-terraform-documentdb.git
   cd fastfood-terraform-documentdb
2. Inicialize o Terraform:

   ```bash
   terraform init
   
3. Configure suas credenciais da AWS usando o AWS CLI:

   ```bash
   aws configure
   ```
   Certifique-se de que as credenciais tenham permissões adequadas para criar recursos da AWS.
   
1. Personalize o arquivo `main.tf`:

  Personalize o arquivo main.tf:
  Substitua os valores apropriados nos recursos, como o `cluster_identifier`, `master_username`, `master_password`, `vpc_id`, `subnet_ids`, etc., para corresponder à sua configuração específica.

## Uso

Para criar a infraestrutura DocumentDB, execute os seguintes comandos:

1. Visualize as alterações planejadas:

   ```bash
   terraform plan
   
2. Aplique as alterações:

   ```bash
   terraform apply

## Limpeza

Para evitar custos contínuos, é importante destruir os recursos quando não forem mais necessários. Para isso, execute:

   ```bash
   terraform destroy   
