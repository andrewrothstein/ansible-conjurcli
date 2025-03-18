#!/usr/bin/env bash
set -e
readonly DIR=~/Downloads
readonly MIRROR=https://github.com/cyberark/conjur-cli-go/releases/download

# https://github.com/cyberark/conjur-cli-go/releases/download/v8.0.19/SHA256SUMS.txt
# https://github.com/cyberark/conjur-cli-go/releases/download/v8.0.19/conjur-cli-go_8.0.19_linux_amd64.tar.gz

dl()
{
    local lchecksum=$1
    local ver=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-"tar.gz"}
    local platform="${os}_${arch}"
    local file=conjur-cli-go_${ver}_${platform}.${archive_type}
    local url=$MIRROR/v${ver}/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(egrep -e "${file}\$" $lchecksum | awk '{print $1}')
}

dl_ver () {
    local ver=$1
    local checksum_url=${MIRROR}/v${ver}/SHA256SUMS.txt
    printf "  # %s\n" $checksum_url
    local lchecksum=$DIR/conjur_${ver}_SHA256SUMS.txt

    if [ ! -e $lchecksum ];
    then
        curl -sSLf -o $lchecksum $checksum_url
    fi

    printf "  '%s':\n" $ver
    dl $lchecksum $ver darwin amd64
    dl $lchecksum $ver darwin arm64
    dl $lchecksum $ver linux 386
    dl $lchecksum $ver linux amd64
    dl $lchecksum $ver linux arm64
    dl $lchecksum $ver windows 386 zip
    dl $lchecksum $ver windows amd64 zip
    dl $lchecksum $ver windows arm64 zip
}

dl_ver ${1:-8.0.19}
