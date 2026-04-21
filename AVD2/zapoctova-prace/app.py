import streamlit as st

st.title("My uv-managed Streamlit App 🚀")
st.write("If you are reading this, uv and Streamlit are working perfectly together!")

# A quick interactive widget to test
name = st.text_input("What's your name?")
if name:
    st.success(f"Hello, {name}!")