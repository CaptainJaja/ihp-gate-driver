# Schematics

This directory contains the Xschem schematic files (`.sch`) for the CMOS Gate Driver designed with the IHP SG13G2 (130nm) PDK.

## Circuit Design
The gate driver is implemented as a standard CMOS push-pull inverter designed to drive a capacitive load. The sizing is chosen to balance the mobility difference between holes and electrons:
* **PMOS (`sg13_lv_pmos`)**: W = 10µm, L = 0.13µm
* **NMOS (`sg13_lv_nmos`)**: W = 5µm, L = 0.13µm
* **Load**: 1pF capacitor
* **Supply Voltage (VDD)**: 1.2V

![Gate Driver Schematic](../docs/Xscheme_circuit.png)
