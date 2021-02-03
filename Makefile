#
# Run `make` in the current directory to see targets of interest
#

about:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: about

lint: ## Lint templates
	@echo 'CloudFormation Lint Checks'
	@cfn-lint templates/*.yaml
	@echo 'CFN_NAG Checks'
	@docker run --rm \
    		-v $(PWD)/templates:/templates \
    		--entrypoint cfn_nag_scan \
    		stelligent/cfn_nag:latest \
    		--fail-on-warnings \
    		--allow-suppression \
    		--print-suppression \
    		--input-path='/templates' \
    		--output-format=txt
	@echo 'YAML Lint Checks'
	@yamllint templates
.PHONY: lint
