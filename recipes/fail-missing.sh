DETECT() {
    grep -q 'dh_install .*--fail-missing' debian/rules
}

PATCH() {
    sed -i \
        -e '/dh_install .*--fail-missing/ { s/ *--fail-missing//; }' \
        -e '/override_dh_install:/ i\
override_dh_missing:\
	dh_missing --fail-missing\
' \
        debian/rules
}

MESSAGE="Replace dh_install --fail-missing"
