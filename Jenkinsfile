podTemplate {
    node(POD_LABEL) {
        stage('Checkout') {
            checkout([$class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[credentialsId: 'jenkins-credentials',
                    url: 'https://github.com/devops-toolschain/spring-boot-application-gradle.git']]])
        }
        
        stage('Run shell') {
            sh 'echo hello world'
        }
    }
}