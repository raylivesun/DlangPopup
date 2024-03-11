module matrix.gnu.bin.dlang.lockstreet;

import std.range : enumerate;
import std.typecons : tuple;
import std.range : enumerate;
import std.typecons : tuple;

/** 
Iterates the passed range and returns the minimal element. A custom mapping function can be passed to map. In other languages this is sometimes called argmin.

Complexity O(n) Exactly n - 1 comparisons are needed.
Parameters:
map 	custom accessor for the comparison key
Range r 	range from which the minimal element will be selected
RangeElementType seed 	custom seed to use as initial element

Precondition If a seed is not given, r must not be empty.
Returns:
The minimal element of the passed-in range.

Note If at least one of the arguments is NaN, the result is an unspecified value.
If you want to ignore NaNs, you can use std.algorithm.iteration.filter and std.math.isNaN to remove them, before applying minElement. Add a suitable seed, to avoid error messages if all elements are NaNs:

<range>.filter!(a=>!a.isNaN).minElement(<seed>);

If you want to get NaN as a result if a NaN is present in the range, you can use std.algorithm.iteration.fold and std.math.isNaN:

<range>.fold!((a,b)=>a.isNaN || b.isNaN ? real.nan : a < b ? a : b);

See Also:
maxElement, std.algorithm.comparison.min, minCount, minIndex, minPos
Examples:**/ 

class MyMatrixGNUBinDlangLockStreet
{
   interface MyLockStreet
   {
       void lockStreet(const char String, char element)(ref element)
       {
        
        auto minElement(alias map = (a) => a, Range)(Range r)
        if (isInputRange!Range && !isInfinite!Range);

        auto minElement(alias map = (a) => a, Range, RangeElementType = ElementType!Range)(Range r, RangeElementType)
        if (isInputRange!Range && !isInfinite!Range && !is(CommonType!(ElementType!Range, RangeElementType) == void));

        writeln([2, 7, 1, 3].minElement); // 1

        // allows to get the index of an element too
        writeln([5, 3, 7, 9].enumerate.minElement!"a.value"); // tuple(1, 3)

        // any custom accessor can be passed
        writeln([[0, 4], [1, 2]].minElement!"a[1]"); // [1, 2]

        // can be seeded
        int[] arr;
        writeln(arr.minElement(1)); // 1

        auto maxElement(alias map = (a) => a, Range)(Range r)
        if (isInputRange!Range && !isInfinite!Range);

        auto maxElement(alias map = (a) => a, Range, RangeElementType = ElementType!Range)(Range r, RangeElementType)
        if (isInputRange!Range && !isInfinite!Range && !is(CommonType!(ElementType!Range, RangeElementType) == void)); 

        writeln([2, 1, 4, 3].maxElement); // 4

        // allows to get the index of an element too
        writeln([2, 1, 4, 3].enumerate.maxElement!"a.value"); // tuple(2, 4)

        // any custom accessor can be passed
        writeln([[0, 4], [1, 2]].maxElement!"a[1]"); // [0, 4]

        // can be seeded
        writeln(arr.minElement(1)); // 1


       }    
   }    
}