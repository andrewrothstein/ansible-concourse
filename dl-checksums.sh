#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/concourse/concourse/releases/download

dl()
{
    local ver=$1
    local app=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tgz}
    local platform="${os}-${arch}"
    local url=$MIRROR/v${ver}/${app}-${ver}-${platform}.${archive_type}.sha1
    printf "      # %s\n"  $url
    printf "      %s: sha1:%s\n" $platform $(curl -SsLf $url | awk '{print $1}')
}

dl_ver () {
    local ver=$1
    printf "  '%s':\n" $ver
    printf "    %s:\n" concourse
    dl $ver concourse darwin amd64
    dl $ver concourse linux amd64
    dl $ver concourse windows amd64 zip
    printf "    %s:\n" fly
    dl $ver fly darwin amd64
    dl $ver fly linux amd64
    dl $ver fly windows amd64 zip

}

dl_ver ${1:-7.11.2}
