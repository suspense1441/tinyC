// Returning Values from Functions, checking Boolean and Algebraic Expressions

int printStr(char *c);
int printInt(int i);
int readInt(int *eP);

int addInt(int a, int b)
{
    int ans, *pq;
    int d = 2, c, arr[10];
    ans = a + b;
    d = 2;
    if (a > d && 2 * c != a)
    {
        a++;
    }
    else
    {
        c = a + 2 * b;
    }
    return ans;
}

int main()
{
    printStr("##################################################################################################################\n");
    int c = 2, d, arr[10];
    int *p;
    int x, y, z;
    int eP;
    printStr("Enter two numbers\n");
    printStr("Enter first number: ");
    x = readInt(&eP);
    printStr("Enter second number: ");
    y = readInt(&eP);
    z = addInt(x, y);
    printStr("Sum is equal to: ");
    printInt(z);
    printStr("\n");
    printStr("##################################################################################################################\n");
    return 0;
}