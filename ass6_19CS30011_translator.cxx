/**
 * Authors  : Tushar Kishor Bokade (19CS30011)
 *            Aditya Vallakatla (19CS30051)
 * Language : C++14
 * Desc     : Definations file for the functions of translation statements
 * Project  : TinyC
 * Course   : Compilers Laboratory
 */

#include "ass6_19CS30011_translator.h"
#include <sstream>
using namespace std;

//----------------------------------------------//
//              global variables                //
//          (Referance from the headers)        //
//----------------------------------------------//

quadArray q;                                                                            // Quad Array
string Type;                                                                            // Stores latest type
symtable * table;                                                                       // Points to current symbol table
sym * currentSymbol;                                                                    // points to current symbol
symtable * globalTable;                                                                 // Global Symbbol Table

//-----------------------------------------------------------//
//      Implementation of the Symbol Type Class functions    //
//-----------------------------------------------------------//

symtype::symtype(string type, symtype *ptr, int width):
	type(type),
	ptr(ptr),
	width(width) {};


//--------------------------------------------------//
//      Implementation of the quad functions        //
//--------------------------------------------------//

//----------------Constrtuctors overloaded----------------------

// --------- (string, string, string, string)

quad::quad(string result, string arg1, string op, string arg2):
	result(result), arg1(arg1), arg2(arg2), op(op) {};                                  // Constructor

// --------- (string, float, string, string)

quad::quad(string result, float arg1, string op, string arg2):
	result(result), arg2(arg2), op(op)
	{
		std::ostringstream buff;                                                        // Create an output stream buffer of string
		buff << arg1;                                                                   // convert float to string by passing it into string buffer
		this->arg1 = buff.str();                                                        // store the value in arg1
	}

// --------- (string, int, string, string)

quad::quad(string result, int arg1, string op, string arg2):
	result(result), arg2(arg2), op(op)                                                  // Constructor
	{
		stringstream strs;                                                              // create a string stream 
		strs << arg1;                                                                   // convert int to string by sending it into string stream
		string temp_str = strs.str();                                                   
		char *intStr = (char*) temp_str.c_str();                                        // convert the string stream to char array
		string str = string(intStr);                                                    
		this->arg1 = str;                                                               // store the value in arg1
	}


//------------- Helper function to print the quads -----------------
void quad::print()
{
	
    ///////////////////////////////////////
    //         SHIFT OPERATORS           //
    ///////////////////////////////////////
	
	if (op == "EQUAL") std::cout << result << " = " << arg1;
	else if (op == "LEFTOP") std::cout << result << " = " << arg1 << " << " << arg2;
	else if (op == "RIGHTOP") std::cout << result << " = " << arg1 << " >> " << arg2;
	
    ///////////////////////////////////////
    //          BINARY OPERATORS         //
    ///////////////////////////////////////

	else if (op == "MULT") std::cout << result << " = " << arg1 << " *" << arg2;
	else if (op == "DIVIDE") std::cout << result << " = " << arg1 << " / " << arg2;
	else if (op == "ADD") std::cout << result << " = " << arg1 << " + " << arg2;
	else if (op == "SUB") std::cout << result << " = " << arg1 << " - " << arg2;
	else if (op == "MODOP") std::cout << result << " = " << arg1 << " % " << arg2;
	else if (op == "XOR") std::cout << result << " = " << arg1 << " ^ " << arg2;
	else if (op == "INOR") std::cout << result << " = " << arg1 << " | " << arg2;
	else if (op == "BAND") std::cout << result << " = " << arg1 << " &" << arg2;

	///////////////////////////////////////
    //       RELATIONAL OPERATORS        //
    ///////////////////////////////////////
	
	else if (op == "LT") std::cout << "if " << arg1 << "<" << arg2 << " goto " << result;
	else if (op == "GT") std::cout << "if " << arg1 << " > " << arg2 << " goto " << result;
	else if (op == "GE") std::cout << "if " << arg1 << " >= " << arg2 << " goto " << result;
	else if (op == "LE") std::cout << "if " << arg1 << " <= " << arg2 << " goto " << result;
	else if (op == "EQOP") std::cout << "if " << arg1 << " == " << arg2 << " goto " << result;
	else if (op == "NEOP") std::cout << "if " << arg1 << " != " << arg2 << " goto " << result;
	else if (op == "GOTOOP") std::cout << "goto " << result;

    ///////////////////////////////////////
    //         UNARY OPERATORS           //
    ///////////////////////////////////////

	else if (op == "PTRR") std::cout << result << " = *" << arg1;
	else if (op == "PTRL") std::cout << "*" << result << " = " << arg1;
	else if (op == "UMINUS") std::cout << result << " = -" << arg1;
	else if (op == "ADDRESS") std::cout << result << " = &" << arg1;
	else if (op == "BNOT") std::cout << result << " = ~" << arg1;
	else if (op == "LNOT") std::cout << result << " = !" << arg1;

    ///////////////////////////////////////
    //         OTHER OPERATORS           //
    ///////////////////////////////////////

	else if (op == "ARRR") std::cout << result << " = " << arg1 << "[" << arg2 << "]";
	else if (op == "ARRL") std::cout << result << "[" << arg1 << "]" << " = " << arg2;
	else if (op == "PARAM") std::cout << "param " << result;
	else if (op == "CALL") std::cout << result << " = " << "call " << arg1 << ", " << arg2;
	else if (op == "FUNC") std::cout << result << ": ";
	else if (op == "FUNCEND") std::cout << "";
	else if (op == "RETURN") std::cout << "ret " << result;
	else std::cout << "op";
	std::cout << endl;
}

