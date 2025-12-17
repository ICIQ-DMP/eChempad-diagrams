STYLE=includes/style.puml
SRC=$(shell find diagrams -name "*.puml")
OUT=$(SRC:diagrams/%.puml=build/%.svg)

all: $(OUT)

# Render rule, injecting style automatically
build/%.svg: diagrams/%.puml $(STYLE)
	@mkdir -p $(dir $@)
	plantuml -tsvg -I$(STYLE) -o ../build $<

clean:
	rm -rf build
