pipeline {
  agent any
  tools {
    jdk 'Java17'
    maven 'Maven'
  }
  stages{
    stage("Cleanup Workspace"){
      steps{
        cleanWs()
      }
    }
    stage("Clone from github"){
      steps{
        git branch: 'main', credentialsId: 'github_thanh289211', url: 'https://github.com/thanh289211/test-jenkins.git'
      }
    }
    stage("Build Application"){
      steps{
        sudo "mvn clean package"
      }
    }
  }
}
