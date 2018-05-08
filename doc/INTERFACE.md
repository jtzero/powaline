## Theme
  variables:
    - POWALINE_ROOT_DIR
    - POWALINE_PLUGIN_DIR
    - POWALINE_LIB_DIR
  endings:
    - _MULTI=1 : runs in background, produces multiple segments
    - _MEMO_NAME="" : name of Memoized variable that gets put in the parent shell `( set -o posix ; set ) | grep 'POWALINE_'`
    - _BG=${some_number} : background_color
    - _FG=${some_number} : forground_color

## Plugins

