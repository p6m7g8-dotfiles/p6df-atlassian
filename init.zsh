# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::atlassian::deps()
#
#>
######################################################################
p6df::modules::atlassian::deps() {
  ModuleDeps=(
    langpingxue/atlassian-skills
  )
}

######################################################################
#<
#
# Function: p6df::modules::atlassian::home::symlinks()
#
#  Environment:	 HOME P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::atlassian::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_DIR/langpingxue/atlassian-skills/atlassian-skills"          "$HOME/.claude/skills/atlassian-skills"
  p6_file_symlink "$P6_DFZ_SRC_DIR/langpingxue/atlassian-skills/atlassian-readonly-skills" "$HOME/.claude/skills/atlassian-readonly-skills"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::atlassian::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE P6_DFZ_PROFILE_ATLASSIAN
#>
######################################################################
p6df::modules::atlassian::prompt::mod() {
  local str=""
  local profile="$P6_DFZ_PROFILE_ATLASSIAN"
  local site="$ATLASSIAN_SITE"
  local email="$ATLASSIAN_EMAIL"
  local token="$ATLASSIAN_API_TOKEN"

  if p6_string_blank_NOT "$profile"; then
    str="atlassian:\t  ${profile}:"
    if p6_string_blank_NOT "$site"; then
      str=$(p6_string_append "$str" "$site" " ")
    fi
    if p6_string_blank_NOT "$email"; then
      str=$(p6_string_append "$str" "$email" "/")
    fi
    if p6_string_blank_NOT "$token"; then
      str=$(p6_string_append "$str" "api" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::atlassian::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export ATLASSIAN_SITE=... ATLASSIAN_EMAIL=... ATLASSIAN_API_TOKEN=...)
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE P6_DFZ_PROFILE_ATLASSIAN
#>
######################################################################
p6df::modules::atlassian::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_ATLASSIAN" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::atlassian::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE P6_DFZ_PROFILE_ATLASSIAN
#>
######################################################################
p6df::modules::atlassian::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_ATLASSIAN

  p6_return_void
}
