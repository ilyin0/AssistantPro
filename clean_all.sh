#!/bin/bash

set -e

module_dirs=("domain" "data" "presentation")

for module_dir in ${module_dirs[@]}; do
  echo "Entering $module_dir"
  cd $module_dir && flutter clean && cd ..
done
flutter clean

printf '%s\n\n' "Done!"
