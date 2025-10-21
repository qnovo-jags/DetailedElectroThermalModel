# 🚗 Battery Simulation & DOE Automation Toolkit

This repository provides a complete workflow to **generate battery pack models**, **configure simulation parameters**, **automate Design of Experiments (DOE)**, and **run Simulink simulations** efficiently. It is designed for rapid development and analysis of cell and pack-level electrothermal and electrochemical models using MATLAB/Simulink.

---

## 📁 Repository Structure

| Path / File                           | Description |
|------------------------------------   |-------------|
| `runDoe.m`                            | **Main entry point.** Runs DOE simulations with configured packs and models. |
| `createDetailedElectroThermalModel.m` | Generates a synthetic Simulink battery model using the Battery Builder API. |
| `generatePackConfigurations.m`        | Builds battery pack configurations (healthy or with damage/fault parameters). |
| `generateDoeConfirgurations.m`        | Defines DOE simulations (temperature, C-rate, cycling patterns, etc.). |
| `sypack192s2p60ah/`                   | Stores all simulation output automatically in structured format. |
| `simulinkModels/`                     | Contains saved Simulink models generated during configuration. |
| `BatteryGeneration/`                  | Battery Builder libraries and resources. |
| `utils/`                              | Helper utilities for pre-/post-processing and data extraction. |
| `resources/`                          | Parameter files, templates, or auxiliary reference configurations. |

---

## 🚀 Workflow Overview

1. **Create Synthetic Pack Model**
   ```matlab
   createSyntheticCellPack

2. **Generate Pack Configurations**
   ```matlab
   generatePackConfigurations
   
3. **Generate Design of Experiments for model inputs**
   ```matlab
   generateDoeConfirgurations
   
4. **Run DOE Simulations**
   ```matlab
   runDoe
   
Simulation results will be saved into the results/ directory.

## 🧠 Key Features
- ✅ Automated battery model creation using Simscape Battery Builder
- ✅ Configurable cell/module damage modeling
- ✅ DOE-based batch simulation execution
- ✅ Supports rapid accelerator mode for faster runs
- ✅ Structured result extraction for downstream analytics

## 📦 Requirements
- MATLAB R2025a or later
- Simulink
- Simscape Battery Toolbox
- Simulink Coder (for rapid accelerator support)

## 📥 Clone the Repository
### Using HTTPS
```bash
git clone [https://github.com/<username>/<repo-name>.git](https://github.com/qnovo-jags/DetailedElectroThermalModel.git)
```
### Using SSH (recommended if you have SSH keys)
```bash
git@github.com:qnovo-jags/DetailedElectroThermalModel.git
```

## ▶️ Example Usage
```matlab
% Step 1: Build the model
createDetailedElectroThermalModel

% Step 2: Configure pack settings
generatePackConfigurations

% Step 3: Set up DOE simulations
generateDoeConfirgurations

% Step 4: Execute all DOEs
runDoe

