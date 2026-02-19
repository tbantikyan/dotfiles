# Load necessary modules for git information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format git output to match your OMP template: git:branch
zstyle ':vcs_info:git:*' formats ' %F{214}git:%F{177}%b%f'
zstyle ':vcs_info:*' enable git

# Define colors based on your JSON hex codes
# #f01a1a -> Red (196)
# #2462f2 -> Blue (27)
# #b072f7 -> Purple (135)
# #DCB977 -> Tan/Gold (179)
# #ff9500 -> Orange (214)

PROMPT='%F{196}%n@%m%f '                   # username@hostname (Red)
PROMPT+='%F{27}%~%f'                       # Path (Blue)
PROMPT+='${vcs_info_msg_0_}'               # Git info
PROMPT+='%(?.. %F{179}ERROR%f)'            # Status: Shows ERROR if last command failed
PROMPT+=$'\n%F{196}❯%f '                   # Newline and Prompt Char (Red)
