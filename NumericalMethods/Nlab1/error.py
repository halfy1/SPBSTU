import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("main.csv", delimiter=";", names=["n", "uniform_err", "cheb_err", "uniform_err2", "cheb_err2"])

plt.figure(figsize=(10, 6))

plt.plot(data["n"], data["uniform_err"], label="Равномерная сетка $y = x \\ln(x + 1)$")
plt.plot(data["n"], data["cheb_err"], label="Чебышевская сетка $y = x \\ln(x + 1)$")

plt.plot(data["n"], data["uniform_err2"], label="Равномерная сетка $y = |x|$")
plt.plot(data["n"], data["cheb_err2"], label="Чебышевская сетка $y = |x|$")

plt.xlabel("Количество узлов (n)")
plt.ylabel("Максимальная погрешность")
plt.title("Зависимость погрешности от количества узлов")
plt.yscale("log")
plt.legend()
plt.grid(True, which="both", linestyle="--", linewidth=0.5)

plt.savefig('error_rate.png')

plt.show()
