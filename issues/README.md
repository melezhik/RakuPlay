# Rakudo Releases Readiness Tool

Aka R3 Tool (maybe I need to come up with better name? :-)

# Installation

```bash
zef install --/test https://github.com/melezhik/Sparrow6.git 
zef install --/test https://github.com/melezhik/Tomtit.git
zef install --/test https://github.com/melezhik/Tomty.git
s6 --repo-init ~/repo
s6 --index-update
```

# Usage

```bash
git clone https://github.com/melezhik/RakuPlay
cd RakuPlay/issues
```

```bash
tomty --color --all --show-failed
```

# Tests groups

One can run various test groups

Examples:

Certain issue:

```bash
tomty --color 4369
```
Only open, unfixed issues:

```bash
tomty --only=open --color --show-failed
```

Only old fixed issues:

```bash
tomty --only=regression --color --show-failed
```

To see available groups, say:

```
tom tags
```

# Author

Alexey Melezhik

# See also

Following tools are used to run tests:

* Tomty
* Tomtit
* Sparrow
