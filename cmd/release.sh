set -ex

rm -rf ./bin/release
mkdir -p ./bin/release

make() {
    mkdir ./bin/release/daze_$1_$2
    GOOS=$1 GOARCH=$2 go build -o ./bin/release/daze_$1_$2 github.com/mohanson/daze/cmd/daze
    python -m zipfile -c ./bin/release/daze_$1_$2.zip ./bin/release/daze_$1_$2
}

# https://golang.org/doc/install/source#environment
make android arm64
make linux amd64
make windows amd64
