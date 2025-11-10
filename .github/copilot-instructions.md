# Copilot / AI Agent Instructions — ujep repository

This file gives focused, actionable context for an AI coding agent to be productive in this mixed-language coursework repository.

Scope: many small course assignments and examples across Python, R, C#, SQL and Docker. Treat most folders as standalone exercises rather than a single monolithic app.

Key locations to know
- Solution and C# projects: `ujep.sln` (root) and projects under `OONV/` (e.g. `OONV/AdapterMethod/AdapterMethod.csproj`, `OONV/FactoryMethod/FactoryMethod.csproj`).
- Python exercises: `APR1/`, `APR2/`, `MSW/`, `PZS/` — these are mostly single-file scripts (examples: `APR1/akcie.py`, `APR1/soubory.py`).
- SQL & DB Docker stacks: `NSQL/*/docker-compose.yml` (multiple CV folders) and `RDBS/docker-compose.yml` for DB-related exercises.
- Requirements for Python examples: `NSQL/cv*/requirements.txt` (each CV subfolder often has its own requirements).
- Notebooks: many `.ipynb` files exist (experiments, lectures). Modify only if you also update outputs or metadata consistently.

Big-picture architecture and intent
- This repository is a collection of teaching examples and exercises. There is no single runtime; instead, treat each folder as an independent exercise with its own runtime choices (python script, Rmd, .NET project, or dockerized DB).
- Integration points: Docker Compose setups under `NSQL/` and `RDBS/` are the main cross-cutting integrations — they bring up DB containers and seed data used by code in `NSQL/*/code` or `RDBS/init`.

Developer workflows (concrete commands)
- Build and run C# exercises (Windows/PowerShell):
  - Build solution: `dotnet build .\ujep.sln`
  - Run a project: `dotnet run --project .\OONV\AdapterMethod\AdapterMethod.csproj`
  - Open in Visual Studio: double-click `ujep.sln`.
- Python scripts and notebooks:
  - Create venv and install requirements (example for NSQL cv1):
    - `python -m venv .venv; .\.venv\Scripts\Activate.ps1; pip install -r .\NSQL\cv1\requirements.txt`
  - Run a script: `python .\APR1\akcie.py`
  - Jupyter notebooks: `jupyter lab` or `jupyter notebook` from repo root, open the `.ipynb`.
- Docker stacks for DB exercises:
  - Start: `docker-compose -f .\RDBS\docker-compose.yml up --build`
  - For NSQL CVs: `docker-compose -f .\NSQL\cv1\docker-compose.yml up --build` (repeat per cv folder)

Project-specific conventions and patterns
- Many folders are independent course exercises — prefer minimal, targeted edits. If you change an exercise, update only files in that exercise folder unless cross-folder changes are required.
- Python file style: simple scripts and small functions; there are no heavy frameworks. Look for top-level procedural code (e.g., `APR1/*.py`).
- C# projects follow typical .NET console patterns under `OONV/` with `bin/` and `obj/` produced — do not commit these directories.
- Notebooks are used for exploration; treat outputs as optional. If you modify a notebook for correctness, clear or update its outputs consistently.

Integration & external dependencies
- Docker is used for database environments. Pay attention to `docker-compose.yml` in `NSQL/*` and `RDBS/` when working on DB-related code.
- Python dependency lists live in `NSQL/cv*/requirements.txt`. Other Python examples may not have pinned requirements — prefer adding a `requirements.txt` alongside any new script that needs dependencies.
- SQL files and seed data appear under `URDB/` and `RDBS/init` — changes there affect Docker stacks and exercises that depend on seeded data.

What an AI agent should do (practical rules)
- Keep changes small and localized to an exercise directory. If fixing multiple exercises, create separate commits per folder.
- Prefer adding a short README or comment in the exercise folder when you change behavior (explain why). Example: update `APR1/README.md` next to `APR1/akcie.py` if you changed usage.
- Do not modify `bin/`, `obj/` or other build artifacts. Do not change students' original submissions unless asked.
- When adding dependencies, update the nearest `requirements.txt` (e.g., `NSQL/cv2/requirements.txt`) and include a one-line note in the commit message describing why.

Files to reference when making changes
- `ujep.sln` — overall solution for .NET projects.
- `OONV/*/*.csproj` — individual C# projects.
- `NSQL/*/docker-compose.yml` and `RDBS/docker-compose.yml` — DB stacks and integration points.
- `NSQL/*/requirements.txt` — Python dependency lists.
- Representative examples: `APR1/akcie.py`, `APR1/soubory.py`, `APR2/grafy.py`.

If anything here is unclear or you'd like more automation (CI, linters, or a single developer README), tell me which folders you'd like prioritized and I'll update this file accordingly.
# Copilot / AI Agent Instructions — ujep repository

