module matrix.gnu.bin.dlang.skip;

import std.algorithm.comparison : equal;
import std.ascii : isWhite;
import std.range.primitives : empty;
import std.ascii : isWhite;
import std.ascii : isAlpha;
import std.algorithm.comparison : among;
import std.typecons : Tuple;
import std.typecons : No;

/** 
Skip over the initial portion of the first given range (haystack) that matches any of the additionally given ranges (needles) fully, or if no second range is given skip over the elements that fulfill pred. Do nothing if there is no match.
Parameters:
pred 	The predicate that determines whether elements from each respective range match. Defaults to equality "a == b".
Examples:**/ 

class MyMatrixGNUBinDlangSkip
{
    interface MySkip
    {
        void skip(const char String, char siriol)(ref siriol)
        {
           
           auto s1 = "Hello world";
           assert(!skipOver(s1, "Ha"));
           writeln(s1); // "Hello world"
           assert(skipOver(s1, "Hell") && s1 == "o world", s1);

           string[]  r1 = ["abc", "def", "hij"];
           dstring[] r2 = ["abc"d];
           assert(!skipOver!((a, b) => a.equal(b))(r1, ["def"d]), r1[0]);
           writeln(r1); // ["abc", "def", "hij"]
           assert(skipOver!((a, b) => a.equal(b))(r1, r2));
           writeln(r1); // ["def", "hij"]


           auto s2 = "\t\tvalue";
           auto s3 = "";
           auto s4 = "\t\t\t";
           assert(s2.skipOver!isWhite && s2 == "value");
           assert(!s3.skipOver!isWhite);
           assert(s4.skipOver!isWhite && s3.empty);

            auto s = "Hello world";
            assert(!skipOver(s, "hello", "HellO"));
            writeln(s); // "Hello world"

            // the range is skipped over the longest matching needle is skipped
            assert(skipOver(s, "foo", "hell", "Hello "));
            writeln(s); // "world"


            auto s1 = "Hello world";
            assert(!skipOver(s1, 'a'));
            writeln(s1); // "Hello world"
            assert(skipOver(s1, 'H') && s1 == "ello world");

            string[] r = ["abc", "def", "hij"];
            dstring e = "abc"d;
            assert(!skipOver!((a, b) => a.equal(b))(r, "def"d));
            writeln(r); // ["abc", "def", "hij"]
            assert(skipOver!((a, b) => a.equal(b))(r, e));
            writeln(r); // ["def", "hij"]

            auto s2 = "";
            assert(!s2.skipOver('a'));


            alias whitespaceSkiper = skipOver!isWhite;

            auto s2 = "\t\tvalue";
            auto s3 = "";
            auto s4 = "\t\t\t";
            assert(whitespaceSkiper(s2) && s2 == "value");
            assert(!whitespaceSkiper(s2));
            assert(whitespaceSkiper(s4) && s3.empty);

            bool skipOver(Haystack, Needles...)(ref Haystack haystack, Needles needles)
            if (is(typeof(binaryFun!pred(haystack.front, needles[0].front))) && isForwardRange!Haystack && allSatisfy);

            bool skipOver(R)(ref R r1)
            if (isForwardRange!R && ifTestable!(typeof(r1.front), unaryFun!pred));

            bool skipOver(R, Es...)(ref R r, Es es)
            if (isInputRange!R && is(typeof(binaryFun!pred(r.front, es[0]))));

            uint startsWith(alias pred = (a, b) => a == b, Range, Needles...)(Range doesThisStart, Needles)
            if (isInputRange!Range && (Needles.length > 1) && allSatisfy!(canTestStartsWith!(pred, Range), Needles));

            bool startsWith(alias pred = "a == b", R1, R2)(R1 doesThisStart, R2 withThis)
            if (isInputRange!R1 && isInputRange!R2 && is(typeof(binaryFun!pred(doesThisStart.front, withThis.front))));

            bool startsWith(alias pred = "a == b", R, E)(R doesThisStart, E withThis)
            if (isInputRange!R && is(typeof(binaryFun!pred(doesThisStart.front, withThis)) : bool));

            bool startsWith(alias pred, R)(R doesThisStart)
            if (isInputRange!R && ifTestable!(typeof(doesThisStart.front), unaryFun!pred));


            assert("abc".startsWith!(a => a.isAlpha));
            assert("abc".startsWith!isAlpha);
            assert(!"1ab".startsWith!(a => a.isAlpha));
            assert(!"".startsWith!(a => a.isAlpha));

            assert("abc".startsWith!(a => a.among('a', 'b') != 0));
            assert(!"abc".startsWith!(a => a.among('b', 'c') != 0));

            assert(startsWith("abc", ""));
            assert(startsWith("abc", "a"));
            assert(!startsWith("abc", "b"));
            writeln(startsWith("abc", 'a', "b")); // 1
            writeln(startsWith("abc", "b", "a")); // 2
            writeln(startsWith("abc", "a", "a")); // 1
            writeln(startsWith("abc", "ab", "a")); // 2
            writeln(startsWith("abc", "x", "a", "b")); // 2
            writeln(startsWith("abc", "x", "aa", "ab")); // 3
            writeln(startsWith("abc", "x", "aaa", "sab")); // 0
            writeln(startsWith("abc", "x", "aaa", "a", "sab")); // 3

            alias C = Tuple!(int, "x", int, "y");
            assert(startsWith!"a.x == b"([ C(1,1), C(1,2), C(2,2) ], [1, 1]));
            writeln(startsWith!"a.x == b"([C(1, 1), C(2, 1), C(2, 2)], [1, 1], [1, 2], [1, 3])); // 2

            Until!(pred, Range, Sentinel) until(alias pred = "a == b", Range, Sentinel)(Range range, Sentinel sentinel)
            if (!is(Sentinel == OpenRight));

            Until!(pred, Range, void) until(alias pred, Range)(Range range, OpenRight openRight = Yes.openRight);

            int[] a = [ 1, 2, 4, 7, 7, 2, 4, 7, 3, 5];
            assert(equal(a.until(7), [1, 2, 4]));
            assert(equal(a.until(7, No.openRight), [1, 2, 4, 7]));


        } 
    }
}