DETECT() {
    std=$(sed -ne '/^Standards-Version: /{s/^.*:  *//; s/\.//g; p; }' debian/control)
    test "$std" -lt 430
}

PATCH() {
    sed -i -e 's/Standards-Version: .*/Standards-Version: 4.3.0/' debian/control
}

MESSAGE="Bump Standards-Version"
