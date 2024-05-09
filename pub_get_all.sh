#!/bin/bash

set -e

module_dirs=("domain" "data" "presentation")

for module_dir in ${module_dirs[@]}; do
  echo "Entering $module_dir"
  cd $module_dir && flutter pub get && cd ..
done
flutter pub get

printf '%s\n\n' "Done!"
