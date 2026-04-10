import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, classification_report

# 1. Load the data
# Adjust the separator (sep) if your text file uses commas, semicolons, or tabs
df = pd.read_csv("./Credit.txt", sep=r"\s+") 

# 2. Separate input features (X) and target variable (Y)
# Ensure these column names exactly match your Credit.txt header
feature_columns = [
    "PaymentHistory", "WorkHistory", "Reliability", "Debit", 
    "Income", "RatioDebInc", "Assets", "Worth", 
    "Profession", "FutureIncome", "Age"
]

X = df[feature_columns]
y = df["CreditWorthiness"] # Target variable (0/1)

# 3. Split the data into training and testing sets (70/30 split)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=42)

# 4. Initialize and train the Logistic Regression model
model = LogisticRegression(max_iter=1000)
model.fit(X_train, y_train)

# 5. Make predictions on the test data
y_pred = model.predict(X_test)
y_prob = model.predict_proba(X_test)[:, 1] # Probability of class 1

# 6. Calculate and print metrics
accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred)
recall = recall_score(y_test, y_pred)
f1 = f1_score(y_test, y_pred)

print("--- Model Evaluation Metrics ---")
print(f"Accuracy:  {accuracy:.4f}")
print(f"Precision: {precision:.4f}")
print(f"Recall:    {recall:.4f}")
print(f"F1-score:  {f1:.4f}")

# Optional: View feature importance (coefficients) for interpretation
print("\n--- Feature Coefficients ---")
coefficients = pd.DataFrame({"Feature": X.columns, "Coefficient": model.coef_[0]})
print(coefficients.sort_values(by="Coefficient", ascending=False))