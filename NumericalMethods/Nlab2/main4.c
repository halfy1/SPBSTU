#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Функция для вычисления значения x*log(x+1)
double f1(double x) {
    return x * log(x + 1);
}

// Функция для вычисления значения |x|
double f2(double x) {
    return fabs(x);
}

// Вычисление приближенной производной
double derivative(double (*f)(double), double x, double h) {
    return (f(x + h) - f(x - h)) / (2 * h);
}

// Вычисление коэффициентов кубического сплайна Эрмита
void calculate_hermite_coefficients(double x0, double x1, double y0, double y1, 
                                  double dy0, double dy1, double* a, double* b, double* c, double* d) {
    double dx = x1 - x0;
    double dy = y1 - y0;

    *a = (dy1 + dy0 - 2*dy/dx) / (dx*dx);
    *b = (3*dy/dx - 2*dy0 - dy1) / dx;
    *c = dy0;
    *d = y0;
}

// Вычисление значения сплайна в точке x
double evaluate_spline(double x, double x0, double a, double b, double c, double d) {
    double dx = x - x0;
    return a*dx*dx*dx + b*dx*dx + c*dx + d;
}

// Поиск максимальной ошибки на отрезке
double find_max_error(double (*f)(double), int n) {
    double a = -0.5, b = 0.5;  // границы отрезка
    double h = (b - a) / (n - 1);  // шаг сетки
    double max_error = 0.0;
    double h_deriv = 1e-6;  // шаг для вычисления производной

    // Выделение памяти для узлов и значений
    double* x = (double*)malloc(n * sizeof(double));
    double* y = (double*)malloc(n * sizeof(double));
    double* dy = (double*)malloc(n * sizeof(double));

    // Заполнение узлов и значений
    for (int i = 0; i < n; i++) {
        x[i] = a + i * h;
        y[i] = f(x[i]);
        dy[i] = derivative(f, x[i], h_deriv);
    }

    // Проверка ошибки на мелкой сетке
    int num_check_points = 1000;
    double check_h = (b - a) / (num_check_points - 1);

    for (int i = 0; i < num_check_points; i++) {
        double check_x = a + i * check_h;
        
        // Найти соответствующий интервал сплайна
        int j = 0;
        while (j < n - 1 && check_x > x[j + 1]) j++;
        
        if (j < n - 1) {
            double coef_a, coef_b, coef_c, coef_d;
            calculate_hermite_coefficients(x[j], x[j+1], y[j], y[j+1], dy[j], dy[j+1],
                                         &coef_a, &coef_b, &coef_c, &coef_d);
            
            double spline_value = evaluate_spline(check_x, x[j], coef_a, coef_b, coef_c, coef_d);
            double true_value = f(check_x);
            double error = fabs(spline_value - true_value);
            
            if (error > max_error) max_error = error;
        }
    }

    free(x);
    free(y);
    free(dy);

    return max_error;
}

int main() {
    FILE *file = fopen("hermit_cub.csv", "w");
    if (file == NULL) {
        printf("Ошибка открытия файла!\n");
        return 1;
    }

    // Печать заголовков


    // Цикл от 4 до 60 включительно
    for (int n = 4; n <= 60; n++) {
        double error_f1 = find_max_error(f1, n);
        double error_f2 = find_max_error(f2, n);

        // Запись результатов в файл
        fprintf(file, "%d;%.10lf;%.10f\n", n, error_f1, error_f2);
    }

    fclose(file);

    printf("Результаты записаны в файл test.csv\n");

    return 0;
}
