int addASM(int,int);
int multiplyASM(int,int);
double gettotalASM(const double *,int);
void swapASM(int *, int *);
int getmaxASM(const int *, int );

/*using clue:

	FLOATS __declspec(align(16)) f1 = { 10.1, 10.2, 10.3, 10.4, 10.5, 10.6, 10.7, 10.8 }, f2 = { 10.1, 10.2, 10.3, 10.4, 10.5, 10.6, 10.7, 10.8 }, f3;

	AddPacked(&f1, &f2, &f3);

	printf("%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n", f3.a, f3.b, f3.c, f3.d, f3.e, f3.f, f3.g, f3.h); 

*/
void AddPacked(const FLOATS *f1, const FLOATS *f2, FLOATS *f3);



