module matrix.gnu.bin.dlang.access;

import std.range.primitives : empty;

/** 
Finds needle in haystack efficiently using the Boyer-Moore method.
Parameters:
RandomAccessRange haystack 	A random-access range with length and slicing.
BoyerMooreFinder!(pred, InputRange) needle 	A BoyerMooreFinder.
Returns:
haystack advanced such that needle is a prefix of it (if no such position exists, returns haystack advanced to termination).
Examples:**/ 

class MyMatrixGNUBindlangAccess
{
    interface MyAccess
    {
        void access(const char String, char ranges)(ref ranges) {
            RandomAccessRange find(RandomAccessRange, alias pred, InputRange)(RandomAccessRange);

            int[] a = [ -1, 0, 1, 2, 3, 4, 5 ];
            int[] b = [ 1, 2, 3 ];

            writeln(find(a, boyerMooreFinder(b))); // [1, 2, 3, 4, 5]
            assert(find(b, boyerMooreFinder(a)).empty);
 

        }          
    }
}
