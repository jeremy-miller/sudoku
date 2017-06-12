:- use_module(library(clpfd)).

sudoku(Rows) :-                         % expects list of lists
  Size is sqrt(length(flatten(Rows))),  % determine size of input puzzle
  Domain ins 1..Size,
  append(Rows, Domain),                 % make sure all values in rows contain valid values
  maplist(all_distinct, Rows),          % make sure all row values are distinct
  transpose(Rows, Columns),             % generate all columns from exisitng rows
  maplist(all_distinct, Columns),       % make sure all column values are distinct
  Block_Width is ceiling(sqrt(Size)),
  Block_Height is floor(sqrt(Size)),
  validate_blocks(Rows),
  % for each row in Block_Height get Block_Width elements and maplist(all_distinct, Block)
  % generate blocks
  % validate blocks
  maplist(label, Rows),                 % make sure all cells have only one value
  print_solution(Rows).

validate_blocks(Rows) :-
  take(Block_Height, Rows, Block_Rows)
  take(Block_Width, Block_Rows, )

print_solution([]).
print_solution([H|T]) :-
  print_row(H),
  write('|'), nl,
  print_solution(T).

print_row([]).
print_row([H|T]) :-
  write('|').
  write(H),
  print_row(T).

  % get working in Docker image - https://hub.docker.com/r/swipl/swipl/
