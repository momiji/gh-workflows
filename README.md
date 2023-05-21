# gh-workflows

## Main release

Procedure:
- run workflow on `main` branch
- it will create a new release using `semantic-release`
- it will create a new OCI image with `x.y.z`, `x.y`, `x` and `latest` tags

```sh
$ gh workflow run
```

## Minor patch

Procedure:
- create a new branch names `v1.0.x` from last `v1.0.*` tag
- perform all necessary changes
- run workflow on `v1.0.x` branch
- it will create a new release using `semantic-release`
- it will create a new OCI image with `x.y.z`, `x.y` tags

## Major match

Procedure:
- create a new branch names `v1.x` from last `v1.*.*` tag
- perform all necessary changes
- run workflow on `v1.x` branch
- it will create a new release using `semantic-release`
- it will create a new OCI image with `x.y.z`, `x.y` and `x` tags

# RC release

Procedure:
- 
