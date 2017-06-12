:- use_module(library(clpfd)).

sudoku(Rows) :-                         % expects list of lists
  flatten(Rows, Flattened_Rows),
  length(Flattened_Rows, Flattened_Rows_Length),
  Size is sqrt(Flattened_Rows_Length),  % determine size of input puzzle
  Domain ins 1..Size,
  append(Rows, Domain),                 % make sure all values in rows contain valid values
  maplist(all_distinct, Rows),          % make sure all row values are distinct
  transpose(Rows, Columns),             % generate all columns from exisitng rows
  maplist(all_distinct, Columns),       % make sure all column values are distinct
  get_blocks(Size, Rows, Blocks),
  maplist(all_distinct, Blocks),        % make sure all blocks are distinct
  maplist(label, Rows),                 % make sure all cells have only one value
  print_solution(Rows).

get_blocks(_, [], _).
get_blocks(Size, Rows, Blocks) :-
  Block_Height is floor(sqrt(Size)),
  Block_Width is ceiling(sqrt(Size)),
  Block_Length is Block_Height * Block_Width,
  split_at(Block_Height, Rows, First_Rows, Rest_Rows),  % get first set of rows to get blocks from
  transpose(First_Rows, Block_Columns),  % setup columns to easily pull out blocks from first set of rows
  flatten(Block_Columns, Flattened_Blocks),  % flatten columns (now that blocks are all next to each other)
  partition(Flattened_Blocks, Block_Length, Row_Blocks),  % get the blocks from this set of rows
  append(Row_Blocks, Blocks),  % add blocks to existing list of blocks
  get_blocks(Size, Rest_Rows, Blocks).

partition(_, [], []).
partition(Length, List, [First_Block|Rest_Blocks]) :-
  take(Length, List, First_Block, Rest),
  partition(Length, Rest, Rest_Blocks).

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
