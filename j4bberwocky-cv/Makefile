.PHONY: clean

TEX_CC ?= xelatex
BUILD_DIR ?= ./build

resume.pdf: resume.tex $(shell find ./sections -name *.tex)
	mkdir $(BUILD_DIR)
	$(TEX_CC) -output-directory=$(BUILD_DIR) $<
	cp $(BUILD_DIR)/resume.pdf .

clean:
	rm -rf ${BUILD_DIR}
	rm ./resume.pdf
