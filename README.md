# GraphScale - GraphQL at scale
Apollo GraphQL, Typescript, AWS API Gateway, AWS Lambdas, AWS Lambda Layer and Terraform for IaC

## Scalable out of the box
Fully scalable Apollo GrpahQL that runs on AWS Lambda exposed buy an Rest AWS API Gateway. AWS API Gateway can support up to 3,600,000 concurrent connections the default value is 500 and about Lambdas there is no maximum concurrency limit the default account limit is 1000 per account.

## Initializing the project
```bash
yarn
```

## Local development
```bash
yarn start
```

## Deploying to AWS
```bash
yarn deploy
```

## Testing
```bash
curl -X POST https://xxxxxxxxxx.execute-api.eu-west-2.amazonaws.com/prd/graphql \
-H 'Content-Type: application/json' \
-d @- <<'EOF'
{
    "query": "query($input: HelloQueryInput) {
        hello(input: $input){ msg }
    }",
    "variables": {"input": {"firstName": "test", "lastName": "test"}}
}
EOF
```
