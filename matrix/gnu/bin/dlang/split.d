module matrix.gnu.bin.dlang.split;

import std.range.primitives : empty;
import std.typecons : isTuple;
import std.range : only;
        
/** 
These functions find the first occurrence of needle in haystack and then split haystack as follows.
findSplit returns a tuple result containing three ranges.

    result[0] is the portion of haystack before needle
    result[1] is the portion of haystack that matches needle
    result[2] is the portion of haystack after the match.

If needle was not found, result[0] comprehends haystack entirely and result[1] and result[2] are empty.
findSplitBefore returns a tuple result containing two ranges.

    result[0] is the portion of haystack before needle
    result[1] is the balance of haystack starting with the match.

If needle was not found, result[0] comprehends haystack entirely and result[1] is empty.
findSplitAfter returns a tuple result containing two ranges.

    result[0] is the portion of haystack up to and including the match
    result[1] is the balance of haystack starting after the match.

If needle was not found, result[0] is empty and result[1] is haystack.

In all cases, the concatenation of the returned ranges spans the entire haystack.
If haystack is a random-access range, all three components of the tuple have the same type as haystack. Otherwise, haystack must be a forward range and the type of result[0] (and result[1] for findSplit) is the same as the result of std.range.takeExactly.
For more information about pred see find.

Parameters:
pred 	Predicate to compare 2 elements.
R1 haystack 	The forward range to search.
R2 needle 	The forward range to look for.
Returns:
A sub-type of std.typecons.Tuple of the split portions of haystack (see above for details). This sub-type of Tuple defines opCast!bool, which returns true when the separating needle was found and false otherwise.
See Also:
find
Examples:
Returning a subtype of std.typecons.Tuple enables the following convenient idiom: 
**/ 
class MyMatrixGNUBinDlangSplit
{
    interface MySplit
    {
        void split(const char String, char enables)(ref enables)
        {
            auto findSplit(alias pred = "a == b", R1, R2)(R1 haystack, R2 needle)
            if (isForwardRange!R1 && isForwardRange!R2);

            auto findSplitBefore(alias pred = "a == b", R1, R2)(R1 haystack, R2 needle)
            if (isForwardRange!R1 && isForwardRange!R2);

            auto findSplitAfter(alias pred = "a == b", R1, R2)(R1 haystack, R2 needle)
            if (isForwardRange!R1 && isForwardRange!R2);

            // findSplit returns a triplet
            if (auto split = "dlang-rocks".findSplit("-"))
            {
                writeln(split[0]); // "dlang"
                writeln(split[1]); // "-"
                writeln(split[2]); // "rocks"
            }
            else assert(0);

           // findSplitBefore returns 2 ranges
           if (const split = [2, 3, 2, 3, 4, 1].findSplitBefore!"a > b"([2, 2]))
          {
             writeln(split[0]); // [2, 3, 2]
             // [3, 4] each greater than [2, 2]
             writeln(split[1]); // [3, 4, 1]
          }
            else assert(0);

           auto a = "Carl Sagan Memorial Station";
           auto r = findSplit(a, "Velikovsky");
           static assert(isTuple!(typeof(r.asTuple)));
           static assert(isTuple!(typeof(r)));
           assert(!r);
           writeln(r[0]); // a
           assert(r[1].empty);
           assert(r[2].empty);
           r = findSplit(a, " ");
           writeln(r[0]); // "Carl"
           writeln(r[1]); // " "
           writeln(r[2]); // "Sagan Memorial Station"
           if (const r1 = findSplitBefore(a, "Sagan"))
          {
             assert(r1);
             writeln(r1[0]); // "Carl "
             writeln(r1[1]); // "Sagan Memorial Station"
          }
         if (const r2 = findSplitAfter(a, "Sagan"))
        {
            assert(r2);
            writeln(r2[0]); // "Carl Sagan"
            writeln(r2[1]); // " Memorial Station"
        }
        writeln([1, 2, 3, 4].findSplitBefore(only(3))[0]); // [1, 2]

        }
    }
}
