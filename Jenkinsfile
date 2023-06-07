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
    stage('Example') {
        if (env.BRANCH_NAME == 'dev') {
            echo 'I only execute on the master branch'
        } else {
            echo 'I execute elsewhere'
        }
    }
    stage ('Test') {
      when {
        expression {env.BRANCH_NAME == 'dev'}
      }
      steps {
        sh './build/deploy-ssm.sh /ssm/dev/dev.csv'
      steps {
        script{
          if (env.BRANCH_NAME == 'dev') {
            sh './build/deploy-ssm.sh /ssm/dev/dev.csv'
            
              // directories = ['/path/to/dir1']
          } else if (env.BRANCH_NAME == 'test') {
            sh './build/deploy-ssm.sh /ssm/int/int.csv'
        }

        }
    }
  }
 }
}
}
