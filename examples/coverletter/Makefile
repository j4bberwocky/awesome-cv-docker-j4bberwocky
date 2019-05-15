.PHONY: clean

TEX_CC ?= latexmk -xelatex
BUILD_DIR ?= ./build

coverletter.pdf: coverletter.tex
	$(TEX_CC) -output-directory=$(BUILD_DIR) $<
	cp $(BUILD_DIR)/coverletter.pdf .

clean:
	rm -rf ${BUILD_DIR}
	rm ./coverletter.pdf
