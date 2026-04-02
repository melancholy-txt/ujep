import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Load the dataset
data = pd.read_csv('galaxydataset.csv')
print("original data:", data.shape)

id_cols = [c for c in data.columns if "id" in c.lower()]
df = data.drop(columns=id_cols)
print("Dropped ID columns:", id_cols)

df = df[df["class"] == "GALAXY"].copy()
print("After GALAXY filter:", df.shape)

# class is now constant, remove it
df = df.drop(columns=["class"])

for c in df.columns:
    df[c] = pd.to_numeric(df[c], errors="coerce")

# target for multiple regression
y = df["redshift"]
X = df.drop(columns=["redshift"])

# drop rows with NaN created by None values in csv
mask = X.notna().all(axis=1) & y.notna()
X = X[mask]
y = y[mask]

print("Final feature shape:", X.shape)

X_tr, X_test, y_tr, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, shuffle=True
)

rf = RandomForestRegressor(
    n_estimators=200,
    random_state=42,
    n_jobs=-1
)
rf.fit(X_tr, y_tr)
y_pred_rf = rf.predict(X_test)

def print_metrics(name, y_true, y_pred):
    mae = mean_absolute_error(y_true, y_pred)
    mse = mean_squared_error(y_true, y_pred)
    rmse = np.sqrt(mse)
    r2 = r2_score(y_true, y_pred)
    print(f"{name}: MAE={mae:.5f}, MSE={mse:.5f}, RMSE={rmse:.5f}, R2={r2:.5f}")

print_metrics("RandomForestRegressor", y_test, y_pred_rf)

err_rf = y_test - y_pred_rf

plt.figure(figsize=(10, 5))
bins = 40
plt.hist(err_rf, bins=bins, alpha=0.60, label="RF residuals")
plt.axvline(0, color="black", linewidth=1)
plt.title("Histogram of prediction errors (y_true - y_pred)")
plt.xlabel("Error")
plt.ylabel("Count")
plt.grid(True, alpha=0.3)
plt.legend()
plt.tight_layout()
plt.show()
