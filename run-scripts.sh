set -eu -o pipefail
echo $USER > ./username
./scripts/install-programs.sh
./scripts/set-up-config-files.sh
rm ./username
