:- module(sudoku, [sudoku/1])
:- use_module(library(clpfd)).
:- use_module(library(list_util), [split_at/4]).

sudoku(Rows) :-                     % expects list of lists
  length(Rows, Size),               % determine size of input puzzle
  append(Rows, Domain),             % make sure all values in rows contain valid values
  Domain ins 1..Size,               % set range of valid values
  maplist(all_distinct, Rows),      % make sure all row values are distinct
  transpose(Rows, Columns),         % generate all columns from exisitng rows
  maplist(all_distinct, Columns),   % make sure all column values are distinct
  validate_all_blocks(Rows),        % make sure all blocks are distinct
  maplist(label, Rows),             % make sure all cells have only one value
  print_solution(Rows).

validate_all_blocks([]).
validate_all_blocks(Rows) :-
  length(Rows, Size),
  Block_Height is floor(sqrt(Size)),
  Block_Width is ceiling(sqrt(Size)),
  Block_Length is Block_Height * Block_Width,
  split_at(Block_Height, Rows, First_Rows, Rest_Rows),  % get first set of rows to get blocks from
  transpose(First_Rows, Block_Columns),                 % setup columns to easily pull out blocks from first set of rows
  flatten(Block_Columns, Flattened_Blocks),             % flatten columns (now that blocks are all next to each other)
  validate_row_blocks(Block_Length, Flattened_Blocks),  % validate the blocks from this set of rows
  validate_all_blocks(Rest_Rows).

validate_row_blocks(_, []).
validate_row_blocks(Block_Length, List) :-
  split_at(Block_Length, List, First_Block, Rest),  % get first block from this set of rows
  all_distinct(First_Block),                        % make sure all cells in block are distinct
  validate_row_blocks(Block_Length, Rest).          % recursively validate rest of blocks in this set of rows

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
