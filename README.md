# Bagmi #
## About ##
Bagmi is a script that wraps inotify and git to create a Dropbox like tool.
It started after a conversation on identi.ca http://identi.ca/notice/84548083 where a complaint was raised that it's a shame SparkleShare was written in Mono when all it needs to do is wrap inotify and git.
Therefore I built it.

Originally I coded it in Python then realised it would be far simpler to write it in bash. Originally it was going to be called Pygmify, but since it's now written in Bash it's now obviously called Bagmify.

The script simply monitors a directory of your choosing and when a file is changed it will commit and push it to the git repository of your choosing.

## Requirements ##
You require Git and inotifywait.
### Debian ###
    apt-get install git-core inotify-tools

## Usage ##
### Setup ###
You will require somewhere to store your git and have certificate access. May I recommend github.com.
It will run you through the process of setting everything up on a linux machine.
Of course github repositories are public and you have to pay to get private repository.

If you wish to run your own git repository you won't have your files in public. Make sure you use bagmify as your remote name. So long as you have access to a git repository it will work here.

You then need to run the bagmify script in a screen session (for the moment).

### Running ###
You can either set up the directory to syncronise yourself. You can then follow the post-first-run instructions to execute it.

#### First Run ####
    ./bagmify path_to_directory git_repository

example:

    ./bagmify ./filestore git@github.com:username/filestore.git
    
#### Normal Run ####
    ./bagmify path_to_directory
    
example:

    ./bagmify ./filestore
    
### Switching from SparkleShare ###
I'm told SparkleShare uses git. If you want to switch to bagmify use the remote path SparkleShare uses to commit in the first run.
Better instructions welcome.

## License ##
GPLv3

    Bagmify - inotify + git wrapper
    Copyright (C) 2011  Matthew Copperwaite

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Future Additions ##
* More descriptive commit messages
* Works with init.d
* More guidance in this document
* Unit tests

Patches welcome.

## Contact ##
* e-mail: http://is.gd/60ggk7
* identi.ca: http://identi.ca/yamatt
* twitter: http://twitter.com/mattcopp
* website: http://localhosy.net

