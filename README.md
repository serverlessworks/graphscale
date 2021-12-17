# GraphScale
Scalable GraphQL with Apollo GraphQL, Typescript, AWS API Gateway, AWS Lambdas, AWS Lambda Layer and Terraform

## Init the project
```bash
yarn
```

## Deployment the project
```bash
yarn deploy
```

## Testing
```bash
curl -X POST \
-H 'Content-Type: application/json' \
--data-binary '{"query":"query($input: HelloQueryInput){hello(input: $input){msg  }}","variables":{"input":{"firstName":"test","lastName":"test"}}}' \
https://fxqlkfanng.execute-api.eu-west-2.amazonaws.com/prd/graphql
```
