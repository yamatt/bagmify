#!/bin/sh

#####################################################################
# Bagmify - inotify + git wrapper
# Copyright (C) 2011  Matthew Copperwaite, Dom Rodriguez (shymega)

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

WATCH_DIR="$1"
GIT_PATH="$2"
REMOTE_REPO_NAME="bagmify"

update()
{
    # commit everything
    git add --all
    git commit -m "$(date) automatic commit."
    git push "$REMOTE_REPO_NAME"
}

if [ -d "$GIT_PATH" ]; then
    cd "$WATCH_DIR" || exit 1
    # has git init ran
    if [ ! -d .git/ ]; then
        echo "No git found before"
        git init
        if [ "$(find . | wc -l)" -eq 0 ]; then
            echo "Creating something to commit"
            touch empty
        fi
    fi
    # does remote repo exist
    if [ "$(git remote | grep bagmify)" = "$REMOTE_REPO_NAME" ]; then
        git remote add "$REMOTE_REPO_NAME" "$GIT_PATH"
    fi
fi

echo "Using directory $(pwd)"
# watch dir for create, modify, move and delete
while inotifywait -r -qq -e create -e close_write -e move -e delete .; do
    echo "Commiting"
    update
done
