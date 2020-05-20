# loadrc
loadrc automatically constructs / destroys an enviroment whenever you `cd` into a directory.


## How does this work?
loadrc overrides your bash's `cd` with a function that runs a destructor before `cd`ing into the specified directory, and a constructor afterwards.

The destructor and constructor `source`s a .unloadrc and a .loadrc respectively, if found. It does this the whole the way up until `/`.


## Installation
`cd ~ && git clone https://github.com/nielslerches/loadrc.git && echo -e '\nsource ~/loadrc/loadrc.sh\n'`

Create a .loadrc and a corresponding .unloadrc. Each shell script should handle setting up the environment, and destroying it when no longer needed.


## Use case
I'm primarily a python developer and use virtualenv a lot. I've setup a workspace folder like this:

```bash
# .loadrc
source .../.venv/bin/activate

# .unloadrc
deactivate

```


## TODO:
- Don't unload and re-load the environment scripts the whole way unti `/`, if the new working directory shares a common base with the new working directory (this can probably be done using `diff`).
- Refactor the crap reverse for-loop in the loadrc() (if you know of a way that's nice please let me know).
