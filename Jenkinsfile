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
        git branch: 'dev', credentialsId: 'github_thanh289211', url: 'https://github.com/thanh289211/tool_gen.git'
      }
    }
    stage("Build Application"){
      steps{
      }
    }
  }
}
