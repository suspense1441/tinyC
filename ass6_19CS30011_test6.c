int printStr(char *c);
int readInt(int *ep);
int printInt(int i);

int pow(int a,int b){
  int val;
  if(b==0)val = 1;
  else if(b==1)val = a;
  else val = a*pow(a,b-1);
  return val;
}

int main() {
  int i,j=5,c;
  int *b = &c;
  printStr("###################################################################################\n");
  printStr("CALCULATING a^b USING RECURSIVE FUNCTION:\n");
  
  printStr("Enter the BASE     : ");
  i = readInt(b);
  printStr("Enter the EXPONENT : ");
  j = readInt(b);
  c=pow(i,j);
  printStr("The value of ");
  printInt(i);
  printStr("^");
  printInt(j);
  printStr(" is : ");
  printInt(c);
  printStr("\n");
  printStr("###################################################################################\n");
  return 0;
}
