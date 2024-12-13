pipeline {
    agent any
    triggers {
        githubPush()  // Пайплайн будет запускаться при изменении в репозитории
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Клонируем репозиторий
                git url: 'https://github.com/Jumkot/Jenkins_hello_world.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Собираем Docker-образ, используя Dockerfile из папки app
                    sh 'docker build -t jenkins_app:latest ./app'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Останавливаем и удаляем старый контейнер, если он существует
                    sh 'docker stop jenkins_app_container || true'
                    sh 'docker rm jenkins_app_container || true'

                    // Запускаем контейнер в фоновом режиме
                    sh 'docker run -d --name jenkins_app_container -p 5000:5000 -p 8443:443 jenkins_app:latest'
                }
            }
        }
    }
    post {
        always {
            // Чистим контейнер после выполнения
            sh 'docker stop jenkins_app_container || true'
            sh 'docker rm jenkins_app_container || true'
        }
    }
}