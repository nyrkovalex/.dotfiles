dconf write /org/gnome/desktop/input-sources/xkb-options "['compose:ralt']" \
  && sudo dnf group install "C Development Tools and Libraries" \
  && sudo dnf install \
    neovim \
    cmake \
    python-devel \
    tmux \
    xclip \
    gimp \
    inkscape \
    nodejs \
    java-1.8.0-openjdk \
    java-1.8.0-openjdk-src \
    gnome-terminal-nautilus \
    liberation-fonts \
    the_silver_searcher \
    ranger \
    postgresql-server \
    postgresql-devel \
    redhat-rpm-config \
    python3-devel

