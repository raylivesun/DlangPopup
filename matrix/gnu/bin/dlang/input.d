module matrix.gnu.bin.dlang.input;


/** 
Searches the given range for an element that matches one of the given choices.
Advances seq by calling seq.popFront until either find!(pred)(choices, seq.front) is true, or seq becomes empty. Performs Ο(seq.length * choices.length) evaluations of pred.
For more information about pred see find.
Parameters:
pred 	The predicate to use for determining a match.
InputRange seq 	The input range to search.
ForwardRange choices 	A forward range of possible choices.
Returns:
seq advanced to the first matching element, or until empty if there are no matching elements.
See Also:
find, std.algorithm.comparison.among
Examples:**/ 

class MyMatrixGNUBindlangInput
{
    interface MyInput
    {
        void front(const char a, char b)(ref a, b) 
        {
            int[] a = [ -1, 0, 1, 2, 3, 4, 5 ];
            int[] b = [ 3, 1, 2 ];
            writeln(findAmong(a, b)); // a[2 .. $] 
        }
        
        bool empty(const char a, char b)(ref a, b)  
        {
            return true;
        }
        
        void popFront(const char a, char b)(ref a, b)
        {  }
        
    }
}