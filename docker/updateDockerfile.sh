#!/usr/bin/env bash
set -Eeuo pipefail
shopt -s nullglob

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"


declare versions=(
    */
)

declare -A portal=(
    [2.1]="4.3.18"
    [3.0]="5.2"
)

declare -A py=(
    [2.1]="python27"
    [3.0]="python38"
)

generated_warning() {
    cat << __EOF__
#
# NOTE: THIS $1 IS GENERATED VIA "updateDockerfile.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
__EOF__
}

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo " "
      echo "[options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help                     mostra uma breve ajuda"
      echo "-v, --versions=x.x.x           versão do portal"
      echo "-p, --python=pythonxx          versão do python, padrão"
      exit 0
      ;;
    -v)
      shift
      if test $# -gt 0; then
        export pkgver=$1
      else
        echo "no package versuon specified"
        exit 1
      fi
      shift
      ;;
    --versions*)
      export pkgver=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    -p)
      shift
      if test $# -gt 0; then
        export pyver=$1
      else
        echo "no Python version specified"
        exit 1
      fi
      shift
      ;;
    --python*)
      export pyver=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    *)
      break
      ;;
  esac
done


if [ -z "${pkgver+x}" ]
then
    for version in "${versions[@]}"; do
        for variant in \
            alpine \
            debian \
        ; do
            echo "$version: $variant"
            dir="$version/$variant"
            variant="$(basename "$variant")"

            [ -d "$dir" ] || continue
    
            tpl_dockerfile="Dockerfile-${variant}.template"
            tpl_dockercompose="docker-compose.yml"
            tpl_sitecfg="site.cfg"
            
            { generated_warning "DOCKERFILE"; cat "$tpl_dockerfile"; } > "$dir/Dockerfile"
            { generated_warning "DOCKER COMPOSE"; cat "$tpl_dockercompose"; } > "$dir/docker-compose.yml"
            { generated_warning "SITE CFG"; cat "$tpl_sitecfg"; } > "$dir/site.cfg"

            # Packege version
            if [ -z "${pkgver+x}" ]
            then
                portalversion="${version%%/*}"
            else
                portalversion="${pkgver}"
            fi

            # Python version
            if [ -z "${pyver+x}" ]
            then
                pythonver="${py[${version%%/*}]}"
            else
                pythonver="${pyver}"
            fi

            ploneversion="${portal[${version%%/*}]}"

            # Dockerfile 
            sed -i \
                -e 's,%%PKG_RELEASE%%,'"$portalversion"',' \
                -e 's,%%PYTHON_VERSION%%,'"$pythonver"',' \
                -e 's,%%PLONE_VERSION%%,'"$ploneversion"',' \
                "$dir/Dockerfile"
    
            # site.cfg
            sed -i \
                -e 's,%%PKG_RELEASE%%,'"$portalversion"',' \
                -e 's,%%PLONE_VERSION%%,'"$ploneversion"',' \
                "$dir/site.cfg"

            done
    done
else
    portalversion="${pkgver}"
fi
