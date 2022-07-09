// Testing Recursive Functions, readInt, printStr

int printInt(int num);
int printStr(char *c);
int readInt(int *eP);

int gcd(int a, int b)
{
    int c, d, e;
    if (b == 0)
    {
        c = a;
    }
    else
    {
        d = a;
        e = b;
        d = a - b * (a / b);
        c = gcd(b, d);
    }
    return c;
}

int main()
{
    printStr("##################################################################################################################\n");
    int i, n, m, l;
    int err = 1;
    printStr("This Program implements LCM\n");
    printStr("Enter 2 Integers to Find the GCD: \n");
    n = readInt(&err);
    m = readInt(&err);
    l = gcd(n, m);
    printStr("GCD of given numbers is: ");
    printInt(l);
    printStr("\n");
    printStr("##################################################################################################################\n");
    return 0;
}