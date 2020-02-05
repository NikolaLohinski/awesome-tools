# Golang

## Tips
1. Output a test coverage report easily :
   ```
   $ go test -coverprofile=/tmp/coverage.out
   $ go tool cover -html=/tmp/coverage.out -o /tmp/coverage.html
   $ <YOUR FAVORITE BROWSER> /tmp/coverage.html &
   ```