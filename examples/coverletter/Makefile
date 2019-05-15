.PHONY: clean

TEX_CC ?= xelatex
BUILD_DIR ?= ./build

coverletter.pdf: coverletter.tex
	mkdir $(BUILD_DIR)
	$(TEX_CC) -output-directory=$(BUILD_DIR) $<
	cp $(BUILD_DIR)/coverletter.pdf .

clean:
	rm -rf ${BUILD_DIR}
	rm ./coverletter.pdf
