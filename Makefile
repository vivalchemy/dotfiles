INVENTORY=inventory.yaml
PLAYBOOK=main.yaml

EXTRA_VARS="configure=true update=true"
TAGS=""

.PHONY: help install run tags clean debug

help:
	@echo "Available commands:"
	@echo "  make install        - Install Ansible dependencies (ansible-galaxy)."
	@echo "  make run            - Run the playbook with default options."
	@echo "  make tags=<tags>    - Run with specific tags, e.g., make tags='cli,gui'"
	@echo "  make clean          - Remove generated files or temporary state."
	@echo "  make debug          - Run with debug mode (verbose output)."

install:
	@echo "🔧 Installing Ansible roles from requirements.yaml"
	ansible-galaxy install -r requirements.yaml

run:
	@echo "🚀 Running full playbook with default options"
	ansible-playbook $(PLAYBOOK) --inventory $(INVENTORY) --ask-become-pass --extra-vars $(EXTRA_VARS)

tags:
	@echo "🏷️  Running playbook with tags: $(TAGS)"
	ansible-playbook $(PLAYBOOK) --inventory $(INVENTORY) --ask-become-pass --extra-vars $(EXTRA_VARS) --tags "$(TAGS)"

update:
	@echo "🔄 Running playbook with update=true"
	ansible-playbook $(PLAYBOOK) --inventory $(INVENTORY) --ask-become-pass --extra-vars update=true

configure:
	@echo "🔄 Running playbook with configure=true"
	ansible-playbook $(PLAYBOOK) --inventory $(INVENTORY) --ask-become-pass --extra-vars configure=true

debug:
	@echo "🐞 Running in debug mode with extra verbosity and debug=true"
	ansible-playbook $(PLAYBOOK) --inventory $(INVENTORY) --ask-become-pass -vvvv --extra-vars '$(EXTRA_VARS) debug=true'
