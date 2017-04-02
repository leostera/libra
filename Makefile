.PHONY: test clean install

PACKAGE = Libra.ipkg
IDRIS = idris

all: install

repl:
	$(IDRIS) -p lightyear -p TAP Libra.idr

install: build
	@$(IDRIS) --install $(PACKAGE)

test: build
	@$(IDRIS) --testpkg $(PACKAGE)

build: Libra/*.idr Test/*.idr
	@$(IDRIS) --build $(PACKAGE)

clean:
	@$(IDRIS) --clean $(PACKAGE)
