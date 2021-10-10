[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

# pre-commit-hooks

A collection of [pre-commit](https://pre-commit.com) hooks

## Hooks

---

### gofmt

format `.go` files

> except vendor and protobuf generated `.pb.go` files

---

### goimports

format `.go` file imports

> except vendor and protobuf generated `.pb.go` files

---

### go-vet

run `go vet` for `.go` files

---

### go-mod-tidy

run `go mod tidy`

### thriftfmt

format `.thrift` idl files

---

### prototool

use `github.com/uber/prototool` to lint and format `.proto` files

---

## Example

in `.pre-commit-config.yaml`

```yaml
repos:
  - repo: https://github.com/zerosnake0/pre-commit-hooks
    rev: v0.0.9
    hooks:
      - id: gofmt
      - id: goimports
      - id: go-vet
      - id: go-mod-tidy
```

## References

- https://pre-commit.com
- https://github.com/pre-commit/pre-commit
