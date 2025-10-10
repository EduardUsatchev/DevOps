echo "🛑 Stopping and removing LocalStack..."
docker stop localstack && docker rm localstack
echo "✅ LocalStack stopped and removed."
