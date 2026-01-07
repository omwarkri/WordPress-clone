pipeline {
    agent any

    environment {
        IMAGE_NAME = "wordpress-app"
        DOCKERHUB_USER = "omwarkri123"
        TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_USER/$IMAGE_NAME:$TAG .'
            }
        }

        stage('Security Scan') {
            steps {
                sh 'trivy image $DOCKERHUB_USER/$IMAGE_NAME:$TAG'
            }
        }

        stage('Push Image') {
            steps {
                sh '''
                docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASS
                docker push $DOCKERHUB_USER/$IMAGE_NAME:$TAG
                '''
            }
        }

        stage('Deploy to K8s') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}
