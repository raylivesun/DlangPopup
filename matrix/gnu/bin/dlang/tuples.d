module matrix.gnu.bin.dlang.tuples;

import std.typecons : tuple;
import std.stdio;
import std.string;
import std.zlib;
import std.range;
import std.stdint;
import std.array;
        
/** 
Finds two or more needles into a haystack. The predicate pred is used throughout to compare elements. By default, elements are compared for equality.
Parameters:
pred 	The predicate to use for comparing elements.
Range haystack 	The target of the search. Must be an input range. If any of needles is a range with elements comparable to elements in haystack, then haystack must be a forward range such that the search can backtrack.
Needles needles 	One or more items to search for. Each of needles must be either comparable to one element in haystack, or be itself a forward range with elements comparable with elements in haystack.
Returns:
A tuple containing haystack positioned to match one of the needles and also the 1-based index of the matching element in needles (0 if none of needles matched, 1 if needles[0] matched, 2 if needles[1] matched...). The first needle to be found will be the one that matches. If multiple needles are found at the same spot in the range, then the shortest one is the one which matches (if multiple needles of the same length are found at the same spot (e.g "a" and 'a'), then the left-most of them in the argument list matches).
The relationship between haystack and needles simply means that one can e.g. search for individual ints or arrays of ints in an array of ints. In addition, if elements are individually comparable, searches of heterogeneous types are allowed as well: a double[] can be searched for an int or a short[], and conversely a long can be searched for a float or a double[]. This makes for efficient searches without the need to coerce one side of the comparison into the other's side type.
The complexity of the search is Ο(haystack.length * max(needles.length)). (For needles that are individual items, length is considered to be 1.) The strategy used in searching several subranges at once maximizes cache usage by moving in haystack as few times as possible.
Examples:**/

class MyMatrixGNUBinDlangTuples
{
    interface MyTuples
    {
       void tuples(const char String, char items)(ref items) {
        Tuple!(Range, size_t) find(alias pred = "a == b", Range, Needles...)(Range haystack, Needles needles)
        if (Needles.length > 1 && is(typeof(startsWith!pred(haystack, needles)))); 

        int[] a = [ 1, 4, 2, 3 ];
        writeln(find(a, 4)); // [4, 2, 3]
        writeln(find(a, [1, 4])); // [1, 4, 2, 3]
        writeln(find(a, [1, 3], 4)); // tuple([4, 2, 3], 2)
        // Mixed types allowed if comparable
        writeln(find(a, 5, [1.2, 3.5], 2.0)); // tuple([2, 3], 3)

       }        
    }
}