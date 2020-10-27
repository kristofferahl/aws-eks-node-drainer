# eks-node-drainer

## What
In essence, `eks-node-drainer` is a dockerized `lifecycled` with a deployment manifest for Kubernetes.

`eks-node-drainer` is designed to run on AWS EKS as a daemonset and listen for state changes of cluster nodes. It allows you to gracefully handle EC2 scaling events.

The heavy lifting is all done by [lifecycled](https://github.com/buildkite/lifecycled).

## Why

`eks-node-drainer` allows the handler script to be specified in a config map in order to support custom draining logic without having to re-build the image. Simply replace the config map `node-drainer` included in `node-drainer.yaml` to supply your custom draining logic.

## How

1. Download and edit `node-drainer.yaml`. **NOTE** You need to supply values for `AWS_REGION`, `LIFECYCLED_SNS_TOPIC` and `LIFECYCLED_CLOUDWATCH_GROUP` in the configmap.
2. Apply the edited yaml
```bash
kubectl apply -f node-drainer.yaml
```

You may also use something like `kustomize` to merge/replace a generated configmap with the existing yaml.
