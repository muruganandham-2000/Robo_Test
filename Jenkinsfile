pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build a Docker image with Chrome, ChromeDriver, and your Selenium code
                    docker.build('my-selenium-container', '-f Dockerfile')

                    // Push the Docker image to a registry (optional)
                    // docker.withRegistry('https://registry.example.com', 'my-registry-credentials') {
                    //     docker.image('my-selenium-container').push('latest')
                    // }
                }
            }
        }

        stage('Run Selenium Tests in Docker') {
            steps {
                script {
                    // Run Selenium tests in the Docker container
                    def seleniumContainer = docker.image('my-selenium-container').run("--rm -v ${WORKSPACE}:/workspace")
                    try {
                        // Execute Selenium tests (e.g., using pytest, robot framework, or other test runners)
                        seleniumContainer.inside {
                            sh 'robot Robot_File/Testcase.robot'
                        }
                    } finally {
                        seleniumContainer.stop()
                    }
                }
            }
        }
    }
}
