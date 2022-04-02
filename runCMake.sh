#!/usr/bin/bash
osgVersion=3.6.5
vsToolset=v143
targetArchitecture=x64 # x86 or x64
cmakeArchitecture=x64 # Win32 or x64

build_path="..\/${PWD##*/}-build-${targetArchitecture}"

sed "s/{osgVersion}/${osgVersion}/;s/{vsToolset}/${vsToolset}/;s/{targetArchitecture}/${targetArchitecture}/" CMakeInitialCacheTemplate.txt > CMakeInitialCache.txt

execThis="cmake -C CMakeInitialCache.txt -G \"Visual Studio 17 2022\" -A ${cmakeArchitecture} -T ${vsToolset} -H. -B\"${build_path}\""

echo "Executing: ${execThis}"
eval "$execThis"

