pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        echo 'Running build automation on a new branch'
        sh './gradlew build --no-daemon'
        archiveArtifacts artifacts: 'dist/trainSchedule.zip'
      }
    }
  }
 }
