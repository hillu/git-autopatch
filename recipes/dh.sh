DETECT() {
    test $(cat debian/compat) != 11
}

PATCH() {
    echo 11 > debian/compat
    sed -i -e 's/debhelper\( *(.*)\)\?/debhelper (>= 11)/' debian/control
}

MESSAGE="Bump Debhelper compat level"
