namespace thedailyabstraction.smithy.api

use aws.auth#sigv4
use aws.protocols#restJson1
use smithy.framework#ValidationException

@title("API Gateway facing model definition")

@sigv4(name: "execute-api")
@restJson1
@cors(origin: "https://thedailyabstraction.com")
service TheDailyAbstractionGateway {
    version: "2018-05-10",
    operations: [Echo],
}

// Cross-origin resource sharing allows resources to be requested from external domains.
// Cors should be enabled for externally facing services and disabled for internally facing services.
// Enabling cors will modify the OpenAPI spec used to define your API Gateway endpoint.
// Uncomment the line below to enable cross-origin resource sharing

/// Echo operation that receives input from body.
@http(code: 200, method: "POST", uri: "/echo",)
operation Echo {
    input: EchoInput,
    output: EchoOutput,
    errors: [ValidationException],
}

structure EchoInput {
    string: String,
}

structure EchoOutput {
    string: String,
}
