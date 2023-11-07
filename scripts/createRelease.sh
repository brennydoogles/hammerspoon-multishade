#!/usr/bin/env zsh

rm -rf Spoons
mkdir -p Spoons/MultiShade.spoon
cp src/* Spoons/MultiShade.spoon/
cp docs/docs.json Spoons/MultiShade.spoon/docs.json
(cd Spoons && zip -r MultiShade.spoon.zip MultiShade.spoon)
rm -r Spoons/MultiShade.spoon