//--------------------------------------------------------------//
//        Implementation of the Quad Array Class functions      //
//--------------------------------------------------------------//

//------------------Print the elements of the Quad Array--------------------
void quadArray::print()
{
	std::cout << setw(30) << setfill('=') << "=" << endl;
	std::cout << "Quad Translation" << endl;
	std::cout << setw(30) << setfill('-') << "-" << setfill(' ') << endl;
	for (vector<quad>::iterator it = Array.begin(); it != Array.end(); it++)
	{
		if (it->op == "FUNC")
		{
			std::cout << "\n";
			it->print();
			std::cout << "\n";
		}
		else if (it->op == "FUNCEND") {}
		else
		{
			std::cout << "\t" << setw(4) << it - Array.begin() << ":\t";
			it->print();
		}
	}

	std::cout << setw(30) << setfill('-') << "-" << endl;
}

sym::sym(string name, string temp, symtype *p, int width): name(name)
{
	type = new symtype(temp, p, width);
	nested = NULL;
	initial_value = "";
	category = "";
	offset = 0;
	size = size_type(type);
}

sym *sym::update(symtype *p)
{
	type = p;
	this->size = size_type(p);
	return this;
}

symtable::symtable(string name): name(name), count(0) {}

void symtable::print()
{
	list<symtable*> tablelist;
	std::cout << setw(120) << setfill('=') << "=" << endl;
	std::cout << "Symbol Table: " << setfill(' ') << left << setw(50) << this->name;
	std::cout << right << setw(25) << "Parent: ";
	if (this->parent != NULL)
		std::cout << this->parent->name;
	else std::cout << "null";
	std::cout << endl;
	std::cout << setw(120) << setfill('-') << "-" << endl;
	std::cout << setfill(' ') << left << setw(15) << "Name";
	std::cout << left << setw(25) << "Type";
	std::cout << left << setw(15) << "Category";
	std::cout << left << setw(30) << "Initial Value";
	std::cout << left << setw(12) << "Size";
	std::cout << left << setw(12) << "Offset";
	std::cout << left << "Nested" << endl;
	std::cout << setw(120) << setfill('-') << "-" << setfill(' ') << endl;

	for (list<sym>::iterator it = table.begin(); it != table.end(); it++)
	{
		std::cout << left << setw(15) << it->name;
		string stype = print_type(it->type);
		std::cout << left << setw(25) << stype;
		std::cout << left << setw(15) << it->category;
		std::cout << left << setw(30) << it->initial_value;
		std::cout << left << setw(12) << it->size;
		std::cout << left << setw(12) << it->offset;
		std::cout << left;
		if (it->nested == NULL)
		{
			std::cout << "null" << endl;
		}
		else
		{
			std::cout << it->nested->name << endl;
			tablelist.push_back(it->nested);
		}
	}

	std::cout << setw(120) << setfill('-') << "-" << setfill(' ') << endl;
	std::cout << endl;
	for (list<symtable*>::iterator iterator = tablelist.begin(); iterator != tablelist.end();
		++iterator)
	{
		(*iterator)->print();
	}
}

