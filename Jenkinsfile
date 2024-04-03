pipeline {
  agent any
  tools {
    jdk 'Java17'
    maven 'Maven'
  }
  environment {
    APP_NAME = "src_tool_generate_be"
    RELEASE = "0.1.0"
    DOCKER_USER = "monkeyboss21102"
    DOCKER_PASS = 'dockerhub'
    IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
    IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
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
        dir("/var/jenkins_home/workspace/Tool-gen/src_tool_generate_be"){
          sh "mvn clean package"
        }
      }
    }
    stage('Build') {
            agent {
                docker {
                    image 'gradle:8.2.0-jdk17-alpine'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
                sh 'gradle --version'
            }
        }
  }
}
