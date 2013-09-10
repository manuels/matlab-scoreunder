matlab-scoreunder
=================

This library is for everyone who hates matlab just as deeply as I do. It brings some functions for functional programming from [underscore](http://underscorejs.org/)/[lowdash](http://lodash.com/)/[scoreunder](https://github.com/loop-recur/scoreunder) to matlab.
Note that its paragon is scoreunder that means that it aims to support lowdash functions (where it makes sense) but the arguments of all functions are reversed!

Getting Started
===============
After downloading/cloning the library and adding it to the search path of matlab (using `addpath`) you can use scoreunder like this

    >> u = scoreunder();
    >> square = @(x) x*x;
    >> u.map2matrix(square, 1:5)
    [1, 4, 9, 16, 25]


Auto-Curried Functions
======================
Underscore's functions are auto-curried where it makes sense. See [Brian Lonsdorf's presentation](https://www.youtube.com/watch?v=m3svKOdZijA) to understand why.
That means that arguments are curried (bound) to functions if you call the function with less arguments than it needs to evaluate:

    >> square = @(x) x*x;
    >> squareElements = u.map2matrix(square);
    >> squareElements(1:5)
    [1, 4, 9, 16, 25]
    
    >> add = @(x,y) x+y;
    >> squareSum = u.compose(u.reduce(add, 0), squareElements)
    55

Map/Reduce
==========
`map2xxx(fn, collection)` and `reduce(fn, init, collection)` are agnostict with respect to the type of their collection argument but map is not with respect to its output type:

    >> square = @(x) x*x;
    >> map2matrix(square, [1,2,3])
    [1, 4, 9]
    >> map2matrix(square, {1,2,3})
    [1, 4, 9]
    >> map2cell(square, [1,2,3])
    {1, 4, 9}
    >> map2cell(square, {1,2,3})
    {1, 4, 9}
    
    >> add = @(x,y) x+y;
    >> mysum = u.reduce(add, 0, 1:3);
    6

More functions
==============
For more functions supported by scoreunder and how to use them checkout the `test.m` file

    fieldnames(scoreunder())
        'autoCurry'
        'curry'
        'compose'
        'identity'
        'isMatrix'
        'isArray'
        'isCell'
        'isTrue'
        'isFalse'
        'map2cell'
        'map2matrix'
        'map2array'
        'reduce'
        'filter'
        'ifThenElse'
        'first'
        'rest'
        'zip'
        'flatten'

Help Developing
===============
I'm more than welcome for pull requests. However, note that every new feature must include tests in `test.m` that check and describe them.
