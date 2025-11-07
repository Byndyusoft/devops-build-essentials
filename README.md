# devops-build-essentials

Image with all components needed for build images with make and docker-in-docker.
Installed components:
  * dind
  * make
  * git
  * curl
  * openssl
  * bash
  * twine
  * nuget

Jenkins pod template example:
```groovy
podTemplate(yaml: '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: byndyusoft/build-essentials:0.0.3
    securityContext:
      privileged: true
    env:
      - name: DOCKER_TLS_CERTDIR
        value: ""
    resources:
      limits:
        memory: "256Mi"
        cpu: "100m"
  - name: jnlp
    resources:
      limits:
        memory: "256Mi"
        cpu: "100m"
''') {
  node(POD_LABEL) {
	container("make") {
	  sh "make --version"
	  sh "docker --version"
	}
  }
}
```

## Docker hub repository
https://hub.docker.com/r/byndyusoft/build-essentials
