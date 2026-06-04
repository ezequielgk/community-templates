#!/usr/bin/env bash
set -euo pipefail

config_dir="${XDG_CACHE_HOME:-$HOME/.config}"

if [[ ! -f "$config_dir/snappy-switcher/config.ini" ]]; then
snappy-install-config;
fi

sed 's/name = snappy-slate.ini/name = noctalia.ini/' --in-place "$config_dir/snappy-switcher/config.ini"

snappy-switcher quit
snappy-switcher --daemon & disown
echo done!
