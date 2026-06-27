{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tmux = {
    pkgs,
    ...
  }: { 
    programs.tmux = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myTmux;
    };
  };
  perSystem = {
    pkgs,
    ...
  }: {
    packages.myTmux = inputs.wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;
      configAfter = ''
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",*:RGB"
        set -g mouse on
        set -g set-clipboard on

        unbind C-b 
        set -g prefix C-a 
        bind-key C-a send-prefix

        unbind %
        bind v split-window -h -c "#{pane_current_path}"
        
        unbind '"'
        bind s split-window -v -c "#{pane_current_path}"
        
        set -g base-index 1
        set -g pane-base-index 1
        set-window-option -g pane-base-index 1
        set-option -g renumber-windows on

        set-window-option -g mode-keys vi 
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangular-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        unbind -T copy-mode-vi MouseDragEnd1Pane

        bind -n M-h select-pane -L 
        bind -n M-j select-pane -D 
        bind -n M-k select-pane -U 
        bind -n M-l select-pane -R 
        bind -n M-x kill-pane

        bind -n M-q display-panes

        bind -n M-1 select-window -t 1  
        bind -n M-2 select-window -t 2        
        bind -n M-3 select-window -t 3        
        bind -n M-4 select-window -t 4        
        bind -n M-5 select-window -t 5        
        bind -n M-6 select-window -t 6        
        bind -n M-7 select-window -t 7        
        bind -n M-8 select-window -t 8        
        bind -n M-9 select-window -t 9        
        bind -n M-c new-window

        bind -n S-Left previous-window
        bind -n S-Right next-window 
      '';
    };
  };
}
