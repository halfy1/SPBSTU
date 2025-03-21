import numpy as np
import matplotlib.pyplot as plt


# The function to be interpolated
def func(x):
    return x * np.log(x + 1)


# Lagrange's Polynomial
def lagrange_interpolation(x_vals, y_vals, x):
    n = len(x_vals)
    result = 0.0

    for i in range(n):
        term = y_vals[i]
        for j in range(n):
            if i != j:
                term *= (x - x_vals[j]) / (x_vals[i] - x_vals[j])
        result += term

    return result


# Create interpolation nodes
a, b = -0.5, 0.5
n = 6
x_vals = np.linspace(a, b, n)
y_vals = func(x_vals)

# Array for calculating the Lagrange polynomial at each node
lagrange_vals = [lagrange_interpolation(x_vals, y_vals, x) for x in x_vals]

x_plot = np.linspace(a, b, 100)
y_func = func(x_plot)
y_lagrange = [lagrange_interpolation(x_vals, y_vals, x) for x in x_plot]

plt.figure(figsize=(10, 10))
plt.plot(x_plot, y_func, label="Функция: $y = x \\ln(x + 1)$", color='b', linewidth=4)
plt.plot(x_plot, y_lagrange, label="Полином Лагранжа", color='orange', linestyle='--', linewidth=2)
plt.legend()
plt.grid(True)

plt.savefig('lagrange_interpolation_plot.png')

plt.show()
