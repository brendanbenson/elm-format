[![Build Status](https://travis-ci.org/avh4/elm-format.svg?branch=master)](https://travis-ci.org/avh4/elm-format)

# elm-format

`elm-format` is the official source code formatter for Elm.


## Basic Usage

```bash
elm-format Main.elm
```


## Development info

### Building

Install the Elm platform from source using the BuildFromSource.hs script, then:

```bash
git clone https://github.com/avh4/elm-format.git
cd elm-format
runhaskell BuildFromSource.hs build
cabal sandbox init --sandbox=Elm-Platform/build/.cabal-sandbox
cabal install -j
./Elm-Platform/build/.cabal-sandbox/bin/elm-format --help
```

### Running tests

After installing with the instructions above:

```bash
./tests/run-tests.sh
```