DETECT() {
    grep '^\(Format: *http://dep.debian.net/deps/dep5\|Format-Specification: \|Contact: \|Maintainer: \|Upstream-Maintainer: \)' \
         debian/copyright
}

PATCH() {
    sed -i \
        -e 's/^Format-Specification:/Format:/' \
        -e 's/^\(Contact\|Maintainer\|Upstream-Maintainer\):/Upstream-Contact:/' \
        -e 's/^Name:/Upstream-Name:/' \
        -e '/Format: / s,.*$,https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/,' \
        debian/copyright
}

MESSAGE='Update DEP5 copyright file'
