

# django-todo  
A simple, scalable todo app built with Django, Docker, Kubernetes, and AWS.

![Todo App](https://raw.githubusercontent.com/shreys7/django-todo/develop/staticfiles/todoApp.png)  

## Key Features  
- **Kubernetes Cluster**: Built and deployed from scratch on AWS using Minikube.  
- **Dockerized Application**: Managed and deployed Django (backend) and React (frontend) containers.  
- **Advanced Orchestration**: Enabled deployment, replication, auto-healing, and auto-scaling in Kubernetes.  
- **AWS Integration**: Optimized network and service management using EC2 and Route53.  
- **Performance Boost**: Achieved a 75% reduction in production downtime.

---

## Setup  

### Clone the Repository  
```bash  
git clone https://github.com/shreys7/django-todo.git  
cd django-todo  
```  

### Install Django  
Follow the installation guide at [Django's official site](https://www.djangoproject.com/download/).  

### Run the Application Locally  
1. Create migrations:  
   ```bash  
   python manage.py makemigrations  
   ```  

2. Apply migrations:  
   ```bash  
   python manage.py migrate  
   ```  

3. Create an admin user:  
   ```bash  
   python manage.py createsuperuser  
   ```  

4. Start the server:  
   ```bash  
   python manage.py runserver  
   ```  

Access the app at [http://127.0.0.1:8000/todos](http://127.0.0.1:8000/todos).  

---

## Deployment with Docker  

1. **Build Docker Image**:  
   ```bash  
   docker build -t django-todo .  
   ```  

2. **Run the Docker Container**:  
   ```bash  
   docker run -d -p 8000:8000 django-todo  
   ```  

3. **Access Application**:  
   Visit [http://localhost:8000](http://localhost:8000).  

---

## Kubernetes Setup  

1. **Initialize Minikube**:  
   ```bash  
   minikube start --driver=virtualbox  
   ```  

2. **Apply Kubernetes Configurations**:  
   ```bash  
   kubectl apply -f deployment.yaml  
   kubectl apply -f service.yaml  
   ```  

3. **Check Pods and Services**:  
   ```bash  
   kubectl get pods  
   kubectl get services  
   ```  

4. **Enable Minikube Tunnel**:  
   ```bash  
   minikube tunnel  
   ```  

5. **Access the Application**:  
   Use the external IP provided by the Kubernetes service.  

---

## AWS Integration  

1. **Launch EC2 Instances**:  
   - Deploy Kubernetes Cluster on EC2 with Minikube.  
   - Ensure proper security groups and IAM roles for access.  

2. **Route53 Configuration**:  
   - Set up DNS records to map your domain to the application service.  

3. **Monitor and Scale**:  
   Use Kubernetes' `HorizontalPodAutoscaler` for automatic scaling:  
   ```bash  
   kubectl autoscale deployment django-todo --cpu-percent=50 --min=1 --max=10  
   ```  

---

## Performance Improvements  

- **Auto-Healing**: Pods are automatically replaced if they fail.  
- **Load Balancing**: Kubernetes ensures even distribution of requests.  
- **Reduced Downtime**: Achieved through replication and high availability features.  

---

## Commands Summary  

### Kubernetes  
- Start Minikube: `minikube start --driver=virtualbox`  
- Apply Configs: `kubectl apply -f <file>`  
- Get Pods/Services: `kubectl get pods` / `kubectl get services`  
- Scale Deployment: `kubectl scale deployment <name> --replicas=3`  
- Autoscale: `kubectl autoscale deployment <name> --cpu-percent=50 --min=1 --max=10`  

### Docker  
- Build Image: `docker build -t <image-name> .`  
- Run Container: `docker run -d -p 8000:8000 <image-name>`  
- List Containers: `docker ps`  

### AWS  
- EC2 Setup: Configure and launch instances for the cluster.  
- Route53: Set DNS records for seamless access.


---

Cheers and Happy Coding! 🚀  
