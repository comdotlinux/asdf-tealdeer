#!/usr/bin/env bash
# set -x

export workspace=$(readlink -f $(dirname $0))
export checks_src=/tmp/checks

if [[ ! -d "$checks_src" ]]; then
  mkdir "$checks_src" || exit 1
fi
if [[ "x$1" != "x-keep" ]]; then
  trap "rm -rf $checks_src" EXIT
fi

pushd /tmp >/dev/null || exit 1

if [[ ! -f "${checks_src}/shellcheck" ]]; then
  export scversion="stable"
  curl -sSL https://github.com/koalaman/shellcheck/releases/download/${scversion}/shellcheck-${scversion}.linux.x86_64.tar.xz | tar -xJ
  mv shellcheck-stable/shellcheck "${checks_src}/"
  rm shellcheck-stable -rf
  chmod u+x "${checks_src}/shellcheck"
fi

if [[ ! -f "${checks_src}/shfmt" ]]; then
  curl -sSL --output ${checks_src}/shfmt https://github.com/patrickvane/shfmt/releases/download/master/shfmt_linux_amd64
  chmod u+x ${checks_src}/shfmt
fi

pushd $workspace >/dev/null || exit 1

${checks_src}/shellcheck -x bin/install -P lib/
echo "shell check on install successful"
${checks_src}/shellcheck -x bin/list-all -P lib/
echo "shell check on list-all successful"

${checks_src}/shfmt -d -i 2 -ci $workspace
echo "shfmt on all scripts successful"
