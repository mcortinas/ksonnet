// @apiVersion 0.0.1
// @name example-prototype
// @description An example prototype used to show how to create a registry
//   and usage of parts.
// @shortDescription An example prototype
// @param name string Name of the prototype
// @optionalParam namespace string default Description of optional param

local example = import 'tutorial_registry/example/example.libsonnet';

local namespace = import 'param://namespace';
local appName = import 'param://name';

{
    apiVersion: "v1",
    kind: "Service",
    metadata: {
        name: appName,
        annotations: namespace,
    },
    spec: {
        ports: [
            port: 80,
            targetPort: example.parts.port_number()
        ]
    },
    selector: {
        app: "example"
    }
}