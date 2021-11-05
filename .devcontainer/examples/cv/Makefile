.PHONY: clean

TEX_CC ?= xelatex
BUILD_DIR ?= ./build

cv.pdf: cv.tex $(shell find ./sections -name *.tex)
	mkdir $(BUILD_DIR)
	$(TEX_CC) -output-directory=$(BUILD_DIR) $<
	cp $(BUILD_DIR)/cv.pdf .

clean:
	rm -rf ${BUILD_DIR}
	rm ./cv.pdf
