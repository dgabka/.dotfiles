if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR hx

set -U fish_color_autosuggestion      cyan
set -U fish_color_cancel              -r
set -U fish_color_command             brmagenta
set -U fish_color_comment             cyan
set -U fish_color_cwd                 blue
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               red
set -U fish_color_escape              cyan
set -U fish_color_history_current     --bold
set -U fish_color_host                blue
set -U fish_color_match               --background=lue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               bryellow
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brmagenta
set -U fish_color_valid_path          green
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'

starship init fish | source