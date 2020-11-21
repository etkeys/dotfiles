# About chaning submodules references

If you need the change the repo url or branch of a submodule, the method to do
so depends on what version of `git` you have.

## Prior to 2.25.0

```sh
# To change the repo url
git config -f .gitmodules submodule.$name.url <new_url>

# To change the branch
git config -f .gitmodules submodule.$name.branch <desired_branch>

# After making any changes
git submodule sync [path/to/submodule]
git submodule update --init -recursive --remote [path/to/submodule]

# if [path/to/submodule] is omitted, then all active submodules are
# processed.
```
