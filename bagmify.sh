#!/bin/sh

#####################################################################
# Bagmify - inotify + git wrapper
# Copyright (C) 2011  Matthew Copperwaite

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#######################################################################

WATCH_DIR=$1
GIT_PATH=$2

update()
{
    git add --all
    git commit -m "`date` automatic commit."
    git push bagmify
}

if [ -d $GIT_PATH ]; then
    cd $WATCH_DIR
    if [ ! -d .git/ ]; then
        git init
        if [ `ls -1 | wc -l` -eq 0 ]; then
            touch empty
        fi
        git remote add bagmify $GIT_PATH
    fi
fi

# watch dir for create, modify, move and delete
echo "Using directory `pwd`"
while inotifywait -r -e create -e close_write -e move -e delete .; do
    update
done
