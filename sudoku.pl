sudoku(Puzzle, Solution) :-
  Solution = Puzzle,                        % goal is to have our Solution equal our Puzzle
  Size is sqrt(length(Puzzle)),             % determine size of grid (NxN)
  fd_domain(Puzzle, 1, N),                  % constrain all values in Puzzle to valid values
  Square_Width is ceiling(sqrt(Size)),
  Square_Height is floor(sqrt(Size)),
  




  % setup rows
  % setup columns
  % setup squares
  % validate rows
  % validate columns
  % validate squares
  % validate fd_all_different()
  % pretty print output

  % write tests
  % get working in Docker image
