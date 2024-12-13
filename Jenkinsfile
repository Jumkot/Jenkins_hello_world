pipeline {
    agent any
    triggers {
        githubPush()
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Jumkot/Jenkins_hello_world.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t jenkins_app:latest ./app'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker stop jenkins_app_container || true'
                    sh 'docker rm jenkins_app_container || true'

                    sh 'docker run -d --name jenkins_app_container -p 5000:5000 -p 8443:443 jenkins_app:latest'
                }
            }
        }
    }
    post {
        always {
            sh 'docker stop jenkins_app_container || true'
            sh 'docker rm jenkins_app_container || true'
        }
    }
}