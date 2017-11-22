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
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                echo 'Deploying....'
                sh 'bundle exec cap nodeapp deploy'
                sh 'bundle exec cap nodeapp npm:install'
                sh 'bundle exec cap nodeapp npm:restart'
            }
        }
    }
}