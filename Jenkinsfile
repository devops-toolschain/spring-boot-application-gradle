podTemplate {
    node(POD_LABEL) {
        stage('Checkout') {
            checkout([$class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[credentialsId: 'jenkins-credentials',
                    url: 'https://github.com/devops-toolschain/spring-boot-application-gradle.git']]])
        }
        
        stage('Print Variables') {
            sh 'echo Workspace is $WORKSPACE'
        }
        
        stage('Build') {
            sh 'cd $WORKSPACE'
            sh 'ls -al'
            sh './gradlew build --no-daemon --init-script init.gradle --info'
            sh 'ls -al build/libs'
        }
        
        stage('Code Quality') {
            // withSonarQubeEnv(credentialsId: 'jenkins-sonar-token', installationName: 'sonarcloud') {
            //     sh './gradlew sonarqube --no-daemon --init-script init.gradle --info'   
            // }
        }
    }
}