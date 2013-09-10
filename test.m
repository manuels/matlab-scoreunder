u = scoreunder();
expect = Tester;

expect(u.isMatrix([])).toBe(true);

expect(u.isMatrix([1, 2, 3])).toBe(true);
expect(u.isMatrix([] == 0)).toBe(true);
expect(u.isMatrix([1, 2, 3] == 0)).toBe(true);
expect(u.isMatrix({})).toBe(false);
expect(u.isMatrix({1, 2, 3})).toBe(false);

expect(u.isCell([])).toBe(false);
expect(u.isCell([1, 2, 3])).toBe(false);
expect(u.isCell([] == 0)).toBe(false);
expect(u.isCell([1, 2, 3] == 0)).toBe(false);
expect(u.isCell({})).toBe(true);
expect(u.isCell({1, 2, 3})).toBe(true);

list = {1,{{2,3}},4,{5}, 6, {7,8}};
expect(u.flatten(list)).toBe({1,2,3,4,5,6,7,8});

list = {1,{{2,3}},4,{5}, 6, {7,8}};
array = [1,2,3,4];
expect(u.first(list)).toBe(1);
expect(u.rest(list)).toBe({{{2,3}},4,{5}, 6, {7,8}});
expect(u.first(array)).toBe(1);
expect(u.rest(array)).toBe([2,3,4]);



add1andDouble = @(x) 2*(x+1);
add2andDouble = @(x) 2*(x+2);
add3andDouble = @(x) 2*(x+3);

fn = u.compose(add1andDouble);
expect(fn(0)).toBe(2);
fn = u.compose(add2andDouble, add1andDouble);
expect(fn(0)).toBe(8);
fn = u.compose(add3andDouble, add2andDouble, add1andDouble);
expect(fn(0)).toBe(22);

expect(u.ifThenElse(1, 2, true)).toBe(1);
expect(u.ifThenElse(1, 2, false)).toBe(2);

greater5 = @(x) x > 5;
fn = u.compose(u.ifThenElse(true, false), greater5);
expect(fn(10)).toBe(true);
expect(fn(0)).toBe(false);

% all does currently not work
%square = @(x) x*x;
%expect(u.All(@isnumeric, u.map2cell(square, [1,2,3])).toBe(true));
%expect(u.All(@isnumeric, u.map2cell(square, {1,2,3})).toBe(true));

add = @(x,y) x+y;
add5 = u.curry(add, 5);
expect(add5(2)).toBe(7);

expect(u.reduce(add, 0, 1:10)).toBe(55);
expect(u.reduce(add, -15, {1,2,3,4,5})).toBe(0);

isEven = @(x) mod(x,2) == 0;
expect(u.filter(isEven, [1,2,3,4,5])).toBe([2,4]);
expect(u.filter(isEven, {1,2,3,4,5})).toBe({2,4});
