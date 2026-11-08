
# IHP SG13G2 Inverter / Gate Driver Cell

Full custom design, DRC/LVS physical verification, parasitic extraction (PEX), and post-layout characterization of an inverter cell designed in the **IHP SG13G2 130 nm BiCMOS** technology.

This project was built entirely with open-source EDA tools packaged in the `IIC-OSIC-TOOLS` environment:
- **Schematic & Testbench Entry**: Xschem
- **Circuit Simulation**: Ngspice
- **Layout & Physical Verification (DRC/LVS)**: KLayout
- **Parasitic Extraction (PEX R+C)**: Magic VLSI

---

## Project Structure

```text
ihp-gate-driver/
├── docs/                      # Screenshots & project assets
├── layout/                    # GDS, DRC/LVS reports, and PEX netlists
│   └── README.md
├── schematics/                # Xschem schematics, symbols, and testbenches
│   └── README.md
├── .gitignore
├── LICENSE
└── README.md

```

---

## 1. Circuit Design & Schematic

The cell implements a high-speed CMOS inverter dimensioned to balance rise and fall drive capabilities while driving capacitive loads.

| Device | Type | Width ($W$) | Length ($L$) | Bulk Connection |
| --- | --- | --- | --- | --- |
| **NMOS** | `sg13_lv_nmos` | $5.0\,\mu\text{m}$ | $0.13\,\mu\text{m}$ | `ptap1` (`VSS`) |
| **PMOS** | `sg13_lv_pmos` | $10.0\,\mu\text{m}$ | $0.13\,\mu\text{m}$ | `ntap1` (`VDD`) |

Nominal operating voltage: **$V_{DD} = 1.2\,\text{V}$**.

For comprehensive details on testbench topology and transient stimulus, see [`schematics/README.md`](https://www.google.com/search?q=schematics/README.md).

---

## 2. Mask Layout & Verification (DRC / LVS)

The mask layout was drawn in KLayout adhering strictly to the `sg13g2` foundry design rules:

* Substrate contacts (`ptap1` / `ntap1`) fully surround the active areas to prevent latch-up.
* Metal-1 routing guarantees low-resistance power and signal paths.

### Verification Status

* **DRC**: 0 violations reported by the IHP SG13G2 rule deck.
* **LVS**: Clean 1:1 netlist match between the extracted geometry and the schematic.

| DRC Result | LVS Result |
| --- | --- |
|  |  |

For execution commands and run logs, see [`layout/README.md`](https://www.google.com/search?q=layout/README.md).

---

## 3. Parasitic Extraction (PEX)

To capture wiring and junction parasitics overlooked by schematic-only models:

1. The GDS layout was imported into **Magic VLSI** with technology `ihp-sg13g2`.
2. 3D substrate coupling, overlap capacitances, and inter-metal parasitics were extracted using `ext2spice lvs`, `cthresh 0.01fF`, and `extresist on`.

The extracted netlist reveals several fractions of femtofarads of fringe and substrate capacitances (`C0` to `C7`), adding an equivalent output parasitic load $C_{par} \approx 1.2\text{--}1.6\,\text{fF}$.

---

## 4. Pre-Layout vs. Post-Layout (PEX) Results

The transient performance was evaluated under Ngspice (`cornerMOSlv.lib mos_tt` at $27\,^{\circ}\text{C}$) with an input pulse ($t_r = t_f = 40\,\text{ps}$).

### Simulation Waveforms & Delays ($C_{load} = 5\,\text{fF}$)

| Ideal Schematic Simulation | Post-Layout (PEX Magic) Simulation |
| --- | --- |
|  |  |
| $t_{pHL} = 18.83\,\text{ps} \quad\vert\quad t_{pLH} = 19.54\,\text{ps}$ | $t_{pHL} = 19.62\,\text{ps} \quad\vert\quad t_{pLH} = 20.30\,\text{ps}$ |

### Comprehensive Timing Summary

| Load Condition | Parameter | Pre-Layout (Ideal) | Post-Layout (PEX) | $\Delta t$ Penalty | Relative Degradation |
| --- | --- | --- | --- | --- | --- |
| **$C_{load} = 5\,\text{fF}$** | **$t_{pHL}$** | $18.83\,\text{ps}$ | **$19.62\,\text{ps}$** | $+0.79\,\text{ps}$ | **$+4.2\,\%$** |
|  | **$t_{pLH}$** | $19.54\,\text{ps}$ | **$20.30\,\text{ps}$** | $+0.76\,\text{ps}$ | **$+3.9\,\%$** |
| **$C_{load} = 30\,\text{fF}$** | **$t_{pHL}$** | $26.66\,\text{ps}$ | **$27.24\,\text{ps}$** | $+0.59\,\text{ps}$ | $+2.2\,\%$ |
|  | **$t_{pLH}$** | $28.23\,\text{ps}$ | **$28.84\,\text{ps}$** | $+0.61\,\text{ps}$ | $+2.1\,\%$ |

### Takeaways

* **Sensitivity under light load**: At $5\,\text{fF}$, wiring and overlap capacitances contribute over **$4\,\%$** of the total delay. Under heavier loads ($30\,\text{fF}$), the external capacitor dominates and attenuates layout penalties.
* **Symmetry**: Rise and fall penalties remain strictly matched ($\approx 0.77\,\text{ps}$ shift on both edges), validating symmetrical transistor sizing and layout routing.

---

## 5. How to Reproduce

### Requirements

* Docker container `efabless/iic-osic-tools` or a local workstation with Xschem, Ngspice, KLayout, and Magic installed alongside the IHP SG13G2 PDK.

### Execution

1. Clone the repository into your workspace:
```bash
git clone [https://github.com/](https://github.com/)<your-username>/ihp-gate-driver.git
cd ihp-gate-driver

```


2. Open the testbench:
```bash
xschem schematics/tb_gate_driver.sch

```


3. Click **Netlist** then **Simulate** in Xschem to run Ngspice.
4. Measure propagation delays interactively in the Ngspice terminal:
```text
print tphl tplh

```


