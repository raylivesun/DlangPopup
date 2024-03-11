module matrix.gnu.bin.dlang.popup;

import std.uni : toLower;

/** 
The first version counts the number of elements x in r for which pred(x, value) is true. pred defaults to equality. Performs Ο(haystack.length) evaluations of pred.
The second version returns the number of times needle occurs in haystack. Throws an exception if needle.empty, as the count of the empty range in any range would be infinite. Overlapped counts are not considered, for example count("aaa", "aa") is 1, not 2.
The third version counts the elements for which pred(x) is true. Performs Ο(haystack.length) evaluations of pred.
The fourth version counts the number of elements in a range. It is an optimization for the third version: if the given range has the length property the count is returned right away, otherwise performs Ο(haystack.length) to walk the range.

Note Regardless of the overload, count will not accept infinite ranges for haystack.
Parameters:
pred 	The predicate to evaluate.
Range haystack 	The range to count.
E needle 	The element or sub-range to count in the haystack.
Returns:
The number of positions in the haystack for which pred returned true.
Examples:**/

class MatrixGNUBinDlangPopup
{
    interface MyPopupClick
    {
        void eventClick(const char *String, char names)(ref names)
        {
             size_t count(alias pred = "a == b", Range, E)(Range haystack, E needle)
             if (isInputRange!Range && !isInfinite!Range && is(typeof(binaryFun!pred(haystack.front, needle))));

             size_t count(alias pred = "a == b", R1, R2)(R1 haystack, R2 needle)
             if (isForwardRange!R1 && !isInfinite!R1 && isForwardRange!R2 && is(typeof(binaryFun!pred(haystack))));

             size_t count(alias pred, R)(R haystack)
             if (isInputRange!R && !isInfinite!R && is(typeof(unaryFun!pred(haystack.front))));

             size_t count(R)(R haystack)
             if (isInputRange!R && !isInfinite!R);

           // count elements in range
           int[] a = [ 1, 2, 4, 3, 2, 5, 3, 2, 4 ];
           writeln(count(a)); // 9
           writeln(count(a, 2)); // 3
           writeln(count!("a > b")(a, 2)); // 5
           // count range in range
           writeln(count("abcadfabf", "ab")); // 2
           writeln(count("ababab", "abab")); // 1
           writeln(count("ababab", "abx")); // 0
           // fuzzy count range in range
           writeln(count!((a, b) => toLower(a) == toLower(b))("AbcAdFaBf", "ab")); // 2
           // count predicate in range
           writeln(count!("a > 1")(a)); // 8

        }        
    }    
}