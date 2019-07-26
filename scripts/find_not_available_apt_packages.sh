our_os=$(cat /etc/*-release | egrep ^ID= | sed -r "s/^ID=//")
OS="${1:-$our_os}"
for i in $(cat rosdep/base.yaml | grep $OS: | sed -r "s/^.+\[(.+)\]$/\1/" | sed -r "s/,\ /\n/g" | sort | uniq); do echo $(apt-cache policy $i | wc -l) $i ; done | egrep ^0 
