DETECT() {
    test $(cat debian/compat) -ge 10 \
        && grep -q dh-autoreconf debian/control
}

PATCH() {
    sed -i \
        -e '/dh-autoreconf,/ { s/dh-autoreconf,//; /^ *$/d; }' \
        debian/control
}

MESSAGE="Drop unneeded dh-autoreconf build-dependency"
