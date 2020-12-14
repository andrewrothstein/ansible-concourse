#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/concourse/concourse/releases/download
readonly APP=concourse

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=${4:-tgz}
    local platform="${os}-${arch}"
    local url=$MIRROR/v${ver}/${APP}-${ver}-${platform}.${archive_type}.sha1
    printf "    # %s\n"  $url
    printf "    %s: sha1:%s\n" $platform $(curl -SsL $url | awk '{print $1}')
}

dl_ver () {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver linux amd64
    dl $ver windows amd64 zip
}

dl_ver ${1:-6.7.2}
