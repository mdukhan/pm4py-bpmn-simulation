# PM4Py Simulation: Case-Centric (XES) & Object-Centric (OCEL)

This project demonstrates an **end-to-end process mining simulation pipeline** using **PM4Py**, with simulations executed via **Petri net playout / Monte Carlo**, **Prosimos**, and **SimPy**:
from **BPMN/Petri net-based simulation** and **log post-processing** to:

- **Case-centric event logs (XES)**: classic trace/case perspective (one case id per trace)
- **Object-centric event logs (OCEL)**: multi-object perspective with event–object relations

The project is designed for **academic BPM / process mining experiments**, tutorials,
and **reproducible simulations**.

---

## Project Overview

The workflow implemented in this project follows these steps:

1. Load BPMN model  
2. Convert BPMN → Petri net  
3. Simulate logs  
4. Post-process timestamps to a realistic calendar (e.g., 2024)  
5. Optionally insert explicit timer/wait activities and explicit end events  
6. Export outputs  
   - **Case-centric:** XES (and/or CSV for Celonis)  
   - **Object-centric:** OCEL (JSON-OCEL and optionally SQLite)  

The outputs are **clean, realistic, and analysis-ready event logs**, available in both **XES** (case-centric) and **OCEL** (object-centric) formats.

---

## Key Features

- BPMN → Petri net conversion using PM4Py  
- Case-centric simulation (Petri net playout, Prosimos, Monte Carlo)  
- Realistic timestamp generation (office hours, delays)  
- Explicit timer activities for waiting periods  
- Explicit **Process End** events per case  
- Optional context-aware activity splitting  
- Export to standard **XES** format (case-centric)  
- Export to **OCEL** (object-centric) with event–object relations  

---

## Technologies Used

- **Python 3.9+**
- **PM4Py**
- **SimPy**
- **Prosimos**
- **pandas**
- **Jupyter Notebook / VS Code**

---

## Installation

Core dependencies (needed for most notebooks):

```bash
pip install pm4py pandas
```

(Optional but recommended)

```bash
pip install jupyter
```

Optional dependencies (depending on which notebooks you run):

```bash
pip install simpy
pip install prosimos
pip install graphviz
```

If Petri net / BPMN visualizations do not render, you may also need the **Graphviz system binary** installed and available on your `PATH`.

---

## Usage

The repository contains both **case-centric** and **object-centric** simulation notebooks.

### Recommended run paths

#### Case-centric (classic event log / XES)

1. Run `notebooks/petri-net.ipynb` to generate a simulated XES log and apply post-processing.
2. (Alternative) Run `notebooks/run_bafoeg_simulation.ipynb` if you want a Prosimos-generated CSV (and a Celonis-ready export).
3. (Alternative) Run `notebooks/monte_carlo.ipynb` to generate an XES log with Monte Carlo simulation.

#### Object-centric (OCEL)

1. Run `notebooks/sim_ocel.ipynb` to directly generate an OCEL dataset (tables as CSV).
2. Or run `notebooks/object-centric.ipynb` to convert a post-processed **case-centric XES** log into **JSON-OCEL** (and optionally SQLite).

## Notebooks

### Case-centric (XES / CSV)

- `notebooks/petri-net.ipynb`  
  Petri-net playout from BPMN and post-processing pipeline (shift to 2024, activity-specific retiming, optional timer insertion, optional explicit end event). Produces `simulated_log_final.xes` (and intermediate XES files).

- `notebooks/run_bafoeg_simulation.ipynb`  
  Prosimos-based simulation for the BAföG process, including an export tailored for Celonis (`prosimos_output_for_celonis.csv`).

- `notebooks/monte_carlo.ipynb`  
  Monte Carlo simulation using PM4Py’s Monte Carlo simulator with stochastic durations and resource constraints. Produces `data/outputs/event_logs/xes/monte_carlo_logs/bafoeg_simulation.xes`.

### Object-centric (OCEL)

- `notebooks/sim_ocel.ipynb`  
  SimPy-based **OCEL** generator for the BAföG process. Exports OCEL tables as CSV files (events, objects, and event-object links) under `data/outputs/event_logs/ocel`.

- `notebooks/object-centric.ipynb`  
  Builds an **OCEL** from a post-processed **case-centric XES** log by creating object types (e.g., Application, Student, Parent) and exporting JSON-OCEL (and optionally SQLite).

## Generated Outputs

Outputs are written under `data/outputs/event_logs/`.

### Case-centric outputs

- From `notebooks/petri-net.ipynb` (Petri net playout + post-processing):
  - `data/outputs/event_logs/xes/simulated_log_Initially.xes`
  - `data/outputs/event_logs/xes/simulated_log_shifted.xes`
  - `data/outputs/event_logs/xes/simulated_log_retimed.xes`
  - `data/outputs/event_logs/xes/simulated_log_final.xes`

- From `notebooks/run_bafoeg_simulation.ipynb` (Prosimos):
  - `data/outputs/event_logs/csv/prosimos_output.csv`
  - `data/outputs/event_logs/csv/prosimos_output_for_celonis.csv`

- From `notebooks/monte_carlo.ipynb` (Monte Carlo):
  - `data/outputs/event_logs/xes/monte_carlo_logs/bafoeg_simulation.xes`

### Object-centric outputs

- From `notebooks/sim_ocel.ipynb` (SimPy OCEL simulation):
  - `data/outputs/event_logs/ocel/events.csv`
  - `data/outputs/event_logs/ocel/applications.csv`
  - `data/outputs/event_logs/ocel/documents.csv`
  - `data/outputs/event_logs/ocel/event_object_link.csv`

- From `notebooks/object-centric.ipynb` (OCEL derived from XES):
  - `data/outputs/event_logs/json/ocel_from_xes.jsonocel`
  - `data/outputs/event_logs/json/ocel_from_xes.sqlite` (optional)

These outputs can be imported into:
- PM4Py
- ProM
- Celonis (via XES import)
- Other process mining tools

---

## Use Cases

- BPMN-based simulation  
- Process discovery experiments  
- Conformance checking  
- Teaching BPM / process mining  
- Benchmarking mining algorithms  
- Creating realistic demo datasets  

---

## Notes

- Generated artifacts (`*.xes`) are excluded via `.gitignore`
- BPMN files can optionally be included for reproducibility
- Delay distributions can be customized per activity

---

## Author

Developed for **academic and experimental process mining purposes** using **PM4Py**.

---

## License

Provided for **educational and research use**.
