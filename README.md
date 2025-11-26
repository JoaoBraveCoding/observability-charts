# Observability Charts

A collection of Helm charts to help users bootstrap their Observability stacks.
The goal of these charts is not to be the solution to manage your Observability
stack but rather a way to bootstrap it.

```shell
helm upgrade --install install-operators charts/install-operators/
helm upgrade --install bootstrap-observability charts/bootstrap-observability/
```
