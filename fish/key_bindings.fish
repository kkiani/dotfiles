bind -M insert \e\[B 'cd $(env XPLR_MODE=NAV xplr); commandline -f repaint'
bind -M insert \cU 'cd ..; commandline -f repaint'
