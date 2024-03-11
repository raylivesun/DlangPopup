module matrix.gnu.bin.dlang.find;

/** 
Returns true if and only if pred(e) is true for any value 
e in the input range range. Performs (at most) Ο(haystack.length) 
evaluations of pred.**/ 

class MyMatrixGNUBindlangFind
{
    interface MyFind
    {
        bool canFind(Range)(Range haystack)
        if (is(typeof(find!pred(haystack))));         
        bool canFind(Range, Element)(Range haystack, scope Element needle)
        if (is(typeof(find!pred(haystack, needle))));
        size_t canFind(Range, Needles...)(Range haystack, scope Needles needles)
        if (Needles.length > 1 && is(typeof(find!pred(haystack, needles))));
        Range findAdjacent(alias pred = "a == b", Range)(Range r)
        if (isForwardRange!Range);


    }    
}