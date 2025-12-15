from dataclasses import dataclass
from pathlib import Path
from typing import Dict

# Project root = parent of the "config" folder
ROOT = Path(__file__).resolve().parents[1]

DATA_DIR    = ROOT / "data"
BPMN_DIR    = DATA_DIR / "bpmn_models"
CFG_DIR     = BPMN_DIR / "bpmn_config"
OUTPUTS_DIR = DATA_DIR / "outputs"
XES_DIR     = OUTPUTS_DIR / "event_logs" /"xes"
CSV_DIR     = OUTPUTS_DIR / "event_logs" /"csv"
JSON_DIR    = OUTPUTS_DIR / "event_logs" /"json"
@dataclass(frozen=True)
class BPMNAsset:
    key: str
    bpmn_path: Path
    prosimos_config_path: Path

# Register all your BPMN variants here
BPMN_ASSETS: Dict[str, BPMNAsset] = {
    "bafoeg_process": BPMNAsset(
        key="bafoeg_process",
        bpmn_path=BPMN_DIR / "bafoeg_process.bpmn",
        prosimos_config_path=CFG_DIR / "bafoeg_prosimos_config.json",
    ),
    "group10_extended": BPMNAsset(
        key="group10_extended_alina",
        bpmn_path=BPMN_DIR / "group_10_Extended_Alina.bpmn",
        prosimos_config_path=CFG_DIR / "bafoeg_prosimos_config.json",
    ),
    "group10_simplified": BPMNAsset(
        key="group10_simplified_david",
        bpmn_path=BPMN_DIR / "group_10_Simplified_David.bpmn",
        prosimos_config_path=CFG_DIR / "bafoeg_prosimos_config.json",
    ),
}

DEFAULT_MODEL_KEY = "bafoeg_process"

def get_asset(key: str = DEFAULT_MODEL_KEY) -> BPMNAsset:
    asset = BPMN_ASSETS[key]
    if not asset.bpmn_path.exists():
        raise FileNotFoundError(f"Missing BPMN file: {asset.bpmn_path}")
    if not asset.prosimos_config_path.exists():
        raise FileNotFoundError(f"Missing Prosimos config: {asset.prosimos_config_path}")
    return asset
