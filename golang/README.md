# Golang

1. Output a test coverage report easily :
   ```
   $ go test -coverprofile=/tmp/coverage.out
   $ go tool cover -html=/tmp/coverage.out -o /tmp/coverage.html
   $ <YOUR FAVORITE BROWSER> /tmp/coverage.html &
   ```
1. Upgrade or downgrade easily Golang with minimal system intrusions using [update-golang.sh](https://github.com/udhos/update-golang) ;

1. Manage different versions of Golang with [`gvm`](https://github.com/moovweb/gvm) ;