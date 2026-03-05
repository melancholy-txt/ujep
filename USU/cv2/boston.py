import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.model_selection import train_test_split

data_url = "http://lib.stat.cmu.edu/datasets/boston"
raw_df = pd.read_csv(data_url, sep=r"\s+", skiprows=22, header=None)
data = np.hstack([raw_df.values[::2, :], raw_df.values[1::2, :2]])
target = raw_df.values[1::2, 2]
feature_names = [
    "CRIM",
    "ZN",
    "INDUS",
    "CHAS",
    "NOX",
    "RM",
    "AGE",
    "DIS",
    "RAD",
    "TAX",
    "PTRATIO",
    "B",
    "LSTAT",
]

# change the columns names in the DataFrame for better readability
data = pd.DataFrame(data, columns=feature_names)

X_train, X_test, y_train, y_test = train_test_split(
    data, target, test_size=0.2, random_state=42
)

from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler(feature_range=(0, 1))  # scale features to [0, 1]
X_norm = scaler.fit_transform(data)  # fit and transform entire dataset for visualization
A = X_norm.T @ X_norm  # covariance matrix of normalized features
b = X_norm.T @ target  # covariance between features and target
alpha = np.linalg.solve(A, b)  # solve for coefficients using normal equation
for i, colname in enumerate(feature_names):
    print(f"{colname}: {alpha[i]:.4f}")



X_train_scaled = scaler.fit_transform(X_train)  
# fit only on training data
X_test_scaled = scaler.transform(X_test)         
# transform test data with same scaler

from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

model = LinearRegression()
model.fit(X_train_scaled, y_train)

y_pred = model.predict(X_test_scaled)

# print("MSE:  {:.2f}".format(mean_squared_error(y_test, y_pred)))
# print("R²:   {:.2f}".format(r2_score(y_test, y_pred)))

coefficients = pd.Series(model.coef_, index=feature_names)
coefficients_sorted = coefficients.abs().sort_values(ascending=False)

# print("\nFeature Importance (by absolute coefficient):")
# print(coefficients_sorted)

# plt.figure(figsize=(10, 6))
# coefficients_sorted.plot(kind="bar", color="steelblue")
# plt.title("Feature Importance (Linear Regression + MinMax)")
# plt.ylabel("Absolute Coefficient Value")
# plt.xlabel("Feature")
# plt.tight_layout()
# plt.show()

import statsmodels.api as sm
model = sm.OLS(target, data).fit()
print(model.summary())