function rho0 = getInitialState(statelabel, N,X,Y,Z)
% getInitialState.m
% Ben Alford
% September 2021
%
% Generates an N-spin initial state (density matrix rho0) from among the
% following options:
% ghz_Z, ghz_X, ghz_Y, aligned_Z, aligned_X, aligned_Y,rand_pure, sigma_X,
% sigma_Y, sigma_Z, identity

    zUp = [1; 0];
    zDn = [0; 1];
    xUp = (1/sqrt(2))*[1; 1];
    xDn = (1/sqrt(2))*[1; -1];
    yUp = (1/sqrt(2))*[1; 1i];
    yDn = (1/sqrt(2))*[1; -1i];

    if strcmp(statelabel,'ghz_Z')
        psi = ghz(N, zUp, zDn);
        rho0 = psi*psi';
    elseif strcmp(statelabel,'ghz_X')
        psi = ghz(N, xUp, xDn);
        rho0 = psi*psi';
    elseif strcmp(statelabel,'ghz_Y')
        psi = ghz(N, yUp, yDn);
        rho0 = psi*psi';
    elseif strcmp(statelabel,'aligned_Z')
        psi = ghz(N, zUp, zUp)/sqrt(2);
        rho0 = psi*psi';
    elseif strcmp(statelabel,'aligned_X')
        psi = ghz(N, xUp, xUp)/sqrt(2);
        rho0 = psi*psi';
    elseif strcmp(statelabel,'aligned_Y')
        psi = ghz(N, yUp, yUp)/sqrt(2);
        rho0 = psi*psi';
    elseif strcmp(statelabel,'rand_pure')
        psi = randState(N);
        rho0 = psi*psi';
    elseif strcmp(statelabel,'sigma_X')
        rho0 = X;
    elseif strcmp(statelabel,'sigma_Y')
        rho0 = Y;
    elseif strcmp(statelabel,'sigma_Z')
        rho0 = Z;
    elseif strcmp(statelabel,'identity')
        rho0 = speye(2^N,2^N);
    end
end