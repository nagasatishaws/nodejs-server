pipeline {
   environment {
     dockerRegistry = "nagasatishdocker/projects"
     dockerRegistryCredential = 'dockerhub'
     dockerImage = ''
   }
   agent any
   tools {nodejs "node" }
   stages {
     stage('Cloning Git') {
       steps {
         git 'hhttps://github.com/nagasatishaws/nodejs-server.git'
       }
     }
     stage('node install') {
        steps {
          sh 'npm install'
        }
     }
     stage('build') {
       steps {
         sh 'npm run bild'
       }
     }
     stage('Building image') {
       steps{
         script {
           dockerImage = docker.build dockerRegistry + ":$BUILD_NUMBER"
         }
       }
     }
     stage('Upload Image') {
       steps{
         script {
           docker.withRegistry( '', dockerRegistryCredential ) {
             dockerImage.push()
           }
         }
       }
     }
     stage('Remove Unused docker image') {
       steps{
         sh "docker rmi $dockerRegistry:$BUILD_NUMBER"
       }
     }
   }
 }
