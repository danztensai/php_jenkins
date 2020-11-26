pipeline {
    agent any
    environment {
        PROJECT_ID = 'translate-cizen-1549780978207'
        CLUSTER_NAME = 'my-first-cluster-1'
        LOCATION = 'us-central1-c'
        CREDENTIALS_ID = 'gke'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/php_simple_curd:latest/php_simple_curd:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }    
}