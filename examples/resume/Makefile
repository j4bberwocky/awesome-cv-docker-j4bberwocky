.PHONY: clean

TEX_CC ?= latexmk -xelatex
BUILD_DIR ?= ./build

resume.pdf: resume.tex $(shell find ./sections -name *.tex)
	$(TEX_CC) -output-directory=$(BUILD_DIR) $<
	cp $(BUILD_DIR)/resume.pdf .

clean:
	rm -rf ${BUILD_DIR}
	rm ./resume.pdf
