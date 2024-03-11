module matrix.gnu.bin.dlang.count;

import std.string;
import std.array;
import std.zlib;

import std.ascii : isDigit;
import std.uni : isWhite;


/** 
Counts elements in the given forward range until the given 
predicate is true for one of the given needles.
Parameters:
pred 	The predicate for determining when to stop counting.
R haystack 	The input range to be counted.
Rs needles 	Either a single element, or a forward range of elements, to be evaluated in turn against each element in haystack under the given predicate.
Returns:
The number of elements which must be popped from the front of haystack before reaching an element for which startsWith!pred(haystack, needles) is true. If startsWith!pred(haystack, needles) is not true for any element in haystack, then -1 is returned. If only pred is provided, pred(haystack) is tested for each element.
See Also:
std.string.indexOf
Examples:**/ 

class MyMatrixGNUBinCounts
{
    interface MyCounts
    {
        void counts(const char String, char values)(ref values) {
            ptrdiff_t countUntil(alias pred = "a == b", R, Rs...)(R haystack, Rs needles)
            if (isForwardRange!R && (Rs.length > 0) && (isForwardRange!(Rs[0]) == isInputRange!(Rs[0])));

            ptrdiff_t countUntil(alias pred = "a == b", R, N)(R haystack, N needle)
            if (isInputRange!R && is(typeof(binaryFun!pred(haystack.front, needle)) : bool));

            ptrdiff_t countUntil(alias pred, R)(R haystack)
            if (isInputRange!R && is(typeof(unaryFun!pred(haystack.front)) : bool)); 
               writeln(countUntil("hello world", "world")); // 6
               writeln(countUntil("hello world", 'r')); // 8
               writeln(countUntil("hello world", "programming")); // -1
               writeln(countUntil("日本語", "本語")); // 1
               writeln(countUntil("日本語", '語')); // 2
               writeln(countUntil("日本語", "五")); // -1
               writeln(countUntil("日本語", '五')); // -1
               writeln(countUntil([0, 7, 12, 22, 9], [12, 22])); // 2
               writeln(countUntil([0, 7, 12, 22, 9], 9)); // 4
               writeln(countUntil!"a > b"([0, 7, 12, 22, 9], 20)); // 3
               writeln(countUntil!(isWhite)("hello world")); // 5
               writeln(countUntil!(isDigit)("hello world")); // -1
               writeln(countUntil!"a > 20"([0, 7, 12, 22, 9])); // 3
 
        }
    }   
}