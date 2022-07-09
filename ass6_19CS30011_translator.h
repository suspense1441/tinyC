
/**
 * Authors  : Tushar Kishor Bokade (19CS30011)
 *            Aditya Vallakatla (19CS30051)
 * Language : C++14
 * Desc     : header file for the translation statements
 * Project  : TinyC
 * Course   : Compilers Laboratory
 */


#ifndef TRANSLATE
#define TRANSLATE
#include <bits/stdc++.h>

#define CHAR_SIZE          1
#define INT_SIZE           4
#define POINTER_SIZE       4
#define DOUBLE_SIZE        8

using namespace std;

extern char *yytext;
extern int yyparse();


//--------------------------------------------------//
//                  Class Declarations              //
//--------------------------------------------------//

class sym;	                                                                     // class for storing Entry in a symbol table
class symtype;                                                                   // class for storing Type of a symbol in symbol table
class symtable;                                                                  // class for storing Symbol Table
class quad;                                                                      // class for storing Entry in quad Array
class quadArray;	                                                             // class for storing QuadArray

//----------------------------------------------//
//              global variables                //
//----------------------------------------------//

extern symtable * table;                                                          // Current Symbbol Table
extern sym * currentSymbol;                                                       // Pointer to just encountered symbol
extern symtable * globalTable;                                                    // Global Symbbol Table
extern quadArray q;                                                               // Array of Quads


//--------------------------------------------------//
//      Defination of the type of symbol            //
//--------------------------------------------------//

class symtype
{                                                                                 // Type of symbols in symbol table
	public:
	
	symtype(string type, symtype *ptr = NULL, int width = 1);
	string type;
	int width;                                                                    // Size of Array (in case of Arrays)
	symtype * ptr;                                                                // for 2d Arrays and pointers
};

//----------------------------------------------------------//
//          Defination of the quad array type               //
//----------------------------------------------------------//

class quadArray
{                                                                                  // Array of quads
	public:
	
	vector<quad> Array;                                                            // Vector of quads
	void print();                                                                  // Print the quadArray
};

//----------------------------------------------------------------------//
//      Defination of structure of each element of the symbol table     //
//----------------------------------------------------------------------//

class sym
{                                                                                  // Symbols class
	public:
		
	string name;                                                                   // Name of the symbol
	symtype * type;                                                                // Type of the Symbol
	string initial_value;                                                          // Symbol initial valus (if any)
	string category;                                                               // global, local or param
	int size;                                                                      
	int offset;                                                                    
	symtable * nested;                                                             // Pointer to nested symbol table

	sym(string name, string t = "INTEGER", symtype *ptr = NULL, int width = 0);    
	sym* update(symtype *t);                                                       // A method to update different fields of an existing entry.
	sym* link_to_symbolTable(symtable *t);
};

//--------------------------------------------------//
//      Defination of the struct of quad element    //
//--------------------------------------------------//

class quad
{                                                                                  // Quad Class
	public:
		
	string op;                                                                     // Operator
	string result;                                                                 // Result
	string arg1;                                                                   
	string arg2;                                                                   

	void print();                                                                  // Print Quad
	quad(string result, string arg1, string op = "EQUAL", string arg2 = "");       
	quad(string result, int arg1, string op = "EQUAL", string arg2 = "");          
	quad(string result, float arg1, string op = "EQUAL", string arg2 = "");        
};



//------------------------------------------------------//
//          Class defination for the Symbol Table       //
//------------------------------------------------------//
class symtable
{                                                                                  // Symbol Table class
	public:
		
	string name;                                                                   // Name of Table
	int count;                                                                     // Count of temporary variables
	list<sym> table;                                                               // The table of symbols
	symtable * parent;                                                             // Immediate parent of the symbol table
	map<string, int> ar;                                                           
	symtable(string name = "NULL");
	sym* lookup(string name);                                                      // Lookup for a symbol in symbol table
	void print();                                                                  // Print the symbol table
	void update();                                                                 // Update offset of the complete symbol table
};

//------------------------------------------------------//
//          Class defination for the Statements         //
//------------------------------------------------------//

struct statement
{
	list<int> nextlist;	                                                           // Nextlist for statement
};

//--------------------------------------------------------------//
//          Attributes of the array type element                //
//--------------------------------------------------------------//

struct Array
{
	string cat;
	sym * loc;                                                                     // Temporary used for computing Array address
	sym * Array;                                                                   // Pointer to symbol table
	symtype * type;                                                                // type of the subArray generated
};

//----------------------------------------------//
//     Defination of the expression type        //
//----------------------------------------------//
struct expr
{
	string type;	                                                               // to store whether the expression is of type int or bool

	// -------- Valid for non-bool type ----------
	sym * loc;                                                                     // Pointer to the symbol table entry

	// ------------- Valid for bool type ----------
	list<int> truelist;                                                           
	list<int> falselist;                                                           

	//------- Valid for statement expression ------
	list<int> nextlist;
};

/**
 * GENTEMP
 * -------
 * generates a temporary variable 
 * and insert it in the current 
 * Symbole table 
 * 
 * Parameter
 * ---------
 * symbol type * : pointer to the 
 *                 class of symbol type
 * init : initial value of the structure
 * 
 * Return
 * ------
 * Pointer to the newly created symbol 
 * table entry
 */
sym* gentemp(symtype *t, string init = "");

//------------------------------------------------------------------//
//          Overloaded emit function used by the parser             //
//------------------------------------------------------------------//

//----------------Global functions required for the translator----------------

void emit(string op, string result, int arg1, string arg2 = "");                   // emits for adding quads to quadArray (arg1 is int)
void emit(string op, string result, string arg1 = "", string arg2 = "");	       // emits for adding quads to quadArray
void emit(string op, string result, float arg1, string arg2 = "");                 // emits for adding quads to quadArray (arg1 is float)

//-------------------------------------------------------------//
//            Backpatching and related functions               //
//-------------------------------------------------------------//

void backpatch(list<int> lst, int i);
list<int> makelist(int i);                                                         // Make a new list contaninig an integer
list<int> merge(list<int> &lst1, list<int> &lst2);                                 // Merge two lists 

//----------------------------------------------------------------------//
//          Other helper functions required for TAC generation          //
//----------------------------------------------------------------------//

sym* conv(sym *, string);                                                          // TAC for Type conversion in program
bool typecheck(symtype *t1, symtype *t2);                                          // checks if two symtype objects have same type
bool typecheck(sym* &s1, sym* &s2);                                                // Checks if two symbols have same type

expr* convertBool2Int(expr*);                                                      
expr* convertInt2Bool(expr*);                                                      

void changeTable(symtable *newtable);                                              // for changing the current sybol table
int nextinstr();                                                                   // Returns the next instruction number

//----------------------------------------------------------------------//
//           Other helper function for debugging and printing           //
//----------------------------------------------------------------------//

string print_type(symtype*);                                                       // For printing type of symbol recursive printing of type
int size_type(symtype*);                                                           // Calculate size of any symbol type 

#endif
