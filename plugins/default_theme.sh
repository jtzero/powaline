# root names that generate the segments
GENERATORS=("GIT_SEGMENTS" "CWD_SEGMENTS" "LANGS_SEGMENTS" "NUMBER_OF_JOBS_SEGMENT" "USERNAME_SEGMENT" "TERMINATOR_SEGMENT")

NEWLINE_SEGMENT="${RESET}\n"
NEWLINE_SEGMENT_BG="${RESET_BG}"

####
LANGS_SEGMENTS_PATH="${POWALINE_LIB_DIR}/langs_segments"
LANGS_SEGMENTS_MEMO_NAME="POWALINE_LANGS_SEGMENTS_MEMO"
LANGS_SEGMENTS_MULTI=1
##

RUBY_SEGMENT_BG=1
RUBY_SEGMENT_FG=15
RUBY_SEGMENT_SYMBOL="$(echo -e '\U0001F48E')"
RUBY_SEGMENT_MEMO_NAME="${LANGS_SEGMENTS_MEMO_NAME}"

NODEJS_SEGMENT_BG=70
NODEJS_SEGMENT_FG=15
NODEJS_SEGMENT_SYMBOL="$(echo -e '\u2b21')"
NODEJS_SEGMENT_MEMO_NAME="${LANGS_SEGMENTS_MEMO_NAME}"

PYTHON_SEGMENT_BG=35
PYTHON_SEGMENT_FG=00
PYTHON_SEGMENT_SYMBOL="$(echo -e '\U0001F40D')"
PYTHON_SEGMENT_MEMO_NAME="${LANGS_SEGMENTS_MEMO_NAME}"

ELIXIR_SEGMENT_BG=5
ELIXIR_SEGMENT_FG=15
ELIXIR_SEGMENT_SYMBOL="$(echo -e '\U0001F4A7')"
ELIXIR_SEGMENT_MEMO_NAME="${LANGS_SEGMENTS_MEMO_NAME}"

####
GIT_SEGMENTS_PATH="${POWALINE_LIB_DIR}/git_segments"
GIT_SEGMENTS_MULTI=1
GIT_SEGMENTS_MEMO_NAME="POWALINE_GIT_STATUS_MEMO"
##

GIT_BRANCH_SEGMENT_MEMO_NAME="POWALINE_GIT_BRANCH_SEGMENT_BG_MEMO"
GIT_BRANCH_SEGMENT_CLEAN_BG=148  # a light green color
GIT_BRANCH_SEGMENT_CLEAN_FG=0  # black
GIT_BRANCH_SEGMENT_DIRTY_BG=161  # pink/red
GIT_BRANCH_SEGMENT_DIRTY_FG=15  # white

GIT_BEHIND_SEGMENT_SYMBOL="$(echo -e '\u2b07')"
GIT_BEHIND_SEGMENT_BG=240
GIT_BEHIND_SEGMENT_FG=250
GIT_BEHIND_SEGMENT_MEMO_NAME="${GIT_SEGMENTS_MEMO_NAME}"

GIT_BRANCH_SEGMENT_DETACHED_SYMBOL="$(echo -e '\u2693')"

GIT_AHEAD_SEGMENT_SYMBOL="$(echo -e '\u2b06')"
GIT_AHEAD_SEGMENT_BG=240
GIT_AHEAD_SEGMENT_FG=250
GIT_AHEAD_SEGMENT_MEMO_NAME="${GIT_SEGMENTS_MEMO_NAME}"

GIT_CONFLICTED_SEGMENT_SYMBOL="$(echo -e '\u273c')"
GIT_CONFLICTED_SEGMENT_BG=9
GIT_CONFLICTED_SEGMENT_FG=15
GIT_CONFLICTED_SEGMENT_MEMO_NAME="${GIT_SEGMENTS_MEMO_NAME}"

GIT_STAGED_SEGMENT_SYMBOL="$(echo -e '\u2714')"
GIT_STAGED_SEGMENT_PATH="${GIT_SEGMENTS}"
GIT_STAGED_SEGMENT_BG=22
GIT_STAGED_SEGMENT_FG=15
GIT_STAGED_SEGMENT_MEMO_NAME="${GIT_SEGMENTS_MEMO_NAME}"

GIT_MODIFIED_SEGMENT_SYMBOL="$(echo -e '\u270e')"
GIT_MODIFIED_SEGMENT_PATH="${GIT_SEGMENTS}"
GIT_MODIFIED_SEGMENT_BG=130
GIT_MODIFIED_SEGMENT_FG=15
GIT_MODIFIED_SEGMENT_MEMO_NAME="${GIT_SEGMENTS_MEMO_NAME}"

GIT_UNTRACKED_SEGMENT_SYMBOL="$(echo -e '\u2753')"
GIT_UNTRACKED_SEGMENT_BG=52
GIT_UNTRACKED_SEGMENT_FG=15
GIT_UNTRACKED_SEGMENT_MEMO_NAME="${GIT_SEGMENTS_MEMO_NAME}"

