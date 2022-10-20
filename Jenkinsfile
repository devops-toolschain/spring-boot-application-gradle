podTemplate(containers: [
    containerTemplate(
        name: 'jnlp',
        image: 'devops-jenkins-agent:1.0'
        )
  ]) {

    node(POD_LABEL) {
        stage('Checkout') {
            container('jnlp') {
                stage('Print Variables') {
                    sh 'echo Workspace is $WORKSPACE'
                }

                stage('Build') {
                    checkout([$class: 'GitSCM',
                        branches: [[name: '*/master']],
                        userRemoteConfigs: [[credentialsId: 'jenkins-credentials',
                        url: 'https://github.com/devops-toolschain/spring-boot-application-gradle.git']]])

                    sh 'cd $WORKSPACE'
                    sh './gradlew build --no-daemon --init-script init.gradle'
                    sh 'ls -al build/libs'
                }

                stage('Code Quality') {
                    withSonarQubeEnv(credentialsId: 'jenkins-sonar-token', installationName: 'sonarcloud') {
                        sh './gradlew sonarqube --no-daemon --init-script init.gradle'
                    }
                }

                stage('Build Infra') {
                    sh 'terraform version'
                }
            }
        }
    }
}