DETECT() {
    grep -q 'dh .*--parallel' debian/rules
}

PATCH() {
    sed -i -e \
        's/dh \(.*\)--parallel/dh \1/' \
        debian/rules
}

MESSAGE="Drop unneeded dh --parallel parameter"
