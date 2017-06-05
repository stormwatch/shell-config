#!/usr/bin/env bash
## ek9/shell-config - https://github.com/ek9/shell-config
## 65-prompt.sh
## bash prompt customization (liquitprompt + ohmygit)

LIQUIDPROMPT_DIR=$HOME/.config/vcsh/repo.d/liquidprompt
OHMYGIT_DIR=$HOME/.config/vcsh/repo.d/oh-my-git

if [[ -f "$LIQUIDPROMPT_DIR/liquidprompt" ]]; then

    if [[ -z $DISPLAY ]]; then
        : ${omg_is_a_git_repo_symbol:='❤'}
        : ${omg_has_untracked_files_symbol:='∿'}
        : ${omg_has_adds_symbol:='+'}
        : ${omg_has_deletions_symbol:='-'}
        : ${omg_has_cached_deletions_symbol:='✖'}
        : ${omg_has_modifications_symbol:='✎'}
        : ${omg_has_cached_modifications_symbol:='☲'}
        : ${omg_ready_to_commit_symbol:='→'}
        : ${omg_is_on_a_tag_symbol:='⌫'}
        : ${omg_needs_to_merge_symbol:='ᄉ'}
        : ${omg_detached_symbol:='^'}
        : ${omg_can_fast_forward_symbol:='^^'}
        : ${omg_has_diverged_symbol:=''}               #   
        : ${omg_not_tracked_branch_symbol:=''}
        : ${omg_rebase_tracking_branch_symbol:=''}     #   
        : ${omg_merge_tracking_branch_symbol:=''}      #  
        : ${omg_should_push_symbol:=' '}                #    
        : ${omg_has_stashes_symbol:=' '}
    fi

    if  [[ -f "$OHMYGIT_DIR/prompt.sh" ]]; then
        source $OHMYGIT_DIR/prompt.sh
    fi

    LP_PS1_POSTFIX="\n$PS1"
    source "$LIQUIDPROMPT_DIR/liquidprompt"
fi

