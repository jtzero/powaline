


should be true:
* ALL CAPS NAMESPACED: global, namespaced and put into parent shell
* ALL CAPS: global const
* ALL CAPS _SEGMENT: not a constant, just a the body of the segment
* PascalCase: state variable
* snake_case: local

if stmnts are woefully inconsistent

all variables that get put in the Parent Shell start with "POWALINE_"
to view them `( set -o posix ; set ) | grep 'POWALINE_'`
