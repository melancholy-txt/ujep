Project dependencies and setup

This repository uses standard scientific Python packages. The supplied
`requirements.txt` contains conservative minimal versions so the code runs on
modern Python interpreters.

Quick setup (Windows PowerShell):

```powershell
# create a virtual environment named .venv in the project root
python -m venv .venv
# activate it (PowerShell)
.\.venv\Scripts\Activate.ps1
# upgrade pip and install requirements
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Notes:
- If you'd like exact pinned versions after verifying everything works, run
  `python -m pip freeze > requirements.txt` and commit the updated file.
- If you use VS Code, select the `.venv` Python interpreter for proper
  linting/IntelliSense.

Contact me if you want me to pin to latest known-good versions or add a
`requirements-dev.txt` for testing tools.