####
GIT_STASH_SEGMENT_PATH="${POWALINE_LIB_DIR}/git_stash_segment"
##

GIT_STASH_SEGMENT_BG=230
GIT_STASH_SEGMENT_FG=203

####
USERNAME_SEGMENT_PATH="${POWALINE_LIB_DIR}/username_segment"
##

USERNAME_ROOT_SEGMENT_BG=124
USERNAME_ROOT_SEGMENT_FG=250

USERNAME_NON_ROOT_SEGMENT_BG=240
USERNAME_NON_ROOT_SEGMENT_FG=250

####
CWD_SEGMENTS_PATH="${POWALINE_LIB_DIR}/cwd_segments"
CWD_SEGMENTS_MULTI=1
CWD_SEGMENTS_MEMO_NAME="POWALINE_CWD_MEMO"
##

CWD_HOSTNAME_SEGMENT_BG=238
CWD_HOSTNAME_SEGMENT_FG=250
CWD_HOSTNAME_SEGMENT_MEMO_NAME="${CWD_SEGMENTS_MEMO_NAME}"

CWD_HOME_SEGMENT_BG=31  # blueish
CWD_HOME_SEGMENT_FG=15  # white
CWD_HOME_SEGMENT_MEMO_NAME="${CWD_SEGMENTS_MEMO_NAME}"

CWD_PATH_SEGMENT_BG=237  # dark grey
CWD_PATH_SEGMENT_FG=250  # light grey
CWD_PATH_SEPERATOR_FG=244
CWD_PATH_SEPERATOR="${THIN_SEPERATOR}"
CWD_PATH_SEGMENT_MEMO_NAME="${CWD_SEGMENTS_MEMO_NAME}"

CWD_READ_ONLY_SEGMENT_BG=124
CWD_READ_ONLY_SEGMENT_FG=254
CWD_READ_ONLY_SEGMENT_MEMO_NAME="${CWD_SEGMENTS_MEMO_NAME}"

####
NUMBER_OF_JOBS_SEGMENT_PATH="${POWALINE_LIB_DIR}/number_of_jobs_segment"
##
NUMBER_OF_JOBS_SEGMENT_FG=39
NUMBER_OF_JOBS_SEGMENT_BG=238

####
TIME_SEGMENT_PATH="${POWALINE_LIB_DIR}/time_segment"

TIME_SEGMENT_FG=148
TIME_SEGMENT_BG=0

####
TERMINATOR_SEGMENT_PATH="${POWALINE_LIB_DIR}/terminator_segment"
##
TERMINATOR_SEGMENT_BG=236
TERMINATOR_SEGMENT_FG=15
TERMINATOR_SEGMENT_BODY='$'

##
END_BG="${RESET_BG}"

LOCK="$(echo -e '\U1F512')"
NETWORK="$(echo -e '\U1F50C')"
SEPERATOR="$(echo -e '\u2b80')"
THIN_SEPERATOR="$(echo -e '\u276f')"

# TODO create new theme for patched fonts
# switch to https://nerdfonts.com/
#PATCHED
#LOCK="$(echo -e '\ue0a2')"
#NETWORK="$(echo -e '\U1F50C')"
#SEPERATOR="$(echo -e '\ue0b0')"
#THIN_SEPERATOR="$(echo -e '\ue0b1')"
#GIT_BRANCH_SEGMENT_SYMBOL="$(echo -e '\ue0a0')"

#nerd font
#LOCK="$(echo -e '\uf023')"
#NETWORK="$(echo -e '\uf98c')"
#PYTHON_SEGMENT_SYMBOL="$(echo -e '\ue235')"
#NODEJS_SEGMENT_SYMBOL="$(echo -e '\uf898')"
#ELIXIR_SEGMENT_SYMBOL="$(echo -e '\ue62d')"
#RUBY_SEGMENT_SYMBOL="$(echo -e '\ue791')"
#GIT_BRANCH_SEGMENT_SYMBOL="$(echo -e '\ue0a0')"
#SEPERATOR="$(echo -e '\ue0b0')"
#THIN_SEPERATOR="$(echo -e '\ue0b1')"

##
config=("RUBY_SEGMENT" "NODEJS_SEGMENT" "ELIXIR_SEGMENT" "PYTHON_SEGMENT" "NEWLINE_SEGMENT" "USERNAME_SEGMENT" "CWD_HOSTNAME_SEGMENT" "CWD_HOME_SEGMENT" "CWD_PATH_SEGMENT" "CWD_READ_ONLY_SEGMENT" "GIT_BRANCH_SEGMENT" "GIT_BEHIND_SEGMENT" "GIT_AHEAD_SEGMENT" "GIT_CONFLICTED_SEGMENT" "GIT_STAGED_SEGMENT" "GIT_MODIFIED_SEGMENT" "GIT_UNTRACKED_SEGMENT" "NUMBER_OF_JOBS_SEGMENT" "TERMINATOR_SEGMENT")
