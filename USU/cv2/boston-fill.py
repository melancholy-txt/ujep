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

# get rid of 200 random values in the dataset to demonstrate filling missing values
np.random.seed(42)
missing_indices = np.random.choice(data.index, size=200, replace=False)
data.loc[missing_indices, "CRIM"] = np.nan  # set 'CRIM' values to NaN for demonstration

# use KNN imputation to fill missing values in 'CRIM' column
from sklearn.impute import KNNImputer
imputer = KNNImputer(n_neighbors=5)  # use 5 nearest neighbors for imputation
data_imputed = imputer.fit_transform(data)  # fit and transform the data
data = pd.DataFrame(data_imputed, columns=feature_names)  # convert back to DataFrame


# view the number of missing values in each column
print(data.isnull().sum())

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


