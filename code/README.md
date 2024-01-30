oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/resources/persistent_volume_claim.yaml -n demo-pipelines

oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/tasks/apply_manifests.yaml -n demo-pipelines

oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/tasks/update_deployment.yaml -n demo-pipelines

oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/pipeline/pipeline.yaml -n demo-pipelines

