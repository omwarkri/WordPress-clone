pipeline {
  agent any

  environment {
    AWS_ACCOUNT_ID = "782696281574"
    AWS_REGION     = "ap-south-1"
    ECR_REPO       = "wordpress-app"
    ECR_REGISTRY   = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
    IMAGE_TAG      = "${BUILD_NUMBER}"
    IMAGE          = "${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}"
  }

  stages {

    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh '''
          docker build -t $IMAGE ./wordpress-app
        '''
      }
    }

    stage('Login to AWS ECR') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'aws-creds'
        ]]) {
          sh '''
            aws ecr get-login-password --region $AWS_REGION \
            | docker login --username AWS --password-stdin $ECR_REGISTRY
          '''
        }
      }
    }

    stage('Push Image to ECR') {
      steps {
        sh '''
          docker push $IMAGE
        '''
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
          sh '''
            kubectl --kubeconfig=$KUBECONFIG set image deployment/wordpress \
              wordpress=$IMAGE \
              -n default \
            || kubectl --kubeconfig=$KUBECONFIG apply -f k8s/
          '''
        }
      }
    }
  }
}
