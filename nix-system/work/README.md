## Setup

### Repositories

Clone gitlab space:

```
glab auth login
glab repo clone -g 7433939 --paginate --preserve-namespace
```

### Node.js

`fnm` is installed for fast switching of node versions without setting devenv for every project.

Installed binaries may be found under: `/Users/dgabka/Library/Caches/fnm_multishells`

To use `fnm` installed node the path needs to be addded to `$PATH`

```
eval $(fnm env)
```
This will setup fnm in the current shell

Or use `useFnm` function added to shell config

