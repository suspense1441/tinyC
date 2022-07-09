%{
	/**
	* Authors  : Tushar Kishor Bokade (19CS30011) 
	*            Aditya Vallakatla (19CS30051)
	* Language : C++14
	* Desc     : header file for the translation statements
	* Project  : TinyC
	* Course   : Compilers Laboratory
	*/

	#include <stdio.h>
	#include <string.h>
	#include "ass6_19CS30011_translator.h"
	#include "ass6_19CS30011.tab.h"
    extern YYSTYPE yylval;
    extern int line;
    int line = 1;
%}
/*Definition of regular expression*/

%option noyywrap


/* Regular Expression Definations */
LETTER          [a-zA-Z]
NON_ZERO        [1-9]
DIGIT           [0-9]
DIGIT_SEQ       {DIGIT}{DIGIT}*
ESCAPE_SEQ      "\\\'"|"\\\""|"\\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"
C_CHAR          [^\'\\\n]|{ESCAPE_SEQ}
CHAR_SEQ        {C_CHAR}{C_CHAR}*
S_CHAR          [^\"\\\n]|{ESCAPE_SEQ}
STRING_SEQ      {S_CHAR}{S_CHAR}*

IDENTIFIER      ({LETTER}|"_")({LETTER}|{DIGIT}|"_")*

FRAC            {DIGIT_SEQ}\.|\.{DIGIT_SEQ}|{DIGIT_SEQ}\.{DIGIT_SEQ}
FLOAT_CONST     ({FRAC}|{DIGIT_SEQ})([Ee]([-+]{DIGIT_SEQ}|{DIGIT_SEQ}))|{FRAC}|"0"*\."0"*
CHAR_CONST      \'{CHAR_SEQ}\'
INT_CONST       {NON_ZERO}{DIGIT}*|"0"+

STRING          \"{STRING_SEQ}\"|\"\"
COMMENT_LINE    "//".*
COMMENT_MULTI   "/*"([^*]|\*+[^/*])*\**(\*"/")? 
WS              [ \t]
NEWLINE         [\n]

%%

{COMMENT_LINE}          { /*printf("This single line comment will be ignored by the parser\n");*/ }
{COMMENT_MULTI}         { /*printf("This multi line comment will be ignored by the parser\n");*/  }

"if"                    { return IF;       }
"do"                    { return DO;       }
"for"                   { return FOR;      }
"int"                   { return INT;      }
"char"                  { return CHAR;     }
"short"                 { return SHORT;    }
"float"                 { return FLOAT;    }
"break"                 { return BREAK;    }
"const"                 { return CONST;    }
"union"                 { return UNION;    }
"while"                 { return WHILE;    }
"switch"                { return SWITCH;   }
"long"                  { return LONG;     }
"else"                  { return ELSE;     }
"case"                  { return CASE;     }
"default"               { return DEFAULT;  }
"inline"                { return INLINE;   }
"goto"                  { return GOTO;     }
"void"                  { return VOID;     }
"static"                { return STATIC;   }
"struct"                { return STRUCT;   }
"double"                { return DOUBLE;   }
"extern"                { return EXTERN;   }
"sizeof"                { return SIZEOF;   }
"return"                { return RETURN;   }
"typedef"               { return TYPEDEF;  }
"volatile"              { return VOLATILE; }
"restrict"              { return RESTRICT; }
"continue"              { return CONTINUE; }

"["                     { return SQBRAOPEN;   }
"]"                     { return SQBRACLOSE;  }
"("                     { return ROBRAOPEN;   }
")"                     { return ROBRACLOSE;  }
"{"                     { return CURBRAOPEN;  }
"}"                     { return CURBRACLOSE; }

"..."                   { return DOTS;     }
"<<="                   { return SHLEQ;    }
">>="                   { return SHREQ;    }
"++"                    { return INC;      }
"--"                    { return DEC;      }
"->"                    { return ACC;      }
"<<"                    { return SHL;      }
">>"                    { return SHR;      }
"*="                    { return STAREQ;   }
"/="                    { return DIVEQ;    }
"%="                    { return MODEQ;    }
"+="                    { return PLUSEQ;   }
"-="                    { return MINUSEQ;  }
"&="                    { return BINANDEQ; }
"^="                    { return BINXOREQ; }
"|="                    { return BINOREQ;  }
"<="                    { return LTE;      }
">="                    { return GTE;      }
"=="                    { return EQ;       }
"!="                    { return NEQ;      }
"&&"                    { return AND;      }
"||"                    { return OR;       }


";"                     { return SEMICOLON; }

"."                     { return DOT;       }
"&"                     { return AMP;       }
"*"                     { return MUL;       }
"|"                     { return BITOR; 	}
","                     { return COMMA;     }
"="                     { return ASSIGN;    }
"<"                     { return BITSHL;    }
"^"                     { return BITXOR;	}
">"                     { return BITSHR;    }
"+"                     { return ADD;       }
"-"                     { return SUB;       }
"~"                     { return NEG;       }
"/"                     { return DIV;       }
"#"                     { return HASH;      }
":"                     { return COLON;     }
"%"                     { return MODULO;    }
"!"                     { return EXCLAIM;   }
"?"                     { return QUESTION;  }

{INT_CONST}             { 
	                        yylval.intval = atoi(yytext);
							return INTEGER_CONSTANT; /* Constant Rule */ 
                        }
{CHAR_CONST}            { 
	                        yylval.charval = yytext;
							return CHARACTER_CONSTANT; /* Constant Rule */ 
						}
{FLOAT_CONST}           { 
	                        yylval.charval = yytext;
	                        return FLOATING_CONSTANT; /* Constant Rule */ 
						}

{IDENTIFIER}            { 
	                        yylval.symp = table->lookup(yytext);
							return IDENTIFIER; /* Identifier Rule */ 
						}

{STRING}                { 
	                        yylval.charval = yytext;
							return STRING_LITERAL; /* String-literal */ 
						}

{WS}                    { /*White-space Rule*/ }

{NEWLINE}               { /* printf("\n\n============================== Parsing line %d ============================== \n\n", ++line ); */ }

%%
