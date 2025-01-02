pipeline {
    agent { label 'dev' }
    
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
            steps {  agent { label 'Node3' }
                script {
                    // Use SCP to copy the WAR file to the Tomcat webapps directory
                    sh """
                    scp /home/ubuntu/jenkins/workspace/pileline_master_slave/target/hello-world-war-1.0.0.war root@172-31-15-174:/home/ubuntu/apache-tomcat-10.1.34/webapps/

                    """
                }
            }
        }
    }

    post {
        success {
            mail to: 'sanjanabn6@gmail.com',
                 subject: "Build Success",
                 body: "The build was successful."
        }

        failure {
            mail to: 'sanjanabn6@gmail.com',
                 subject: "Build Failure",
                 body: "The build failed."
        }
    }
}
