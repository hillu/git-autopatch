DETECT() {
    grep -q '^Vcs-.*: .*\(anonscm\|git\).debian.org' debian/control
}

PATCH() {
    sed -i \
        -e 's,git://anonscm.debian.org/collab-maint/,https://salsa.debian.org/debian/,' \
        -e 's,https\?://anonscm.debian.org/c\?git/collab-maint/,https://salsa.debian.org/debian/,' \
        -e 's,\(git\|https\?\)://git.debian.org/git/collab-maint/,https://salsa.debian.org/debian/,' \
        -e 's,https\?://git.debian.org/?p=collab-maint/,https://salsa.debian.org/debian/,' \
        -e 's,^\(Vcs-Browser: .*\)\.git$,\1,' \
        debian/control
}

MESSAGE="Update Vcs-* headers after migration to salsa.debian.org"
