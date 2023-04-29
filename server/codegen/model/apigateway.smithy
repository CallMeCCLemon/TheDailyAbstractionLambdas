namespace thedailyabstraction.smithy.api

apply Echo @aws.apigateway#integration(
    type: "aws_proxy",
    httpMethod: "POST",
    uri: ""
)
