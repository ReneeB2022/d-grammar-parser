
import language.grammar;
import language.symbols;

import utility.print;

import std.stdio;
import std.string;
import std.regex;

//checker confirms that the value inputed by the user is correct 
void checker(string input)
{
auto rez = regex(r"\b(?:HI|BYE|fill|line|bar)\b|[A-Za-z]|\d+|[;,]");
   
   string[] arr;
		
   		foreach (m; matchAll(input, rez)) {
        string token = m.hit.strip;
        if (!token.empty)
            arr ~= token;
   		 }
	writeln(arr);

foreach (key; arr)
{
	bool ishere=false;

foreach (member;__traits(allMembers, Terminal))
{
	auto value= __traits(getMember,Terminal, member);

	if(key ==value)
	{
		ishere=true;
		break;
	}

}
if(ishere==false)
{
	writeln("Error " , key," is not a valid item");
	break;
	//remove this break if you want it to check the entire array and identify all errors
}
}
}
// Slicer brakes them up => ["HI","bar D4,2","fill A2","BYE"]
string [] slicer(string array)
{
		auto re = regex(r"\b(HI|BYE)\b|[^;]+?(?=(\s*\b(?:HI|BYE)\b|;|$))");
    	string[] tokens;
		
   		foreach (m; matchAll(array, re)) {
        string token = m.hit.strip;
        if (!token.empty)
            tokens ~= token;
   		 }
 return tokens;
}

void main()
{
	utility.print.introduction();
	utility.print.grammar(language.grammar.rules);
	

	// continually prompt for input
	//while (true)
	//{
		write("Enter input ('END' to exit): ");
		
		string userinput=readln();
		
		checker(userinput);
		
		string [] prompt= slicer(userinput);
		writeln(prompt);

		

		// break condition on "END"
	//	if (input == "END" || input == "end") 
	//	{
			//break;
	//	}
	//}
}
