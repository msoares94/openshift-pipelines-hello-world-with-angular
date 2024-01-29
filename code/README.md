oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/resources/persistent_volume_claim.yaml

oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/tasks/apply_manifests.yaml

oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/tasks/update_deployment.yaml

oc apply -f https://raw.githubusercontent.com/msoares94/openshift-pipelines-hello-world-with-java/4openshift/code/pipeline/pipeline.yaml

