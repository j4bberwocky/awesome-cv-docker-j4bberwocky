## Awesome-CV-docker
Awesome-CV-docker presents a container that allows you to compile your Awesome-CV-based documents without the need to install
LaTeX packages and other dependencies.

Please visit [posquit0/Awesome-CV](https://github.com/posquit0/Awesome-CV) for information about Awesome-CV.

## Prerequisites
1. Docker

## Usage
1. Build the image: ```docker build --tag awesome-cv .```
2. Run the container in your document directory: ```cd path/to/my_resume && docker run -v `pwd`:/src awesome-cv /bin/bash -c "cd /src; xelatex my_resume.tex"```
3. Find ```my_resume.pdf``` in your document directory.

## Troubleshooting
* **Fonts.** The original package depends on the ```awesome-cv.cls``` and ```fontawesome.sty``` files and the ```fonts/``` subdirectory residing
in the same location as the document, but these are locally installed as part of building the Docker image, so you should be able
to remove all of these from your document directory. However, you will then need to ensure that references to ```fonts/```
(typically defined through the ```fontdir``` variable in both your document and ```awesome-cv.cls```) are subsequently removed. 
