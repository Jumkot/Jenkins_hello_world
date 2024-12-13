pipeline {
    agent any
    triggers {
        githubPush()
    }
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/Jumkot/Jenkins_hello_world.git'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'pip install -r app/requirements.txt'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker-compose -f docker-compose.yml build'
            }
        }
        stage('Deploy application') {
            steps {
                sh 'docker-compose -f docker-compose.yml down && docker-compose -f docker-compose.yml up -d'
            }
        }
    }
}