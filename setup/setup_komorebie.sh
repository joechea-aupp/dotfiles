#!/bin/bash

userPath=$(wslpath "$(wslvar USERPROFILE)")
cd ..
stow -t $userPath komorebie

