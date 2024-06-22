#!/usr/bin/env bash

set -e

npm run built

cd dist

git init
git add -A
git commit -m 'Nueva Implementación'
git push -f git@github.com:luchoRoj/ingresos-y-gastos-lar.git master:gh-pages

cd -