pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        echo 'Running build automation'
        // sh './build/deploy-ssm.sh'
        // archiveArtifacts artifacts: 'dist/trainSchedule.zip'
      }
    }
    stage ('Test') {
      when {
          expression {
              return (env.BRANCH_NAME == 'dev' || env.BRANCH_NAME == 'test')
          }
      }
      steps {
        script{
          if (env.BRANCH_NAME == 'dev') {
            sh './build/deploy-ssm.sh /ssm/dev/dev.csv'
          } else if (env.BRANCH_NAME == 'test') {
            sh './build/deploy-ssm.sh /ssm/int/int.csv'
          }
        }
      }
    }
  }
}
