# `chruby reload` to reload chruby's installed rubies
# `chruby install X.Y` to invoke `ruby-install ruby X.Y`

function reload_chruby {
  # base chruby function, aliased to original_chruby
  if [[ -f "$BREW_PREFIX/opt/chruby/share/chruby/chruby.sh" ]]; then
    source "$BREW_PREFIX/opt/chruby/share/chruby/chruby.sh"
    eval "original_$(declare -f chruby)"

    # chruby wrapper that includes reloading available rubies
    function chruby {
      if [[ $1 == "reload" ]]; then
        reload_chruby
      elif [[ $1 == "install" ]]; then
        ruby-install --cleanup --no-reinstall ruby "$2"
        reload_chruby
      else
        original_chruby "$@"
      fi
    }

  fi
}

reload_chruby

# chruby .ruby-version support
if [[ -f "$BREW_PREFIX/opt/chruby/share/chruby/auto.sh" ]]; then
  source "$BREW_PREFIX/opt/chruby/share/chruby/auto.sh"
fi
