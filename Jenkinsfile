pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building....'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing....'
                sh 'node start'
                sh 'npm test'
                sh 'npm stop'
            }
        }
        stage('Deploy') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                echo 'Deploying....'
                sh 'cap nodeapp deploy'
                sh 'cap nodeapp npm:install'
                sh 'cap nodeapp npm:restart'
            }
        }
    }
}