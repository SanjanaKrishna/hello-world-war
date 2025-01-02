pipeline {
    agent { label 'dev' }  // Define the agent label for the pipeline
    
    stages {
        stage('CHECKOUT') {
            steps {
                // Use the built-in 'git' step
                git url: 'https://github.com/SanjanaKrishna/hello-world-war.git'
                echo 'End of Checkout'
            }
        }
        
        stage('BUILD') { 
            steps {
                script {
                    // Build the WAR file using Maven
                    sh 'mvn clean package'
                }
                echo 'End of Build'
            }
        }
        
        stage('DEPLOY') {
            steps {
                script {
                    // Use SCP to copy the WAR file to the Tomcat webapps directory
                    sh '''
                        scp -o StrictHostKeyChecking=no \
                        /home/ubuntu/jenkins/workspace/pileline_master_slave/target/hello-world-war-1.0.0.war \
                        root@172.31.6.200:/opt/apache-tomcat-10.1.34/webapps/
                    '''
                }
                echo 'End of Deploy'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
