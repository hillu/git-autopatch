# Autopatch script for git repositories

Maintaining many structurally similar Debian packages means that
almost identical changes can be mechanically applied to many packages.
Those changes usually cannot be expressed in diff files but don't
require thinking about them individually. Thes include, but are not
limited to, bumping the Debhelper compat level and updating the
Standards-Version.

This script allows automating such tasks using simple recipes. Each
recipe is a shell script snippet that  defines three things:

- a `DETECT` function for determining if a patch needs to be applied,
- a `PATCH` function for applying the actual patch,
- `MESSAGE`, the commit message. 

If the `DETECT` function returns a non-zero value, the patch is
skipped. If the `PATCH` function returns a non-zero value, any chacnge
that may have been made is rolled back using `git checkout -f`,
otherwise the changes are committed using `git commit -a`.

Example `recipes/dh.sh`:
```
DETECT() {
    test $(cat debian/compat) != 11
}

PATCH() {
    echo 11 > debian/compat
    sed -i -e 's/debhelper\( *(.*)\)\?/debhelper (>= 11)/' debian/control
}

MESSAGE="Bump Debhelper compat level"
```
