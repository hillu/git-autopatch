DETECT() {
    grep '^Format: *http://dep.debian.net/deps/dep5' debian/copyright
}

PATCH() {
    sed -i \
        -e '/Format: / s,.*$,https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/,' \
        debian/copyright
}

MESSAGE='Update Copyright Format URL'
