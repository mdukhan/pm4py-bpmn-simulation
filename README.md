# PM4Py BPMN Simulation & Event Log Post-Processing

This project demonstrates an **end-to-end process mining pipeline** using **PM4Py**:
from a **BPMN model**, through **Petri net conversion and simulation**, to **realistic,
post-processed XES event logs** ready for discovery, conformance checking, and performance analysis.

The project is designed for **academic BPM / process mining experiments**, tutorials,
and **reproducible simulations**.

---

## Project Overview

The workflow implemented in this project follows these steps:

1. Load BPMN model  
2. Convert BPMN → Petri net  
3. Simulate event logs (playout)  
4. Shift timestamps to a realistic calendar (2024)  
5. Retiming with activity-specific delays  
6. Insert explicit timer events  
7. Add explicit process end events  
8. Context-aware activity relabeling  
9. Export final XES log  

The final output is a **clean, realistic, and analysis-ready XES event log**.

---

## Key Features

- BPMN → Petri net conversion using PM4Py  
- Petri net playout (basic & extensive variants)  
- Realistic timestamp generation (office hours, delays)  
- Explicit timer activities for waiting periods  
- Explicit **Process End** events per case  
- Optional context-aware activity splitting  
- Export to standard **XES** format  

---

## Technologies Used

- **Python 3.9+**
- **PM4Py**
- **pandas**
- **Jupyter Notebook / VS Code**

---

## Installation

```bash
pip install pm4py pandas
```

(Optional but recommended)

```bash
pip install jupyter
```

---

## Usage

Run the scripts or notebooks in order:

1. Load and inspect BPMN  
2. Simulate event log via Petri net playout  
3. Shift timestamps to 2024  
4. Retiming with activity-specific delays  
5. Insert timer and end events  
6. Export final XES log  

**Final output:**

```
simulated_log_postprocessed_Final.xes
```

This file can be imported into:
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
