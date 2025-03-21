pipeline {
    agent any 
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        DOCKERHUB_REPO = 'sanjanabn25/hello-world-war'
    }
    stages { 
        stage('SCM Checkout') {
            steps {
                git 'https://github.com/SanjanaKrishna/hello-world-war.git'
            }
        }
        stage('Build docker image') {
            steps {  
                sh 'sudo docker build -t $DOCKERHUB_REPO:$BUILD_NUMBER .'
            }
        }
        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image') {
            steps {
                sh 'sudo docker push $DOCKERHUB_REPO:$BUILD_NUMBER'
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'sudo docker run -d -p 8080:8080 $DOCKERHUB_REPO:$BUILD_NUMBER'
            }
        }
    }
   post {
    always {
        script {
            sh 'docker logout'
        }
    }
}
}

