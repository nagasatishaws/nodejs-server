pipeline {
  agent any
  tools {nodejs "nodejs" }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/nagasatishaws/nodejs-server.git'
      }
    }
    stage('npm install') {
       steps {
         sh 'npm install'
       }
    }
    stage('build') {
      steps {
        sh 'npm run build'
      }
    }
  }
}
