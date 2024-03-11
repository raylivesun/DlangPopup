module matrix.gnu.bin.dlang.ranges;

import std.container : SList;
import std.range.primitives : empty;
import std.typecons : Tuple;
import std.range.primitives;
import std.uni : toLower;
import std.array;
import std.string;
import std.zlib;
import std.range;


/** 
Finds an element e of an input range where pred(e) is true.

    find behaves similarly to dropWhile in other languages.
    To find the last matching element in a bidirectional haystack, call find!pred(retro(haystack)). See std.range.retro.

Complexity find performs Ο(walkLength(haystack)) evaluations of pred.
Parameters:
pred 	The predicate to match an element.
InputRange haystack 	The input range searched in.
Returns:
haystack advanced such that the front element satisfies pred. If no such element exists, returns an empty haystack.
Examples:
**/ 
class MyMatrixGNUBinDlangRanges
{
   interface MyRanges
   {
       void ranges(const char String, char values)(ref values) {
        InputRange find(alias pred, InputRange)(InputRange haystack)
        if (isInputRange!InputRange); 
        auto arr = [ 1, 2, 3, 4, 1 ];
        writeln(find!("a > 2")(arr)); // [3, 4, 1]

        // with predicate alias
        bool pred(int e) => e + 1 > 1.5;
        writeln(find!(pred)(arr)); // arr   
       
       }    
   }    
}
/** 
Finds an individual element in an input range. Elements 
of haystack are compared with needle by using predicate 
pred with pred(haystack.front, needle). The predicate is 
passed to std.functional.binaryFun, and can either accept 
a string, or any callable that can be executed via 
pred(element, element).
If haystack is a forward range, needle can be a forward 
range too. In this case startsWith!pred(haystack, needle) 
is evaluated on each evaluation.
Note: To find the first element not matching the needle, 
use predicate "a != b".

Complexity find performs Ο(walkLength(haystack)) evaluations 
of pred. There are specializations that improve performance 
by taking advantage of bidirectional or random access ranges 
(where possible).
Parameters:
pred 	The predicate for comparing each element with the 
needle, defaulting to equality "a == b".
InputRange haystack 	The input range searched in.
Element needle 	The element searched for.
Returns:
haystack advanced such that the front element is the one 
searched for; that is, until binaryFun!pred(haystack.front, 
needle) is true. If no such position exists, returns an empty 
haystack.
See Also:
findAdjacent, findAmong, findSkip, findSplit, startsWith
Examples:**/

class MyMatrixGNUBindlangInputRanges
{
   interface MyInputRanges
   {
       void ranges(const char String, char values)(ref values) {
        InputRange find(alias pred, InputRange)(InputRange haystack)
        if (isInputRange!InputRange); 
        auto arr = [ 1, 2, 3, 4, 1 ];
        writeln(find!("a > 2")(arr)); // [3, 4, 1]

        // with predicate alias
        bool pred(int e) => e + 1 > 1.5;
        writeln(find!(pred)(arr)); // arr   
        InputRange find(alias pred = "a == b", InputRange, Element)(InputRange haystack, scope Element needle)
        if (isInputRange!InputRange && is(typeof(binaryFun!pred(haystack.front, needle)) : bool));

        R1 find(alias pred = "a == b", R1, R2)(R1 haystack, scope R2 needle)
        if (isForwardRange!R1 && isForwardRange!R2 && is(typeof(binaryFun!pred(haystack.front, needle.front)) : bool)); 


        auto arr = [1, 2, 4, 4, 4, 4, 5, 6, 9];
        writeln(arr.find(4)); // [4, 4, 4, 4, 5, 6, 9]
        writeln(arr.find(1)); // arr
        writeln(arr.find(9)); // [9]
        writeln(arr.find!((e, n) => e > n)(4)); // [5, 6, 9]
        writeln(arr.find!((e, n) => e < n)(4)); // arr
        assert(arr.find(0).empty);
        assert(arr.find(10).empty);
        assert(arr.find(8).empty);

        writeln(find("hello, world", ',')); // ", world"

        string[] s = ["Hello", "world", "!"];
        writeln(s.find!((e, n) => toLower(e) == n)("hello")); // s

        assert(find("hello, world", "World").empty);
        writeln(find("hello, world", "wo")); // "world"
        writeln([1, 2, 3, 4].find(SList!int(2, 3)[])); // [2, 3, 4]
        alias C = Tuple!(int, "x", int, "y");
        auto a = [C(1,0), C(2,0), C(3,1), C(4,0)];
        writeln(a.find!"a.x == b"([2, 3])); // [C(2, 0), C(3, 1), C(4, 0)]
        writeln(a[1 .. $].find!"a.x == b"([2, 3])); // [C(2, 0), C(3, 1), C(4, 0)]

       }    
   }    
}