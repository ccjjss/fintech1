# Infraestructura IaC para prueba Finaktiva
Infraestructura en AWS utilizando Terraform.

## Estructura del IaC

```bash
.
└── cluster/
|   ├── main.tf
|   ├── variables.tf
|   ├── outputs.tf
|   └── terraform.tfvars
|
└── aws-load-balancer-controller/
    ├── main.tf
    └── aws-load-balancer-controller-policy.json

# Ejecutar comandos
1) terraform init
2) terraform validate
3) terraform plan
4) terraform apply

## Sistema de Despliegue Blue/Green
Este proyecto implementa una estrategia de despliegue Blue/Green para una aplicación containerizada en Amazon EKS (Elastic Kubernetes Service), utilizando GitHub Actions como sistema de integración y despliegue continuo (CI/CD).

#Estructura de Archivos

deploy.yaml: Workflow de GitHub Actions que construye y despliega la aplicación en EKS.
docker/Dockerfile: Maniefiesto docker para construir la imagen.
docker/index.html: archivo html aprovisionado.
kubernetes/blue-deployment.yaml: Manifiesto Kubernetes para el despliegue Blue.
kubernetes/green-deployment.yaml: Manifiesto Kubernetes para el despliegue Green.

#Funcionamiento
Cada vez que se hace un push a las ramas main o staging, se ejecuta un workflow de GitHub Actions con dos jobs principales

1) Build and Push Docker Image: Clona el repositorio, configura las credenciales de AWS, Hace login en Amazon ECR, Construye la imagen Docker y etiqueta con el SHA del commit para subirlo al repositorio de ECR.

2) Despliegue Blue/Green: Si no existe, lo crea (fintech1-blue), Actualiza el servicio fintech1 para redirigir el tráfico al deployment blue, despliega green (fintech1-green) con la nueva imagen, una vez que green está listo, cambia el tráfico del servicio al deployment green y finalmente, elimina el deployment blue.

Esto garantiza que el nuevo despliegue se haga sin tiempos de inactividad, permitiendo revertir rápidamente en caso de errores.



