pipeline{
    agent {
        docker{
            image 'maven'
            args '-v m2:/root/.m2'
            label 'docker'
        }
    }
    stages{
        stage('Checkout'){
            steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ErnestoJH90/Mvn']]])
               
            }
        }
        stage('Mvn Version'){
            steps{
                sh 'mvn --version'
            }
        }
        stage('Build'){
            steps{
                
                sh 'cd KtJenkins && mvn clean package'
                sh 'java -cp KtJenkins/target/KtJenkins-1.0-SNAPSHOT.jar com.KtJenkins.app.App > Reports.txt'
            }
        }
            
        stage('Delivery'){
            steps{
                archiveArtifacts artifacts: 'Reports.txt', followSymlinks: false
            }
        }
            
    }
    post {
       always {
         cleanWs()
         }
     }
}