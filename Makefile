fmt:
	terraform fmt

docs:
	terraform-docs md . >io.md

grip:
	grip -b

_quick-commit:
	@echo "enter commit message:"
	@read message && \
		git add . && \
		git commit -m "$$message" && \
		git push