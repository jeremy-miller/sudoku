:- use_module(library(clpfd)).

sudoku(Rows) :-                     % expects list of lists
  Size is length(Rows),             % determine size of input puzzle
  Domain ins 1..Size,
  append(Rows, Domain),             % make sure all values in rows contain valid values
  maplist(all_distinct, Rows),      % make sure all row values are distinct
  transpose(Rows, Columns),         % generate all columns from exisitng rows
  maplist(all_distinct, Columns),   % make sure all column values are distinct
  validate_blocks(Size, Rows),      % make sure all blocks contain valid values and are distinct
  maplist(label, Rows),             % make sure all cells have only one value
  print_solution(Rows).

validate_blocks(_, []).
validate_blocks(Size, Rows) :-
  Domain ins 1..Size,
  Block_Height is floor(sqrt(Size)),
  Block_Width is ceiling(sqrt(Size)),
  Block_Length is Block_Height * Block_Width,
  split_at(Block_Height, Rows, First_Rows, Rest_Rows),          % get first set of rows to get blocks from
  transpose(First_Rows, Block_Columns),                         % setup columns to easily pull out blocks from first set of rows
  flatten(Block_Columns, Flattened_Blocks),                     % flatten columns (now that blocks are all next to each other)
  validate_row_blocks(Domain, Block_Length, Flattened_Blocks),  % validate the blocks from this set of rows
  validate_blocks(Size, Rest_Rows).

validate_row_blocks(_, _, []).
validate_row_blocks(Domain, Block_Length, List) :-
  take(Block_Length, List, First_Block, Rest),      % get first block from this set of rows
  append(First_Block, Domain),                      % make sure all cells in block contain valid values
  all_distinct(First_Block),                        % make sure all cells in block are distinct
  validate_row_blocks(Domain, Block_Length, Rest).  % recursively validate rest of blocks in this set of rows

print_solution([]).
print_solution([Head|Tail]) :-
  print_row(Head),
  write('|'), nl,
  print_solution(Tail).

print_row([]).
print_row([Head|Tail]) :-
  write('|'),
  write(Head),
  print_row(Tail).

  % get working in Docker image - https://hub.docker.com/r/swipl/swipl/
