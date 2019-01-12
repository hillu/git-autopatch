DETECT() {
    test $(cat debian/compat) != 12
}

PATCH() {
    echo 12 > debian/compat
    sed -i -e 's/debhelper\( *(.*)\)\?/debhelper (>= 12)/' debian/control
}

MESSAGE="Bump Debhelper compat level"
