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
                sh 'npm start && npm test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'cap nodeapp deploy'
                sh 'cap nodeapp npm:install'
                sh 'cap nodeapp npm:restart'
            }
        }
    }
}