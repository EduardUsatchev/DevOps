aws secretsmanager create-secret --name MyDatabaseSecret \
  --description "Database credentials" \
  --secret-string '{"username":"admin","password":"mypassword"}'

aws secretsmanager get-secret-value --secret-id MyDatabaseSecret
