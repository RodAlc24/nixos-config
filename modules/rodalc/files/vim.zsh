# ==============================================================================
# Vi-mode keybindings for zsh
# ==============================================================================
# Sets up vi-mode with:
#   - Emacs muscle-memory preserved (Ctrl+A/E/P/N/R/W/K/U)
#   - H/L for line start/end in normal mode
#   - Smart history search (up/down arrows and j/k in normal mode)
#   - Shift+Tab for forward-word jump
#   - Fast Esc response (10ms instead of default 400ms)
#   - Beam cursor in insert mode, block cursor in normal mode
# ==============================================================================

# ------------------------------------------------------------------------------
# Core vi-mode
# ------------------------------------------------------------------------------

bindkey -v                          # Enable vi key bindings globally

export KEYTIMEOUT=1                 # Esc delay: 10ms (default 400ms feels sluggish)

# Backspace fix: vi-mode breaks backspace past the insert-mode entry point
bindkey -v '^?' backward-delete-char

# ------------------------------------------------------------------------------
# Normal mode (vicmd) — navigation
# ------------------------------------------------------------------------------

bindkey -M vicmd 'H' vi-beginning-of-line   # H  → jump to line start (like 0)
bindkey -M vicmd 'L' vi-end-of-line         # L  → jump to line end   (like $)

# ------------------------------------------------------------------------------
# Insert mode — restore common Emacs/readline bindings that vi-mode removes
# ------------------------------------------------------------------------------

bindkey '^A' beginning-of-line      # Ctrl+A → jump to line start
bindkey '^E' end-of-line            # Ctrl+E → jump to line end
bindkey '^P' up-line-or-history     # Ctrl+P → previous history entry
bindkey '^N' down-line-or-history   # Ctrl+N → next history entry
bindkey '^K' kill-line              # Ctrl+K → delete from cursor to end of line
bindkey '^U' backward-kill-line     # Ctrl+U → delete from cursor to start of line
bindkey '^W' backward-delete-word   # Ctrl+W → delete previous word
bindkey '^R' history-incremental-search-backward  # Ctrl+R → interactive history search

# Shift+Tab → jump forward one word (use Tab for completion as usual)
bindkey '^[[Z' forward-word

# Alt+. → insert last argument of previous command (cycles through history)
bindkey '\e.' insert-last-word

# ------------------------------------------------------------------------------
# History search — prefix-aware (matches what you've already typed)
# ------------------------------------------------------------------------------
# Up/down arrows search history by the prefix already on the command line.
# In normal mode, j/k do the same.

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end  history-search-end

bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end   # Up arrow
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end    # Down arrow

bindkey -M vicmd 'k' history-beginning-search-backward-end        # k in normal mode
bindkey -M vicmd 'j' history-beginning-search-forward-end         # j in normal mode

# ------------------------------------------------------------------------------
# Open current line in $EDITOR (like pressing v in vim's normal mode)
# ------------------------------------------------------------------------------

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line    # v in normal mode → open $EDITOR

# ------------------------------------------------------------------------------
# Cursor shape — beam in insert mode, block in normal mode
# ------------------------------------------------------------------------------
# Escape sequences:
#   \e[2 q  = steady block    (normal mode)
#   \e[6 q  = steady beam     (insert mode)

function zle-keymap-select() {
  case $KEYMAP in
    vicmd)          print -n '\e[2 q' ;;   # normal mode  → block
    vivis|vivli)    print -n '\e[2 q' ;;   # visual mode  → block
    viins|main|*)   print -n '\e[6 q' ;;   # insert mode + fallback → beam
  esac
}
zle -N zle-keymap-select


function zle-line-init() {
  if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
      echoti smkx
  fi
  zle -K viins                            # always start in insert mode
  print -n '\e[6 q'                       # beam cursor on new prompt
}
zle -N zle-line-init

print -n '\e[6 q'                         # beam cursor on shell startup
preexec() { print -n '\e[6 q' }          # beam cursor before each command runs
