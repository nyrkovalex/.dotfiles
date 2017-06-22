dconf write /org/gnome/desktop/input-sources/xkb-options "['compose:ralt']" \
  && sudo dnf group install "C Development Tools and Libraries" \
  && sudo dnf install cmake python-devel tmux xclip gimp inkscape nodejs java-1.8.0-openjdk java-1.8.0-openjdk-src gnome-terminal-nautilus liberation-fonts the_silver_searcher ranger

