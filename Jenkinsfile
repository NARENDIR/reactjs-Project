pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh '.build.sh'
            }
        }
        
        stage('Test') {
            steps {
                sh 'npm install' 
                sh 'npm run test' 
            }
        }
        
        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                sh 'docker build -t dev/project .'
                sh 'docker push dev/project'
            }
        }
        
        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                sh 'docker build -t prod/project .'
                sh 'docker push prod/project'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'deploy.sh'
            }
        }
    }
}



