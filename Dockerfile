FROM debian:stretch-slim

RUN apt-get update

#
# Set up TeX Live with dependencies.
#

RUN apt-get install --quiet --assume-yes wget build-essential fontconfig

# Get the TeX Live installer and extract to /install-tl/.
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    mkdir /install-tl && \
    tar --extract --file=./install-tl-unx.tar.gz --strip-components=1 \ 
      --directory=./install-tl && \
    rm install-tl-unx.tar.gz

# Set install configuration for fixed path and basic scheme.
RUN echo "selected_scheme scheme-basic" >> /install-tl/basic.profile && \
    echo "TEXDIR /usr/local/texlive/installed" >> /install-tl/basic.profile

# Install TeX Live.
RUN /install-tl/install-tl -profile /install-tl/basic.profile && \
    rm --recursive --force /install-tl
ENV PATH "/usr/local/texlive/installed/bin/x86_64-linux:${PATH}"
#ENV PATH "/usr/local/texlive/bin/x86_64-linux:${PATH}"
#ENV PATH=/usr/local/texlive/bin/x86_64-linuxmusl:$PATH
#ENV PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH


# Install additional TeX Live dependencies.
#COPY ./tl-deps .
#RUN tlmgr install $(cat tl-deps) && \
#   rm tl-deps
RUN tlmgr update --self && \
    tlmgr install \
    latexmk \
    collection-xetex \
    enumitem \
    environ \
    etoolbox \
    everysel \
    filehook \
    fontspec \
    ifmtarg \
    lm \
    lm-math \
    ms \
    parskip \
    pgf \
    ragged2e \
    setspace \
    sourcesanspro \
    tcolorbox \
    trimspaces \
    unicode-math \
    xcolor \
    xifthen \
    xkeyval \
    zapfding 

#
# Set up Awesome-CV.
#

# Make .cls and .sty locally available.
COPY ./awesome-cv /awesome-cv
RUN mkdir --parents "$(kpsewhich -var-value=TEXMFHOME)/tex/latex/local" && \
    cp --target-directory="$(kpsewhich -var-value=TEXMFHOME)/tex/latex/local" \
      awesome-cv/awesome-cv.cls awesome-cv/fontawesome.sty && \
    rm --recursive --force /awesome-cv

# Install fonts
COPY ./fonts /fonts
RUN mkdir /usr/share/fonts/truetype/Awesome-CV && \
    cp /fonts/*.ttf /usr/share/fonts/truetype/Awesome-CV && \
    fc-cache --force --verbose && \
    rm --recursive --force /fonts
