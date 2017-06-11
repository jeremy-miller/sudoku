sudoku(Puzzle, Solution) :-
  Solution = Puzzle,          % goal is to have our Solution equal our Puzzle
  N is sqrt(length(Puzzle)),  % determine size of grid (NxN)
  fd_domain(Puzzle, 1, N).    % constrain all values in Puzzle to valid values
  % setup rows
  % setup columns
  % setup squares
  % validate rows
  % validate columns
  % validate squares
  % validate fd_all_different()
  
  % write tests
  % get working in Docker image
