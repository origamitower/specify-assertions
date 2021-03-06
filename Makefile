bin        = $(shell npm bin)
lsc        = $(bin)/lsc
browserify = $(bin)/browserify
jsdoc      = $(bin)/jsdoc
sjs        = $(bin)/sjs
uglify     = $(bin)/uglifyjs
VERSION    = $(shell node -e 'console.log(require("./package.json").version)')

TEST_DIR = test/specs-src
TEST_BLD = test/specs
TEST_SRC = $(wildcard $(TEST_DIR)/*.sjs)
TEST_TGT = ${TEST_SRC:$(TEST_DIR)/%.sjs=$(TEST_BLD)/%.js}
BUNDLE   = alright

$(TEST_BLD)/%.js: $(TEST_DIR)/%.sjs
	mkdir -p $(dir $@)
	$(sjs) --readable-names           \
	       --module ./macros          \
	       --module ./macros/promises \
	       --output $@                \
	       $<

dist:
	mkdir -p dist

dist/$(BUNDLE).umd.js: dist
	$(browserify) lib/index.js --standalone $(BUNDLE) > $@

dist/$(BUNDLE).umd.min.js: dist/$(BUNDLE).umd.js
	$(uglify) --mangle - < $^ > $@

# ----------------------------------------------------------------------
bundle: dist/$(BUNDLE).umd.js

minify: dist/$(BUNDLE).umd.min.js

documentation:
	$(jsdoc) --configure jsdoc.conf.json
	ABSPATH=$(shell cd "$(dirname "$0")"; pwd) $(MAKE) clean-docs

clean-docs:
	perl -pi -e "s?$$ABSPATH/??g" ./docs/api/*.html

clean:
	rm -rf dist build $(TEST_TGT)

test: $(TEST_TGT)
	node test/tap

package: documentation bundle minify
	mkdir -p dist/$(BUNDLE)-$(VERSION)
	cp -r docs dist/$(BUNDLE)-$(VERSION)
	cp -r lib dist/$(BUNDLE)-$(VERSION)
	cp dist/*.js dist/$(BUNDLE)-$(VERSION)
	cp package.json dist/$(BUNDLE)-$(VERSION)
	cp README.md dist/$(BUNDLE)-$(VERSION)
	cp LICENCE dist/$(BUNDLE)-$(VERSION)
	cd dist && tar -czf $(BUNDLE)-$(VERSION).tar.gz $(BUNDLE)-$(VERSION)

publish: clean
	npm install
	npm publish

.PHONY: test publish package clean documentation
