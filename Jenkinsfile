// The porpuse of this jenkis file is to run a pipeline using different agents, our main agent will be in chrarge
// to download the SW and run the SW, while the mock agent will be in charge of compile the SW

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
            }
        }
        
        stage('Changing permissions to sh files') {
            agent {
                label 'MockLinuxFedora'
            }
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x run.sh'
            }
        }
        
        stage('Building SW') {
            agent {
                label 'MockLinuxFedora'
            }
            steps {
                sh returnStdout: true, script: './build.sh'
            }
        }
    
        stage('Running SW') {
            agent {
                label 'MockLinuxFedora'
            }
            steps {
                sh returnStdout: true, script: './run.sh'
            }
        }    
    }
}
