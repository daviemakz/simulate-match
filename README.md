# STATUS
[![Build Status](https://travis-ci.org/daviemakz/simulate-match.svg?branch=master)](https://travis-ci.org/daviemakz/simulate-match)
[![Issue Count](https://codeclimate.com/github/daviemakz/simulate-match/badges/issue_count.svg)](https://codeclimate.com/github/daviemakz/simulate-match)

# SUMMARY
This is a small repository which simulates a card game called "Match!" between two computer players using N packs of cards (standard 52 card, 4 suit packs).

The "Match!" matching condition can be the face value of the card, the suit, or both. When two matching cards are played sequentially, a player is chosen randomly as having declared "Match!" first and takes ownership of all cards played in that run.

Play continues until the pile is completely exhausted (any cards played without ending in a "Match!" at the time the pile is exhausted are ignored). The total number of cards "owned" by each player is counted up and a winner/draw is declared.

# HOW TO INSTALL

To install the application run the following commands:

    perl Makefile.PL
    make
    make test
    make install

# HOW TO RUN

To execute the program run the following command in your terminal:

    play-match

# TESTS

To run manual tests navigate to the repository root directory and execute:

    prove

or

    make test

Enjoy!
