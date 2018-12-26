DETECT() {
    grep -q 'dh .*--parallel' debian/rules
}

PATCH() {
    sed -i -e \
        '/dh .*--parallel/ s/ *--parallel//' \
        debian/rules
}

MESSAGE="Drop unneeded dh --parallel parameter"
