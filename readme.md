#Phoronix Test Suite for OpenShift



## Required Permissions
The phoronix suite runs as root and requires an the anyuid scc to be applied.

```
oc project phoronix-test-suite
oadm policy add-scc-to-user anyuid -z default
```
