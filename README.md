# GraphScale - GraphQL at Scale
Apollo GraphQL, Typescript, AWS API Gateway, AWS Lambdas, AWS Lambda Layer and Terraform for IaC

## Scalable out of the box
Fully scalable Apollo GraphQL that runs on AWS Lambda exposed buy an Rest AWS API Gateway. AWS API Gateway can support up to 3,600,000 concurrent connections the default value is 500 and for Lambdas there is no maximum concurrency limit the default soft limit is 1000 concurrent execution.

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

---
**_NOTE:_** The above command will be run on a environment that has assumed a role with a set of permissions capable to access AWS resources

## Testing
```bash
curl -X POST https://xxxxxxxxxx.execute-api.eu-west-2.amazonaws.com/prd/graphql \
-H 'Content-Type: application/json' \
-d @- <<'EOF'
{
    "query":"query($input: HelloQueryInput){hello(input: $input){msg}}",
    "variables":{
        "input":{
            "firstName":"test",
            "lastName":"test"
        }
    }
}
EOF
```
