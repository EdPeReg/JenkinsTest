pipeline {
    agent any // This means that each stage will take any agent available, only if the stage it doesn't specify an agent
    
    stages {
        stage('Download repository') {
            // Run this in the agent with label main, this will be our main label
            agent {
                label 'main'
            }
            steps {
                echo 'Stage download repository...'
                git branch: 'main', credentialsId: 'b28f0c89-811b-409d-b16c-630857f090e7', url: 'https://github.com/EdPeReg/JenkinsTest.git'
                sleep 5
            }
        }
        
        stage('Changing permissions to sh files') {
            agent {
                label 'MockLinuxFedora'
            }
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x run.sh'
                sleep 5
            }
        }
        
        stage('Building SW') {
            agent {
                label 'MockLinuxFedora'
            }
            steps {
                sh returnStdout: true, script: './build.sh'
                sleep 5
            }
        }
    
        stage('Running SW') {
            agent {
                label 'main'
            }
            steps {
                sh returnStdout: true, script: './run.sh'
            }
        }    
    }
}
