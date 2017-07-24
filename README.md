[![Build Status](https://travis-ci.org/jeremy-miller/sudoku.svg?branch=master)](https://travis-ci.org/jeremy-miller/sudoku)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jeremy-miller/sudoku/blob/master/LICENSE)
[![SWI Prolog Version](https://img.shields.io/badge/SWI%20Prolog-7.5-blue.svg)]()

# Sudoku Solver
Sudoku solver in Prolog.  This Sudoku solver will solve any NxN puzzle it's given.  This implementation uses [SWI Prolog](http://www.swi-prolog.org/).

- [Motivation](#motivation)
- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Build](#build)
  - [Test](#test)
  - [Run](#run)
  - [Example Call](#example-call)
- [License](#license)

## Motivation
I create this project to learn Prolog.

## Usage
This implementation uses a Docker container to isolate the execution environment.

### Prerequisites
- [Docker](https://docs.docker.com/engine/installation/)

### Build
Before interacting with the Sudoku solver, the Docker container must be built: ```docker build -t jeremymiller/sudoku .```

### Test
To run the Sudoku solver tests, execute the following command: ```docker run -it jeremymiller/sudoku swipl -s sudoku.pl -g "load_test_files(sudoku)." -g "run_tests." -t halt.```

### Run
To get a solution to a Sudoku puzzle, you must pass the puzzle as a list of lists as an argument to the solver.  An example puzzle (4x4) looks like this: ```[[_,_,2,3],[_,_,_,_],[_,_,_,_],[3,4,_,_]]```

To run the Sudoku solver with a puzzle, execute the following command (substituting your ```<puzzle>```): ```docker run -it jeremymiller/sudoku swipl -s sudoku.pl -g "sudoku(<puzzle>)" -t halt.```

### Example Call
```
$ docker run -it jeremymiller/sudoku swipl -s sudoku.pl -g "sudoku([[_,_,2,3],[_,_,_,_],[_,_,_,_],[3,4,_,_]])" -t halt.
|4|1|2|3|
|2|3|4|1|
|1|2|3|4|
|3|4|1|2|
```

## License
[MIT](https://github.com/jeremy-miller/sudoku/blob/master/LICENSE)
