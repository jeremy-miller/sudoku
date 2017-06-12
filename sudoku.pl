:- use_module(library(clpfd)).

sudoku(Rows) :-                         % expects list of lists
  Size is sqrt(length(flatten(Rows))),  % determine size of input puzzle
  Domain ins 1..Size,
  append(Rows, Domain),                 % make sure all values in rows contain valid values
  maplist(all_distinct, Rows),          % make sure all row values are distinct
  transpose(Rows, Columns),             % generate all columns from exisitng rows
  maplist(all_distinct, Columns),       % make sure all column values are distinct
  % generate blocks
  % validate blocks
  maplist(label, Rows),                 % make sure all cells have only one value
  % pretty print output


  Block_Width is ceiling(sqrt(Size)),
  Block_Height is floor(sqrt(Size)),


[[_,_,2,3],
 [_,_,_,_],
 [_,_,_,_],
 [3,4,_,_]]

 [[1,_,_,_,_,_],
  [_,5,_,2,_,_],
  [_,1,6,_,5,_], 
  [_,3,_,6,2,_], 
  [_,_,1,_,3,_], 
  [_,_,_,_,_,5]]


[[_,_,_,_,_,_,_,_,_],
 [_,_,_,_,_,3,_,8,5],
 [_,_,1,_,2,_,_,_,_],
 [_,_,_,5,_,7,_,_,_],
 [_,_,4,_,_,_,1,_,_],
 [_,9,_,_,_,_,_,_,_],
 [5,_,_,_,_,_,_,7,3],
 [_,_,2,_,1,_,_,_,_],
 [_,_,_,_,4,_,_,_,9]]


  % write tests
  % get working in Docker image
