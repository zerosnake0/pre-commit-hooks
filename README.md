[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

# pre-commit-hooks

A collection of [pre-commit](https://pre-commit.com) hooks

## Example

in `.pre-commit-config.yaml`

```yaml
repos:
  - repo: https://github.com/zerosnake0/pre-commit-hooks
    rev: v0.0.2
    hooks:
      - id: gofmt
      - id: goimports
      - id: go-vet
      - id: go-mod-tidy
```

## References

- https://pre-commit.com
- https://github.com/pre-commit/pre-commit
