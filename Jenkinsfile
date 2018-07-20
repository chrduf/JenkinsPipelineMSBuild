def branchName = env.BRANCH_NAME


pipeline {
  agent any
  parameters {
    // Parameters associated with notification 
	string( name: 'mailto_on_success', 
	  description: 'Mail to on success of the current build', 
	  defaultValue: 'cdufour@west.com',
	  trim: true)
    string( name: 'mailto_on_failure', 
	  description: 'Mail to on failure of the current build', 
	  defaultValue: 'cdufour@west.com',
	  trim: true)

  }

  stages {
    stage('Build') {
      steps {
	    bat 'ClearWS.bat'
        bat 'BuildAll.bat'
      }
    }
    stage('Unit Tests') {
      steps {
          echo 'Completed unit tests'
        }
      }
    }
    stage('Create Nuget packages') {
      steps{
		echo "Created Nuget packages in folder ${WORKSPACE}\\NugetPackages"
      }
    }
    stage('Publish') {
      steps {
		echo "Created Nuget packages in folder ${WORKSPACE}\\NugetPackages"
      }
    }

    stage('Archive') {
      steps {
        archiveArtifacts allowEmptyArchive: true, artifacts: 'TestResults\\**'
        archiveArtifacts allowEmptyArchive: true, artifacts: 'Publish\\ConsoleService\\**'
        archiveArtifacts allowEmptyArchive: true, artifacts: 'Publish\\WindowsService\\**'
		archiveArtifacts allowEmptyArchive: true, artifacts: 'NugetPackages\\**'
      }
    }
	
  }

  post {
    success {
  	  mail to: "${params.mailto_on_success}",
           subject:  "Suceeded:  ${currentBuild.fullDisplayName}",
           body: "Build succeeded ${env.BUILD_URL} ${env.JOB_NAME} ${env.BUILD_NUMBER}"
    }
    failure {
      mail to: "${params.mailto_on_failure}",
           subject: "Failed: ${currentBuild.fullDisplayName}",
           body: "Build failed ${env.BUILD_URL} ${env.JOB_NAME} ${env.BUILD_NUMBER}"
    }
  }
  
}
