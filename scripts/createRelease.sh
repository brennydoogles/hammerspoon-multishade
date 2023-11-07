#!/usr/bin/env zsh

rm -rf Spoons
mkdir -p Spoons/MultiShade.spoon
cp src/* Spoons/MultiShade.spoon/
(cd Spoons && zip -r MultiShade.spoon.zip MultiShade.spoon)
rm -r Spoons/MultiShade.spoon