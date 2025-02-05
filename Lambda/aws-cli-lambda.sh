zip lambda_function.zip lambda_function.py

aws iam create-role --role-name lambda-role \
  --assume-role-policy-document '{"Version": "2012-10-17", "Statement": [{"Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

aws lambda create-function --function-name HelloLambda \
  --runtime python3.8 --role arn:aws:iam::123456789012:role/lambda-role \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://lambda_function.zip

aws lambda invoke --function-name HelloLambda output.txt

cat output.txt

aws logs describe-log-groups --log-group-name /aws/lambda/HelloLambda