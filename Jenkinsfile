pipeline {
  agent any

  environment {
      FOO = "bar"
  }
  stages {
    stage ('Build') {
      when {
        expression {env.BRANCH_NAME == 'dev'}
      }
      steps {
        echo 'Running build automation'
        // sh './build/deploy-ssm.sh'
      }
    }
    stage("Env Variables") {
      environment {
          NAME = "Alan"
      }
      steps {
        echo "FOO = ${env.FOO}"
        echo "NAME = ${env.NAME}"

        script {
            env.TEST_VARIABLE = "some test value"
        }

        echo "TEST_VARIABLE = ${env.TEST_VARIABLE}"

        withEnv(["ANOTHER_ENV_VAR=here is some value"]) {
            echo "ANOTHER_ENV_VAR = ${env.ANOTHER_ENV_VAR}"
        }
      }
    }
    stage('Example') {
      when {
        expression {env.BRANCH_NAME == 'test'}
      }
      steps {
          echo 'Run Build is true'

      }
        // if (env.BRANCH_NAME == 'dev') {
        //     echo 'I only execute on the master branch'
        // } else {
        //     echo 'I execute elsewhere'
        // }
    }
  }
//     stage ('Test') {
//       when {
//         expression {env.BRANCH_NAME == 'dev'}
//       }
//       steps {
//         sh './build/deploy-ssm.sh /ssm/dev/dev.csv'
//       steps {
//         script{
//           if (env.BRANCH_NAME == 'dev') {
//             sh './build/deploy-ssm.sh /ssm/dev/dev.csv'
            
//               // directories = ['/path/to/dir1']
//           } else if (env.BRANCH_NAME == 'test') {
//             sh './build/deploy-ssm.sh /ssm/int/int.csv'
//         }

//         }
//     }
//   }
//  }
  
}
