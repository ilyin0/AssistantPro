#!/bin/bash

set -e

module_dirs=("data" "presentation")

for module_dir in ${module_dirs[@]}; do
  echo "Entering $module_dir"
  cd $module_dir && dart run build_runner build --delete-conflicting-outputs && cd ..
done
dart run build_runner build --delete-conflicting-outputs

printf '%s\n\n' "Done!"
