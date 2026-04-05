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
# Function: words atlassian = p6df::modules::atlassian::profile::mod()
#
#  Returns:
#	words - atlassian
#
#  Environment:	 ATLASSIAN_EMAIL ATLASSIAN_ORG_API_KEY ATLASSIAN_ORG_API_KEY_WRITE ATLASSIAN_ORG_ID ATLASSIAN_SITE
#>
######################################################################
p6df::modules::atlassian::profile::mod() {

  p6_return_words 'atlassian' '$ATLASSIAN_SITE' '$ATLASSIAN_EMAIL' '$ATLASSIAN_ORG_ID' '$ATLASSIAN_ORG_API_KEY' '$ATLASSIAN_ORG_API_KEY_WRITE'
}
