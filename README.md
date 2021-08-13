# entanglement-metrics

The main script in this repository is `simEntanglement.m` which simulates unitary time evolution under an Ising chain Hamiltonian (XX nearest-neighbor couplings and Z on-site interaction).  The files `qfi.m`, `vnee.m`, and `minimumEntanglement.m` calculate various entanglement metrics for a density matrix and chosen operator(s) and can be used independently of the main script.

The QETLAB package has a number of useful functions; I use it mainly for the provided PartialTrace function.  This package is copyright (c) 2014, Nathaniel Johnston.  See license.txt inside the QETLAB folder for more information.  The most up-to-date version can be found at: https://github.com/nathanieljohnston/QETLAB/

