//This testfile checks the functioning of the library functions printInt, readInt and printStr

int printInt(int num);
int printStr(char * c);
int readInt(int *eP);

// user-defined function (with pointer parameters)
// return an int value
int test(int *a)
{
    printStr("Value stored in pointer argument: ");
    printInt(a);
    printStr("\n");
    return a;
}

int main()
{
    int a,b;
    int *e;
    printStr("###################################################################################\n");

    printStr("TESTING FUNCTIONS WITH POINTER ARGUMENTS:\n");
    
    
    b = 3;
    e = &b;

    // checking printStr() and printStr()
    printStr("Passing parameter to function : int test(int *a)    \n");
    printStr("Value passed to function: ");
    printInt(b);
    printStr("\n");
    
    a = test(b);
    printStr("Value returned from function is: ");
    printInt(a);
    printStr("\n");
    
    printStr("###################################################################################\n");
    

    return 0;
}