This file gives focused, actionable context for an AI coding agent to be productive in this mixed-language coursework repository.

- Scope: many small course assignments and examples across Python, R, C#, SQL and Docker. Treat most folders as standalone exercises rather than a single monolithic app.

Key locations to know
- Solution and C# projects: `ujep.sln` (root) and projects under `OONV/` (e.g. `OONV/AdapterMethod/AdapterMethod.csproj`, `OONV/FactoryMethod/FactoryMethod.csproj`).
- Python exercises: `APR1/`, `APR2/`, `MSW/`, `PZS/` — these are mostly single-file scripts (examples: `APR1/akcie.py`, `APR1/soubory.py`).
- SQL & DB Docker stacks: `NSQL/*/docker-compose.yml` (multiple CV folders) and `RDBS/docker-compose.yml` for DB-related exercises.
- Requirements for Python examples: `NSQL/cv*/requirements.txt` (each CV subfolder often has its own requirements).
- Notebooks: many `.ipynb` files exist (experiments, lectures). Modify only if you also update outputs or metadata consistently.

Big-picture architecture and intent
- This repository is a collection of teaching examples and exercises. There is no single runtime; instead, treat each folder as an independent exercise with its own runtime choices (python script, Rmd, .NET project, or dockerized DB).
- Integration points: Docker Compose setups under `NSQL/` and `RDBS/` are the main cross-cutting integrations — they bring up DB containers and seed data used by code in `NSQL/*/code` or `RDBS/init`.

Developer workflows (concrete commands)
- Build and run C# exercises (Windows/PowerShell):
  - Build solution: `dotnet build .\ujep.sln`
  - Run a project: `dotnet run --project .\OONV\AdapterMethod\AdapterMethod.csproj`
  - Open in Visual Studio: double-click `ujep.sln`.
- Python scripts and notebooks:
  - Create venv and install requirements (example for NSQL cv1):
    - `python -m venv .venv; .\.venv\Scripts\Activate.ps1; pip install -r .\NSQL\cv1\requirements.txt`
  - Run a script: `python .\APR1\akcie.py`
  - Jupyter notebooks: `jupyter lab` or `jupyter notebook` from repo root, open the `.ipynb`.
- Docker stacks for DB exercises:
  - Start: `docker-compose -f .\RDBS\docker-compose.yml up --build`
  - For NSQL CVs: `docker-compose -f .\NSQL\cv1\docker-compose.yml up --build` (repeat per cv folder)

Project-specific conventions and patterns
- Many folders are independent course exercises — prefer minimal, targeted edits. If you change an exercise, update only files in that exercise folder unless cross-folder changes are required.
- Python file style: simple scripts and small functions; there are no heavy frameworks. Look for top-level procedural code (e.g., `APR1/*.py`).
- C# projects follow typical .NET console patterns under `OONV/` with `bin/` and `obj/` produced — do not commit these directories.
- Notebooks are used for exploration; treat outputs as optional. If you modify a notebook for correctness, clear or update its outputs consistently.

Integration & external dependencies
- Docker is used for database environments. Pay attention to `docker-compose.yml` in `NSQL/*` and `RDBS/` when working on DB-related code.
- Python dependency lists live in `NSQL/cv*/requirements.txt`. Other Python examples may not have pinned requirements — prefer adding a `requirements.txt` alongside any new script that needs dependencies.
- SQL files and seed data appear under `URDB/` and `RDBS/init` — changes there affect Docker stacks and exercises that depend on seeded data.

What an AI agent should do (practical rules)
- Keep changes small and localized to an exercise directory. If fixing multiple exercises, create separate commits per folder.
- Prefer adding a short README or comment in the exercise folder when you change behavior (explain why). Example: update `APR1/README.md` next to `APR1/akcie.py` if you changed usage.
- Do not modify `bin/`, `obj/` or other build artifacts. Do not change students' original submissions unless asked.
- When adding dependencies, update the nearest `requirements.txt` (e.g., `NSQL/cv2/requirements.txt`) and include a one-line note in the commit message describing why.

Files to reference when making changes
- `ujep.sln` — overall solution for .NET projects.
- `OONV/*/*.csproj` — individual C# projects.
- `NSQL/*/docker-compose.yml` and `RDBS/docker-compose.yml` — DB stacks and integration points.
- `NSQL/*/requirements.txt` — Python dependency lists.
- Representative examples: `APR1/akcie.py`, `APR1/soubory.py`, `APR2/grafy.py`.

If anything here is unclear or you'd like more automation (CI, linters, or a single developer README), tell me which folders you'd like prioritized and I'll update this file accordingly.
