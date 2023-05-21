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
$ BR=1.0
$ TAG=$( git tag | sort -V | grep -F v$BR. | tail -1 )
$ echo $TAG
v1.0.0

# create new branch from existing tag
$ gh repo clone gh-workflows -- $BR.x
Cloning into '1.0.x'...
$ cd $BR.x
$ git checkout $TAG -b $BR.x
Switched to a new branch 'v1.0.x'
$ git push --set-upstream origin $BR.x
Branch '1.0.x' set up to track remote branch '1.0.x' from 'origin'.

# retrieve workflows and/or .releaserc from main branch
$ rsync -aic ../.github/ .github/ --delete
$ rsync -aic ../.releaserc .
$ git add .github/ .releaserc 

# perform changes, like updating Dockerfile, ...
$ cp ../Dockerfile .
...

# run workflow
$ gh workflow run --ref $( git branch --show-current )
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
$ BR=1
$ TAG=$( git tag | sort -V | grep -F v$BR. | tail -1 )
$ echo $TAG
v1.3.0

# create new branch from existing tag
$ gh repo clone gh-workflows -- $BR.x
Cloning into '1.x'...
$ cd $BR.x
$ git checkout $TAG -b $BR.x
Switched to a new branch 'v1.x'
$ git push --set-upstream origin $BR.x
Branch '1.x' set up to track remote branch '1.x' from 'origin'.

# retrieve workflows and/or .releaserc from main branch
$ rsync -aic ../.github/ .github/ --delete
$ rsync -aic ../.releaserc .
$ git add .github/ .releaserc 

# perform changes, like updating Dockerfile, ...
$ cp ../Dockerfile .
...

# run workflow
$ gh workflow run --ref $( git branch --show-current )
```

# RC release

Procedure:
- 

$ gh repo clone gh-workflows -- beta
$ git checkout main -b beta
Switched to a new branch 'beta'
$ git push --set-upstream origin beta
Branch 'beta' set up to track remote branch 'beta' from 'origin'.
