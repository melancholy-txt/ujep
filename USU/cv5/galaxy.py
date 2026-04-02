import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Load the dataset
data = pd.read_csv('galaxy_data.csv')
print("original data:", data.shape)

id_cols = [c for c in data.columns if "id" in c.lower()]
df = data.drop(columns=id_cols)
print("Dropped ID columns:", id_cols)

df = df[df["class"] == "GALAXY"].copy()
print("After GALAXY filter:", df.shape)