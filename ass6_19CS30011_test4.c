// Testing Recursive Functions with If Else

int printStr(char *c);
int printInt(int i);
int readInt(int *eP);

int fib(int a)
{
    long b = a - 1, c, d;
    if (b <= 0)
    {
        c = 1;
    }
    else
    {
        c = fib(b);
        b = b - 1;
        d = fib(b);
        c = c + d;
    }
    return c;
}

int main()
{
    printStr("##################################################################################################################\n");
    int n;
    int err = 1;
    printStr("Program to compute fibonacci number\n");
    printStr("Enter a Number: ");
    n = readInt(&err);
    printStr("\nNth fibonacci number is: ");
    long p;
    p = fib(n);
    printInt(p);
    printStr("\n");
    printStr("##################################################################################################################\n");
    return 0;
}