pipeline {
    agent any
 
    parameters {
        string(name: 'IMAGE_TAG', defaultValue: 'latest', description: 'Docker image tag')
        string(name: 'CONTAINER_NAME', defaultValue: 'cap-lost-found-container', description: 'Name of the Docker container')
        string(name: 'HOST_PORT', defaultValue: '3001', description: 'Host port to map to container port 3000')
    }
 
    environment {
        DOCKER_IMAGE = "lostfound:${IMAGE_TAG}"
        DOCKER_HUB_REPO = "harinireddy765/lostfound"
        ECR_REPO = "636768524979.dkr.ecr.ap-south-1.amazonaws.com/lost-found"
    }
 
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/sriharinireddydakuri/Capstone-Project.git'
            }
        }
 
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }
 
        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker_Credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
 
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker tag ${DOCKER_IMAGE} ${DOCKER_HUB_REPO}:${IMAGE_TAG}"
                    sh "docker push ${DOCKER_HUB_REPO}:${IMAGE_TAG}"
                }
            }
        }
 
        stage('Login to AWS ECR') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Credentials']]) {
                    script {
                        sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 636768524979.dkr.ecr.ap-south-1.amazonaws.com'
                    }
                }
            }
        }
 
        stage('Push to AWS ECR') {
            steps {
                script {
                    sh "docker tag ${DOCKER_IMAGE} ${ECR_REPO}:${IMAGE_TAG}"
                    sh "docker push ${ECR_REPO}:${IMAGE_TAG}"
                }
            }
        }
 
        stage('deploy using kube') {
 
 
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Credentials']]) {
                script {
                    sh "aws eks update-kubeconfig --name lost-found-cluster --region ap-south-1"
                    sh "kubectl apply -f app-deployment.yml"
                    sh "kubectl apply -f mongo-deployment.yml"
                }
            }
        }
    }
    }
 
    post {
        success {
            echo "✅ Build and deployment successful!"
        }
        failure {
            echo "❌ Build or deployment failed."
        }
        always {
            echo "📦 Pipeline completed."
        }
    }
}