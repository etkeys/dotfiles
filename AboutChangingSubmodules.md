# About chaning submodules references

## A note of warning

If `submodule update` is never passed `--remote`, then submodules will stay at the commits they were at when the super project was committed. Even if the upstream project changes.

## Making the change

If you need the change the repo url or branch of a submodule, no matter what version, the steps are all the same.

```sh
# To change the repo url
git config -f .gitmodules submodule.$name.url <new_url>

# To change the branch
git config -f .gitmodules submodule.$name.branch <desired_branch>

# After making any changes
# Update .git/config
git submodule sync --recursive [path/to/submodule]
# Update local submodule to match remote
git submodule update --init --recursive --remote [path/to/submodule]

# if [path/to/submodule] is omitted, then all active submodules are
# processed.
```


