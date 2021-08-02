%% qfi.m
% Ben Alford
% August 2021
% Calculates the Von Neumann Entanglement Entropy for a density matrix rho
% partitioned into subsystems of size N1 and N2

function VNEE = vnee(rho,N1,N2)
    rhoA = PartialTrace(rho,1,[2^N1 2^N2]);
    rhoB = PartialTrace(rho,2,[2^N1 2^N2]);
    eA = eig(rhoA);
    eB = eig(rhoB);

    VNEE = real([sum(eA + log(eA)) sum(eB + log(eB))]);
end