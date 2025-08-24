# Consolidation of Sequential Planning - Code

Code for the MEG + behavioral analyses in:

Vikbladh O, Russek E, Burgess N. Consolidation of Sequential Planning. bioRxiv (2024). doi: 10.1101/2024.11.01.621475

## State of code

This is research code: it reproduces the paper analyses but is not a polished package.

Scripts are modular and must be run in the right order.

Paths and subject IDs need to be edited locally.

Generates large intermediate .mat files at each step.

## Neural analysis

### Orchestrator

- **Preprocess.m** - Main entry point for the neural pipeline. Calls each preprocessing stage below.

### Preprocessing stages

- **preprocessMEG2_parallel.m** - import raw .ds → SPM (p*).
- **preprocessMEG_parallel.m** - convert to FieldTrip, run ICA, save ICs.
- **preprocessMEG3_parallel.m** - flag ICA components correlated with eye channels.
- **preprocessMEG4_parallel.m** - apply component rejection in SPM, then filter (1 Hz HP + 48–52 Hz notch).
- **osl_detect_artefacts.m** - automatic bad trial/channel detection.

### Source / correlations / plots

- **beamformerBatch.m** - LCMV beamformer → source space.
- **correlation_plot_wrapper.m** - loops participants, calls calculate_correlation_matrix.m (set parameters to subset trials like within Day).
- **source_localization.m** - source localization of effects defined by cross-correlations of particular time lags and trial subsets
- **plot_figures.m** - plots correlation matrices + derivatives.

## Behavioral analysis

- **model_comparison.m** - compares behavioral models (BIC).
- **plot_behavior.m** - plots the best-fitting model.



