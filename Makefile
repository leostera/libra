PACKAGE = Libra.ipkg
IDRIS = idris

all: install

install: build

build: Libra/*.idr
	$(IDRIS) --build $(PACKAGE)

clean:
	$(IDRIS) --clean $(PACKAGE)