sym *symtable::lookup(string name)
{
	sym * s;
	for (list<sym>::iterator it = table.begin(); it != table.end(); it++)
	{
		if (it->name == name) return &*it;;
	}

	// ----------- new symbol to be added to table ---------------
	s = new sym(name);
	s->category = "local";
	table.push_back(*s);
	return &table.back();
}

void symtable::update()
{
	list<symtable*> tablelist;
	int off=0;
	for (list<sym>::iterator it = table.begin(); it != table.end(); it++)
	{
		it->offset = off;
		off = it->offset + it->size;	
		if (it->nested != NULL) tablelist.push_back(it->nested);
	}

	for (list<symtable*>::iterator iterator = tablelist.begin(); iterator != tablelist.end(); ++iterator)
	{
		(*iterator)->update();
	}
}

//------------------------------------------------------------------//
//          Overloaded emit function used by the parser             //
//------------------------------------------------------------------//

//----------------- Emit a three address code TAC and add it to the Quad Array ------------

void emit(string op, string result, int arg1, string arg2)
{
	q.Array.push_back(*(new quad(result, arg1, op, arg2)));
}

void emit(string op, string result, string arg1, string arg2)
{
	q.Array.push_back(*(new quad(result, arg1, op, arg2)));
}

void emit(string op, string result, float arg1, string arg2)
{
	q.Array.push_back(*(new quad(result, arg1, op, arg2)));
}

sym* conv(sym *s, string str)
{
	sym *temp = gentemp(new symtype(str));
	if (s->type->type == "INTEGER")
	{
		if (str == "DOUBLE")
		{
			emit("EQUAL", temp->name, "int2double(" + s->name + ")");
			return temp;
		}
		else if (str == "CHAR")
		{
			emit("EQUAL", temp->name, "int2char(" + s->name + ")");
			return temp;
		}

		return s;
	}
	else if (s->type->type == "DOUBLE")
	{
		if (str == "INTEGER")
		{
			emit("EQUAL", temp->name, "double2int(" + s->name + ")");
			return temp;
		}
		else if (str == "CHAR")
		{
			emit("EQUAL", temp->name, "double2char(" + s->name + ")");
			return temp;
		}

		return s;
	}
	else if (s->type->type == "CHAR")
	{
		if (str == "INTEGER")
		{
			emit("EQUAL", temp->name, "char2int(" + s->name + ")");
			return temp;
		}

		if (str == "DOUBLE")
		{
			emit("EQUAL", temp->name, "char2double(" + s->name + ")");
			return temp;
		}

		return s;
	}

	return s;
}

bool typecheck(symtype *t1, symtype *t2)
{
	// Check if the symbol types are same or not
	if (t1 != NULL || t2 != NULL)
	{
		if (t1 == NULL) return false;
		if (t2 == NULL) return false;
		if (t1->type == t2->type) return typecheck(t1->ptr, t2->ptr);
		else return false;
	}

	return true;
}

bool typecheck(sym* &s1, sym* &s2)
{
	// Check if the symbols have same type or not
	symtype *type1 = s1->type;
	symtype *type2 = s2->type;
	if (typecheck(type1, type2)) return true;
	else if (s1 = conv(s1, type2->type)) return true;
	else if (s2 = conv(s2, type1->type)) return true;
	else return false;
}

