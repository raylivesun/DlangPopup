module matrix.gnu.bin.dlang.call;

/** 
Computes a subrange of range starting at the first occurrence of range's minimum (respectively maximum) and with the same ending as range, or the empty range if range itself is empty.
Formally, the minimum is a value x in range such that pred(a, x) is false for all values a in range. Conversely, the maximum is a value x in range such that pred(x, a) is false for all values a in range (note the swapped arguments to pred).
These functions may be used for computing arbitrary extrema by choosing pred appropriately. For corrrect functioning, pred must be a strict partial order, i.e. transitive (if pred(a, b) && pred(b, c) then pred(a, c)) and irreflexive (pred(a, a) is false).
Parameters:
pred 	The ordering predicate to use to determine the extremum (minimum or maximum) element.
Range range 	The forward range to search.
Returns:
The position of the minimum (respectively maximum) element of forward range range, i.e. a subrange of range starting at the position of its smallest (respectively largest) element and with the same ending as range.

Limitations If at least one of the arguments is NaN, the result is an unspecified value. See std.algorithm.searching.maxElement for examples on how to cope with NaNs.
See Also:
std.algorithm.comparison.max, minCount, minIndex, minElement
Examples:**/ 
class MyMatrixGNUBindlangCall
{
    interface MyCall
    {
        void call(const char String, char siriol)(ref siriol)
        {
            Range minPos(alias pred = "a < b", Range)(Range range)
            if (isForwardRange!Range && !isInfinite!Range && is(typeof(binaryFun!pred(range.front, range.front))));

            Range maxPos(alias pred = "a < b", Range)(Range range)
            if (isForwardRange!Range && !isInfinite!Range && is(typeof(binaryFun!pred(range.front, range.front)))); 

            int[] a = [ 2, 3, 4, 1, 2, 4, 1, 1, 2 ];
            // Minimum is 1 and first occurs in position 3
            writeln(a.minPos); // [1, 2, 4, 1, 1, 2]
            // Maximum is 4 and first occurs in position 2
            writeln(a.maxPos); // [4, 1, 2, 4, 1, 1, 2]

        }          
    }
}
