# =================================================================
#
# Work of the U.S. Department of Defense, Defense Digital Service.
# Released as open source under the MIT License.  See LICENSE file.
#
# =================================================================

.PHONY: help
help:  ## Print the help documentation
	@grep -E '^[\/a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#
# Terraform
#

.PHONY: format_terraform
format_terraform: ## Format terraform files
	bash scripts/format-terraform

.PHONY: update_docs
update_docs: ## Update docs
	bash scripts/update-docs

#
# Go building, formatting, testing, and installing
#

fmt:  ## Format Go source code
	go fmt $$(go list ./... )

.PHONY: imports
imports: bin/goimports ## Update imports in Go source code
	bin/goimports -w -local github.com/dod-iac $$(find . -iname '*.go')

.PHONY: lint_go
lint_go: bin/errcheck bin/ineffassign bin/staticcheck bin/shadow ## Run Go tests
	bash scripts/lint-go 2>&1

vet: ## Vet Go source code
	go vet $$(go list ./...)

tidy: ## Tidy Go source code
	go mod tidy

#
# Terratest
#

.PHONY: terratest
terratest: ## Run terratest tests
	bash scripts/terratest

#
# Command line Programs
#

bin/errcheck: ## Make go binary errcheck
	go build -o bin/errcheck github.com/kisielk/errcheck

bin/goimports: ## Make go binary goimports
	go build -o bin/goimports golang.org/x/tools/cmd/goimports

bin/ineffassign: ## Make go binary ineffassign
	go build -o bin/ineffassign github.com/gordonklaus/ineffassign

bin/staticcheck: ## Make go binary staticcheck
	go build -o bin/staticcheck honnef.co/go/tools/cmd/staticcheck

bin/shadow: ## Make go binary shadow
	go build -o bin/shadow golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow

.PHONY: tools ## Install all binary tools
tools: bin/errcheck bin/goimports bin/ineffassign bin/staticcheck bin/shadow

## Clean

clean:  ## Clean artifacts
	rm -fr bin
