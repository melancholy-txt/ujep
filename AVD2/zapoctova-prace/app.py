import streamlit as st
import pandas as pd

@st.cache_data
def load_data():
    data = pd.read_csv("data/DOD_2026_data.csv")
    return data

df = load_data()


st.title("My uv-managed Streamlit App 🚀")
st.write("If you are reading this, uv and Streamlit are working perfectly together!")

df