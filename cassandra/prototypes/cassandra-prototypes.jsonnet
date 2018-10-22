// @apiVersion 0.0.1
// @name cassandra-prototype
// @description An cassandra prototype used to show how to create a registry
//   and usage of parts.
// @shortDescription An cassandra prototype
// @param name string Name of the prototype
// @optionalParam namespace string default Description of optional param

local cassandra = import 'https://github.com/mcortinas/ksonnet/blob/master/cassandra/cassandra.libsonnet';
local namespace = import 'param://namespace';
local appName = import 'param://name';

{
    apiVersion: "v1",
    kind: "Service",
    metadata: {
        name: appName,
        namespace: namespace,
    },
    spec: {
        ports: [
            port: 7199,
            name: jmx
        ]
    },
    selector: {
        component: "cassandra"
    },
    type: { Loadbalancer },
}