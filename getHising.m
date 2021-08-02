%% getHising.m
% Ben Alford
% July 2021
% Creates an Ising chain Hamiltonian with NN-coupling and on site disorder
% of random strength.

function H = getHising(N, dim, x, y, z, J, gmax) 
    
    % N number of spins, dim dimension of system
    % J should be NxN
    % g should be Nx1
    % x,y,z 1-spin pauli matrices (NOT spin operators)
    
    H = sparse(dim,dim);
    
    H = H + gmax*rand*mykron(z,speye(2^(N-1))) + J*mykron(x,x,speye(2^(N-2))) + J*mykron(y,y,speye(2^(N-2)));
    for h = 2:N-1
        H = H + gmax*rand*mykron(speye(2^(h-1)),z,speye(2^(N-h)));
        H = H + J*mykron(speye(2^(h-1)),x,x,speye(2^(N-h-1)));
        H = H + J*mykron(speye(2^(h-1)),y,y,speye(2^(N-h-1)));
    end
    H = H + gmax*rand*mykron(speye(2^(N-1)),z);
end
