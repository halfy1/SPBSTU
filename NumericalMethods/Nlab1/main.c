#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void max_ot_uzl( FILE*f, double rav, double cheb, double uzl, double rav2, double cheb2){
    fprintf(f, "%0.20lf;%0.20lf;%0.20lf;%0.20lf;%0.20lf\n", uzl,  rav, cheb, rav2, cheb2);
}

typedef struct {
    double a;
    double b;
}otr;

double func(double x){
    return (x * log(x+1));
}


double func2(double x){
    return fabs(x);
}

void un_grid(otr X, int n, double *valx, double *valy, double (*f)(double)) {
    for (int i = 0; i < n; i++) {
        valx[i] = X.a + (X.b - X.a) * i / n;
        valy[i] = f(valx[i]);
    }
}

void ch_grid(otr X, int n, double *CHvalx, double *CHvaly, double (*f)(double)) {
    for (int k = 0; k < n; k++) {
        CHvalx[k] = (X.a + X.b) / 2 + (X.b - X.a) * cos(M_PI * (2 * k + 1) / (2 * (n))) / 2;
        CHvaly[k] = f(CHvalx[k]);
    }
}

double getmax( double *ar, int n ){
    double max = 0;
    for(int i = 0; i < n; i++){
        if(max < ar[i]){
            max = ar[i];
        }
    }
    return max;
}
double Lagrange( int n, double *valx, double *valy, double x){
    double L = 0;
    for( int i = 0; i < n; i++){
        double res = 1;
        for( int k  = 0; k < n; k++)
            if( k != i){
                res *= (x - valx[k])/(valx[i] - valx[k]);
            }
        L += valy[i]*res;
    }
    return L;
}
int main(void){
    otr A = { -0.5, 0.5};
    FILE* f = fopen("main.csv", "w");
    for( int n = 1; n < 59; n++){
        double *Nvalx = malloc(sizeof(double)*n);
        double *Nvaly = malloc(sizeof(double)*n);

        double *CHvalx = malloc(sizeof(double)*n);
        double *CHvaly = malloc(sizeof(double)*n);

        double *Nvalx2 = malloc(sizeof(double)*n);
        double *Nvaly2 = malloc(sizeof(double)*n);

        double *CHvalx2 = malloc(sizeof(double)*n);
        double *CHvaly2 = malloc(sizeof(double)*n);

        un_grid(A, n, Nvalx, Nvaly, func);
        ch_grid(A, n, CHvalx, CHvaly, func);

        un_grid(A, n, Nvalx2, Nvaly2, func2);
        ch_grid(A, n, CHvalx2, CHvaly2, func2);

        double ravpogr[10];
        double chpogr[10];

        double ravpogr2[10];
        double chpogr2[10];

        int i=1;
        for(i=1; i < 10; i++){

            double rav = Lagrange(n, Nvalx, Nvaly, (A.a+0.02*i));
            double cheb = Lagrange(n, CHvalx, CHvaly, (A.a+0.02*i));
            double basic = func((A.a+0.02*i));

            double rav2 = Lagrange(n, Nvalx2, Nvaly2, (A.a+0.02*i));
            double cheb2 = Lagrange(n, CHvalx2, CHvaly2, (A.a+0.02*i));
            double basic2 = func2((A.a+0.02*i));

            ravpogr[i-1] = fabs(basic - rav);
            chpogr[i-1] = fabs(basic - cheb);

            ravpogr2[i-1] = fabs(basic2 - rav2);
            chpogr2[i-1] = fabs(basic2 - cheb2);

        }

        double un_max = getmax(ravpogr, i-1);
        double ch_max = getmax(chpogr, i-1);

        double un_max2 = getmax(ravpogr2, i-1);
        double ch_max2 = getmax(chpogr2, i-1);

        max_ot_uzl(f, un_max, ch_max, n, un_max2, ch_max2);

    }



    

    return 0;
}