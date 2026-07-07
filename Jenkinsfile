pipeline {
    agent any

    parameters {
        choice(
            name: 'BUILD_RESULT',
            choices: ['SUCCESS', 'FAILURE'],
            description: 'Choose SUCCESS or FAILURE to test Grafana dashboard'
        )
    }

    stages {
        stage('Build') {
            steps {
                echo 'Build stage running...'
            }
        }

        stage('Test') {
            steps {
                script {
                    if (params.BUILD_RESULT == 'FAILURE') {
                        error('Intentional failure for dashboard testing')
                    } else {
                        echo 'Test stage passed...'
                    }
                }
            }
        }
    }

    post {
        success {
            script {
                influxDbPublisher(
                    selectedTarget: 'jenkins-influxdb',
                    customDataMap: [
                        'jenkins_pipeline_summary': [
                            total: 1,
                            passed: 1,
                            failed: 0,
                            duration_seconds: ((currentBuild.duration ?: 0) / 1000) as long
                        ]
                    ],
                    customDataMapTags: [
                        'jenkins_pipeline_summary': [
                            job_name: env.JOB_NAME ?: 'unknown',
                            build_number: env.BUILD_NUMBER ?: '0',
                            result: 'SUCCESS',
                            branch: env.BRANCH_NAME ?: 'manual'
                        ]
                    ]
                )
            }
        }

        failure {
            script {
                influxDbPublisher(
                    selectedTarget: 'jenkins-influxdb',
                    customDataMap: [
                        'jenkins_pipeline_summary': [
                            total: 1,
                            passed: 0,
                            failed: 1,
                            duration_seconds: ((currentBuild.duration ?: 0) / 1000) as long
                        ]
                    ],
                    customDataMapTags: [
                        'jenkins_pipeline_summary': [
                            job_name: env.JOB_NAME ?: 'unknown',
                            build_number: env.BUILD_NUMBER ?: '0',
                            result: 'FAILURE',
                            branch: env.BRANCH_NAME ?: 'manual'
                        ]
                    ]
                )
            }
        }
    }
}
