// pipeline {
//     agent any
//     //tools {
//      //   maven 'Maven-3.4.0' // Specify your Maven version if using Maven
//      //   jdk 'JDK11'         // Specify your JDK version
//     //}
//     environment {
//         SONAR_TOKEN = credentials('SONAR_TOKEN') // Store token in Jenkins credentials
//     }
    
//        stages 
//     {
//         stage('checkout') {             
//             steps {
//                 sh 'rm -rf hello-world-war'
//                 sh 'git clone https://github.com/SanjanaKrishna/hello-world-war/'
//             }
//         }
//          stage('build') { 
//             steps {
//                 sh 'cd hello-world-war'
//                 sh 'mvn clean package'
//             }
//         }

//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }
//         stage('Build') {
//             steps {
//                 sh 'mvn clean install' // Adjust for your build tool
//             }
//         }
//         //add your own sonar account details  
//         stage('SonarCloud Analysis') {
//             steps {
//                 withSonarQubeEnv('SonarCloud') {
//                     sh '''
//                     mvn sonar:sonar \
//                       -Dsonar.projectKey=sanjanakrishna_hello-world-war-1 \
//                       -Dsonar.organization=sanjanakrishna \
//                       -Dsonar.host.url=https://sonarcloud.io \
//                       -Dsonar.token=$SONAR_TOKEN
//                     '''
//                 }
//             }
//         }
//         stage('Quality Gate') {
//             steps {
//                 script {
//                     def qg = waitForQualityGate()
//                     if (qg.status != 'OK') {
//                         error "Pipeline aborted due to quality gate failure: ${qg.status}"
//                     }
//                 }
//             }
//         }
//     }
//     }

pipeline {
    agent any
    environment {
        ARTIFACT_URL = 'http://13.201.136.81:8082/artifactory/hello-world-war-libs-release/com/efsavage/hello-world-war/1.0.9/hello-world-war-1.0.9.war'
        TOMCAT_PATH = '/opt/apache-tomcat-10.1.34'
                }
    stages {
        stage('Download Artifact') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'artifactory-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    cd /opt/apache-tomcat-10.1.34/webapps
                    curl -L -u "${USERNAME}:${PASSWORD}" -o hello-world-war.war "${ARTIFACT_URL}"
                    cd ..
                    pwd
                    cd /bin/
                    ./shutdown.sh
                    sleep 10
                    ./startup.sh
                    echo"Tomcat Started "
                    
                    """
                }
            }
        }
    }
  }
        // stage('Deploy to Tomcat') {
        //     steps {
        //         sh """
        //         mv hello-world-war.war ${TOMCAT_PATH}/webapps/
        //         ${TOMCAT_PATH}/bin/shutdown.sh || true
        //         ${TOMCAT_PATH}/bin/startup.sh
        //         """
        //     }
        // }
    


   
