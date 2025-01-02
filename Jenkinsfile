pipeline {
    agent {label 'dev'}
    stages {
        stage('CHECKOUT') {
            steps {
                git clone https://github.com/SanjanaKrishna/hello-world-war.git
                echo 'End of Checkout'
            }
         }
        stage('BUILD') {
            steps {
                mvn clean package
                echo 'End of build'
            }
            
        }
        stage('DEPLOY') {
            steps {
                
            }
        }
    }
}
