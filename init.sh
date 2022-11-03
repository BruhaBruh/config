#!/bin/bash

yarn
yarn add -D @commitlint/config-conventional @commitlint/cli husky @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-prettier prettier stylelint stylelint-config-prettier stylelint-config-standard
npm set-script lint 'arn lint:eslint && yarn lint:stylelint'
npm set-script lint:eslint 'eslint src'
npm set-script lint:stylelint 'stylelint src'
npm set-script format 'yarn format:prettier && yarn format:eslint && yarn format:stylelintyarn format:prettier && yarn format:eslint && yarn format:stylelint'
npm set-script format:prettier 'prettier --write src'
npm set-script format:eslint 'eslint --fix src'
npm set-script format:stylelint 'stylelint --fix srcstylelint --fix src'
npm set-script prepare 'husky install'
yarn run prepare
npx husky add .husky/commit-msg  'npx --no -- commitlint --edit ${1}'
npx husky add .husky/pre-commit  'yarn lint'

rm ./init.sh