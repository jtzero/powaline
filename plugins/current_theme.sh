current_theme=1

if [[ ! -v POWALINE_PLUGIN_DIR ]]; then
  POWALINE_PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi


if [ -z "${DEFAULT_THEME}" ]; then
  source "${POWALINE_PLUGIN_DIR}/default_theme.sh"

  source "${POWALINE_PLUGIN_DIR}/${DEFAULT_THEME}"
fi
