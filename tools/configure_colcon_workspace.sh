#!/usr/bin/env bash
set -euo pipefail

# Resolve the central workspace repository independently of the current
# working directory.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LITTLEBOT_WORKSPACE="$(cd -- "${SCRIPT_DIR}/.." && pwd)"

# By convention, littlebot_workspace is a sibling of the colcon build
# workspace. An explicit path can be supplied as the first argument.
DEFAULT_BUILD_ROOT="$(cd -- "${LITTLEBOT_WORKSPACE}/.." && pwd)"
BUILD_ROOT="${1:-${DEFAULT_BUILD_ROOT}}"

if [[ ! -d "${BUILD_ROOT}/src" ]]; then
  echo "Error: '${BUILD_ROOT}' does not contain a src/ directory." >&2
  echo "Import the repositories first, or pass the correct build workspace path." >&2
  exit 1
fi

# Install the version-controlled configuration templates where colcon
# automatically discovers them.
cp "${LITTLEBOT_WORKSPACE}/colcon/colcon_defaults.yaml" "${BUILD_ROOT}/colcon_defaults.yaml"
cp "${LITTLEBOT_WORKSPACE}/colcon/colcon.meta" "${BUILD_ROOT}/colcon.meta"

# Prevent colcon from discovering third-party source trees as packages.
third_party_repositories=(cppserial protobuf googletest)

for repository in "${third_party_repositories[@]}"; do
  repository_dir="${BUILD_ROOT}/src/${repository}"

  if [[ -d "${repository_dir}" ]]; then
    touch "${repository_dir}/COLCON_IGNORE"
    echo "Excluded from colcon discovery: src/${repository}"
  else
    echo "Warning: third-party repository not found: src/${repository}" >&2
  fi
done

echo "Colcon configuration installed in: ${BUILD_ROOT}"
echo "Run 'colcon list' from that directory to verify package discovery."
