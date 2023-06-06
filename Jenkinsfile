pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        echo 'Running build automation'
        sh './build/deploy-ssm.sh'
        // archiveArtifacts artifacts: 'dist/trainSchedule.zip'
      }
    }
    stage ('Test') {
      steps {
        echo 'Running test automation'
        // sh './gradlew build --no-daemon'
        // archiveArtifacts artifacts: 'dist/trainSchedule.zip'
      }
    }
  }
 }
