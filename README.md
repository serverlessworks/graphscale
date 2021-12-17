# GraphScale - GraphQL at scale
Apollo GraphQL, Typescript, AWS API Gateway, AWS Lambdas, AWS Lambda Layer and Terraform for IaC

## Initializing the project
```bash
yarn
```

## Local dev
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
