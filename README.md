# gh-workflows

## Main release

Procedure:
- run workflow on `main` branch
- it will create a new release using `semantic-release`
- it will create a new OCI image with `x.y.z`, `x.y`, `x` and `latest` tags

```sh
# run workflow
$ gh workflow run --ref main
```

## Minor patch

Procedure:
- create a new branch names `v1.0.x` from last `v1.0.*` tag
- perform all necessary changes
- run workflow on `v1.0.x` branch
- it will create a new release using `semantic-release`
- it will create a new OCI image with `x.y.z`, `x.y` tags

```sh
# get last 1.0 tag
$ git tag | sort -V | grep -F v1.0. | tail -1
v1.0.0

# create new branch from existing tag
$ gh repo clone gh-workflows -- 1.0.x
Cloning into '1.0.x'...
$ cd 1.0.x
$ git checkout v1.0.0 -b 1.0.x
Switched to a new branch 'v1.0.x'
$ git push --set-upstream origin 1.0.x
Branch '1.0.x' set up to track remote branch '1.0.x' from 'origin'.

# retrieve workflows and/or .releaserc from main branch
$ rsync -aic ../.github/ .github/ --delete
$ rsync -aic ../.releaserc .
$ git add .github/ .releaserc 

# perform changes, like updating Dockerfile, ...
$ cp ../Dockerfile .
...

# run workflow
$ gh workflow run --ref 1.0.x
```

## Major match

Procedure:
- create a new branch names `v1.x` from last `v1.*.*` tag
- perform all necessary changes
- run workflow on `v1.x` branch
- it will create a new release using `semantic-release`
- it will create a new OCI image with `x.y.z`, `x.y` and `x` tags

```sh
# get last 1.0 tag
$ git tag | sort -V | grep -F v1. | tail -1
v1.0.0

# create new branch from existing tag
$ gh repo clone gh-workflows -- 1.x
Cloning into '1.x'...
$ cd 1.x
$ git checkout v1.0.0 -b 1.x
Switched to a new branch 'v1.0.x'
$ git push --set-upstream origin 1.0.x
Branch '1.0.x' set up to track remote branch '1.0.x' from 'origin'.

# retrieve workflows and/or .releaserc from main branch
$ rsync -aic ../.github/ .github/ --delete
$ rsync -aic ../.releaserc .
$ git add .github/ .releaserc 

# perform changes, like updating Dockerfile, ...
$ cp ../Dockerfile .
...

# run workflow
$ gh workflow run --ref 1.0.x
```

# RC release

Procedure:
- 
