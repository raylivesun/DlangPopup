module matrix.gnu.bin.dlang.columns;

import std.ascii : isAlpha;
import std.algorithm.comparison : among;
import std.array;
import std.string;
import std.zlib;

/** 
Checks if the given range ends with (one of) the given needle(s). The reciprocal of startsWith.
Parameters:
pred 	The predicate to use for comparing elements between the range and the needle(s).
Range doesThisEnd 	The bidirectional range to check.
Needles withOneOfThese 	The needles to check against, which may be single elements, or bidirectional ranges of elements.
R2 withThis 	The single element to check.
Returns:
0 if the needle(s) do not occur at the end of the given range; otherwise the position of the matching needle, that is, 1 if the range ends with withOneOfThese[0], 2 if it ends with withOneOfThese[1], and so on.
In the case when no needle parameters are given, return true iff back of doesThisStart fulfils predicate pred.
Examples:**/ 

class MyMatrixGNUBindlangColumn
{
   interface MyColumns
   {
      void columns(const char String, char columns)(ref columns)
      {
        uint endsWith(alias pred = "a == b", Range, Needles...)(Range doesThisEnd, Needles withOneOfThese)
        if (isBidirectionalRange!Range && (Needles.length > 1) && allSatisfy!(canTestStartsWith!(pred, Range)));

        bool endsWith(alias pred = "a == b", R1, R2)(R1 doesThisEnd, R2 withThis)
        if (isBidirectionalRange!R1 && isBidirectionalRange!R2 && is(typeof(binaryFun!pred(doesThisEnd.back)) : bool));

        bool endsWith(alias pred = "a == b", R, E)(R doesThisEnd, E withThis)
        if (isBidirectionalRange!R && is(typeof(binaryFun!pred(doesThisEnd.back, withThis)) : bool));

        bool endsWith(alias pred, R)(R doesThisEnd)
        if (isInputRange!R && ifTestable!(typeof(doesThisEnd.front), unaryFun!pred)); 

        assert("abc".endsWith!(a => a.isAlpha));
        assert("abc".endsWith!isAlpha);

        assert(!"ab1".endsWith!(a => a.isAlpha));

        assert(!"ab1".endsWith!isAlpha);
        assert(!"".endsWith!(a => a.isAlpha));

        assert("abc".endsWith!(a => a.among('c', 'd') != 0));
        assert(!"abc".endsWith!(a => a.among('a', 'b') != 0));

        assert(endsWith("abc", ""));
        assert(!endsWith("abc", "b"));
        writeln(endsWith("abc", "a", 'c')); // 2
        writeln(endsWith("abc", "c", "a")); // 1
        writeln(endsWith("abc", "c", "c")); // 1
        writeln(endsWith("abc", "bc", "c")); // 2
        writeln(endsWith("abc", "x", "c", "b")); // 2
        writeln(endsWith("abc", "x", "aa", "bc")); // 3
        writeln(endsWith("abc", "x", "aaa", "sab")); // 0
        writeln(endsWith("abc", "x", "aaa", 'c', "sab")); // 3
     }    
   }    
}