pipeline {
    agent {
        label 'testintegration'
//        docker {
//            image 'docker.io/manics/omero-build-gradle:latest'
//        }
    }

    environment {
        // Needed for Gradle, not sure why the slave doesn't handle this
        JAVA_HOME = '/usr/lib/jvm/jre-1.8.0-openjdk'
    }

    stages {
        stage('Build') {
            steps {
                sh 'gradle publishToMavenLocal'
            }
        }
        stage('Deploy') {
            steps {
                sh 'gradle publish'
            }
        }
    }

    post {
        always {
            // Cleanup workspace
            deleteDir()
        }
    }
}
