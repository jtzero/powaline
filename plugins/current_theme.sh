current_theme=1

if [[ ! -v POWALINE_PLUGIN_DIR ]]; then
  POWALINE_PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

source "${POWALINE_PLUGIN_DIR}/default_theme.sh"
