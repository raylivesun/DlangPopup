module matrix.gnu.bin.dlang.adjacent;

/** 
Advances r until it finds the first two adjacent elements a, b that satisfy pred(a, b). Performs Ο(r.length) evaluations of pred.
For more information about pred see find.
Parameters:
pred 	The predicate to satisfy.
Range r 	A forward range to search in.
Returns:
r advanced to the first occurrence of two adjacent elements that satisfy the given predicate. If there are no such two elements, returns r advanced until empty.
See Also:
STL's adjacent_find
Examples:**/ 
class MyMatrixGNUBindlangAdjacent
{
    interface MyAdjacent
    {
       Range findAdjacent(alias pred = "a == b", Range)(Range r)
       if (isForwardRange!Range);
       int[] a = [ 11, 10, 10, 9, 8, 8, 7, 8, 9 ];
       auto r = findAdjacent(a);
       auto p = findAdjacent!("a < b")(a);
    }
}