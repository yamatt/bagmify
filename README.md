# Bagmify

## About

Bagmify is a script that wraps inotify and git to create a Dropbox
like tool.

It started after a conversation on identi.ca
http://identi.ca/notice/84548083 where a complaint was raised that
it's a shame SparkleShare was written in Mono when all it needs to do
is wrap inotify and git.
Therefore I built it.

Originally I coded it in Python then realised it would be far simpler
to write it in bash. Originally it was going to be called Pygmify, but
since it's now written in Bash it's now obviously called Bagmify.

The script simply monitors a directory of your choosing and when a
file is changed it will commit and push it to the git repository of
your choosing.

## Requirements

You require Git and inotifywait.

### Debian

`apt-get install git-core inotify-tools`

## Usage

### Setup

You will require somewhere to store your Git repository. A service
like Github may be suitable for your needs, and Github now offers
public *and* private repositories for free.

Whichever service you use - Github, Gitlab - should run you through
the process of configuring your local Git repository for remote
pushing.

If you wish to run your own Git repository, you won't have your files
in public. Make sure you use `bagmify` as your remote name. So long as
you have access to a git repository, Bagmifty will work!

You then need to run the bagmify script in a screen/tmux session for
the moment.

### Running

You'll need to setup the directory to synchronise yourself. Then you
can follow the post first-run instructions to run Bagmify.

#### First Run
`./bagmify path_to_directory git_repository`

An example first-run command could be:

`./bagmify ./filestore git@github.com:username/filestore.git`
    
#### Normal Run

`./bagmify path_to_directory`

An example command of a normal run could be:

`./bagmify ./filestore`
    
### Switching from SparkleShare

I'm told SparkleShare uses Git. If you want to switch to bagmify, use
the Git remote URI SparkleShare uses to commit in the first run.

## License

This project is licensed under the GPL, version 3.

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
* Works with init.d/systemd
* More guidance in this document
* Unit tests

Patches welcome.

## Contact ##
* Email: http://is.gd/60ggk7
* Identi.ca: http://identi.ca/yamatt
* Twitter: http://twitter.com/mattcopp
* Website: http://localhosy.net

