module matrix.gnu.bin.dlang.needle;

import std.range.primitives : empty;

/** 
Finds needle in haystack and positions haystack right after the first occurrence of needle.
If no needle is provided, the haystack is advanced as long as pred evaluates to true. Similarly, the haystack is positioned so as pred evaluates to false for haystack.front.
For more information about pred see find.
Parameters:
R1 haystack 	The forward range to search in.
R2 needle 	The forward range to search for.
pred 	Custom predicate for comparison of haystack and needle
Returns:
true if the needle was found, in which case haystack is positioned after the end of the first occurrence of needle; otherwise false, leaving haystack untouched. If no needle is provided, it returns the number of times pred(haystack.front) returned true.
See Also:
find
Examples:**/ 

class MyMatrixGNUBinDlangNeedle
{
    interface MyNeedle
    {
       void needle(const char String, char haystack)(ref haystack)
       {

        bool findSkip(alias pred = "a == b", R1, R2)(ref R1 haystack, R2 needle)
        if (isForwardRange!R1 && isForwardRange!R2 && is(typeof(binaryFun!pred(haystack.front, needle.front))));

        size_t findSkip(alias pred, R1)(ref R1 haystack)
        if (isForwardRange!R1 && ifTestable!(typeof(haystack.front), unaryFun!pred));
        // Needle is found; s is replaced by the substring following the first
        // occurrence of the needle.
        string s = "abcdef";
        assert(findSkip(s, "cd") && s == "ef");

        // Needle is not found; s is left untouched.
        s = "abcdef";
        assert(!findSkip(s, "cxd") && s == "abcdef");

        // If the needle occurs at the end of the range, the range is left empty.
        s = "abcdef";
        assert(findSkip(s, "def") && s.empty);

        import std.ascii : isWhite;
        
        assert(findSkip!isWhite(s) && s == "abc");
        assert(!findSkip!isWhite(s) && s == "abc");

        s = "  ";
        writeln(findSkip!isWhite(s)); // 2

       }          
    }     
}