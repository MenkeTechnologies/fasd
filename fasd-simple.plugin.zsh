if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
else
  PATH="$PATH:${0:h}/bin"
  export PATH
  rehash
  fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
  fasd --init auto >| "$fasd_cache"
  source "$fasd_cache"
  unset fasd_cache
fi
