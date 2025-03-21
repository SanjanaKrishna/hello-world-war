pipeline {
    agent any 
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker_hub')
        DOCKERHUB_REPO = 'sanjanabn25/hello-world-war'
    }
    stages { 
        stage('SCM Checkout') { 
            steps {
                sh 'docker --version'
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    userRemoteConfigs: [[url: 'https://github.com/SanjanaKrishna/hello-world-war.git']]
                ])
            }
        }
        stage('Build docker image') {
            steps {  
                sh 'docker build -t $DOCKERHUB_REPO:$BUILD_NUMBER .'
            }
        }
        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image') {
            steps {
                sh 'docker push $DOCKERHUB_REPO:$BUILD_NUMBER'
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8086:8080 $DOCKERHUB_REPO:$BUILD_NUMBER'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