//-------------------------------------------------------------//
//            Backpatching and related functions               //
//-------------------------------------------------------------//

void backpatch(list<int> l, int addr)
{
	stringstream strs;
	strs << addr;
	string temp_str = strs.str();
	char *intStr = (char*) temp_str.c_str();                                                    // convert std::string stream to char array
	string str = string(intStr);                                                                // create a string stream of the integer address
	for (list<int>::iterator it = l.begin(); it != l.end(); it++)                               
	{                                                                                           // backpatch the statement with the current address
		q.Array[*it].result = str;
	}
}

list<int> merge(list<int> &a, list<int> &b)
{
	a.merge(b);                                                                                   // merge the list b into list a
	return a;                                                                                     // return the merged list
}

list<int> makelist(int i)
{
	list<int> l(1, i);                                                                           // make a list with the currrent address
	return l;                                                                                    // return the list
}


//----------------------------------------------------------------------//
//          Other helper functions required for TAC generation          //
//----------------------------------------------------------------------//

//------------- Type checking and Type conversion functions -------------

expr* convertBool2Int(expr *e)
{
	// Convert any expression to bool
	if (e->type == "BOOL")
	{
		e->loc = gentemp(new symtype("INTEGER"));
		backpatch(e->truelist, nextinstr());
		emit("EQUAL", e->loc->name, "true");
		stringstream strs;
		strs << nextinstr() + 1;
		string temp_str = strs.str();
		char *intStr = (char*) temp_str.c_str();
		string str = string(intStr);
		emit("GOTOOP", str);
		backpatch(e->falselist, nextinstr());
		emit("EQUAL", e->loc->name, "false");
	}

	return e;
}

expr* convertInt2Bool(expr *e)                                                                     // convert an input expression into boolewan expression
{
	// Convert any expression to bool
	if (e->type != "BOOL")                                                                         // Do the conversion only if the type is not already bool
	{
		e->falselist = makelist(nextinstr());
		emit("EQOP", "", e->loc->name, "0");
		e->truelist = makelist(nextinstr());
		emit("GOTOOP", "");
	}

	return e;
}

void changeTable(symtable *newtable)
{
	// Change current symbol table
	table = newtable;
}

int nextinstr()
{
	return q.Array.size();
}


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

sym* gentemp(symtype *t, string str)
{
	char n[10];
	sprintf(n, "t%02d", table->count++);
	sym *s = new sym(n);
	s->type = t;
	s->size = size_type(t);
	s->initial_value = str;
	s->category = "temp";
	table->table.push_back(*s);
	return &table->table.back();
}


//----------------------------------------------------------------------//
//           Other helper function for debugging and printing           //
//----------------------------------------------------------------------//

string print_type(symtype *t)
{
	if (t == NULL) return "null";
	if (t->type == "VOID") return "void";
	else if (t->type == "CHAR") return "char";
	else if (t->type == "INTEGER") return "integer";
	else if (t->type == "DOUBLE") return "double";
	else if (t->type == "PTR") return "ptr(" + print_type(t->ptr) + ")";
	else if (t->type == "ARR")
	{
		stringstream strs;
		strs << t->width;
		string temp_str = strs.str();
		char *intStr = (char*) temp_str.c_str();
		string str = string(intStr);
		return "arr(" + str + ", " + print_type(t->ptr) + ")";
	}
	else if (t->type == "FUNC") return "function";
	else return "_";
}

int size_type(symtype *t)
{
	if (t->type == "VOID") return 0;
	else if (t->type == "ARR") return t->width* size_type(t->ptr);
	else if (t->type == "PTR") return POINTER_SIZE;
	else if (t->type == "CHAR") return CHAR_SIZE;
	else if (t->type == "FUNC") return 0;
	else if (t->type == "DOUBLE") return DOUBLE_SIZE;
	else if (t->type == "INTEGER") return INT_SIZE;
	return -1;
}
