module matrix.gnu.bin.dlang.check;

import std.conv : text;
import std.typecons : tuple;

/** 
Computes the minimum (respectively maximum) of range along with its number of occurrences. Formally, the minimum is a value x in range such that pred(a, x) is false for all values a in range. Conversely, the maximum is a value x in range such that pred(x, a) is false for all values a in range (note the swapped arguments to pred).
These functions may be used for computing arbitrary extrema by choosing pred appropriately. For corrrect functioning, pred must be a strict partial order, i.e. transitive (if pred(a, b) && pred(b, c) then pred(a, c)) and irreflexive (pred(a, a) is false). The trichotomy property of inequality is not required: these algorithms consider elements a and b equal (for the purpose of counting) if pred puts them in the same equivalence class, i.e. !pred(a, b) && !pred(b, a).
Parameters:
pred 	The ordering predicate to use to determine the extremum (minimum or maximum).
Range range 	The input range to count.
Returns:
The minimum, respectively maximum element of a range together with the number it occurs in the range.

Limitations If at least one of the arguments is NaN, the result is an unspecified value. See std.algorithm.searching.maxElement for examples on how to cope with NaNs.
Throws:
Exception if range.empty.
See Also:
std.algorithm.comparison.min, minIndex, minElement, minPos
Examples:**/ 
class MyMatrixGNUBindlangCheck
{
    interface MyCheck
    {
        void check(const char String, char count)(ref count)
        {
            Tuple!(ElementType!Range, size_t) minCount(alias pred = "a < b", Range)(Range range)
            if (isInputRange!Range && !isInfinite!Range && is(typeof(binaryFun!pred(range.front, range.front))));

            Tuple!(ElementType!Range, size_t) maxCount(alias pred = "a < b", Range)(Range range)
            if (isInputRange!Range && !isInfinite!Range && is(typeof(binaryFun!pred(range.front, range.front)))); 

            int[] a = [ 2, 3, 4, 1, 2, 4, 1, 1, 2 ];
            // Minimum is 1 and occurs 3 times
            writeln(a.minCount); // tuple(1, 3)
            // Maximum is 4 and occurs 2 times
            writeln(a.maxCount); // tuple(4, 2)

        }
    }    
}
