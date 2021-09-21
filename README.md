# entanglement-metrics

The main script in this repository is `simEntanglement.m` which simulates unitary time evolution for an N-spin system (typically a spin-chain under some form of Ising Hamiltonian).  The files `qfi.m`, `vnee.m`, and `minimumEntanglement.m` calculate various entanglement metrics for a density matrix and chosen operator(s) and can be used independently of the main script.

#### QETLAB Package

The QETLAB package has a number of useful functions. Here I use it mainly for the provided PartialTrace function.  This package is copyright (c) 2014, Nathaniel Johnston.  See license.txt inside the QETLAB folder for more information.  The most up-to-date version can be found at: https://github.com/nathanieljohnston/QETLAB/

