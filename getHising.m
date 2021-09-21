%% getHising.m
% Ben Alford
% July 2021
% Creates an Ising chain Hamiltonian with NN-coupling and on site disorder
% of random strength.

function H = getHising(N, dim, x, y, z, J, gmax) 
    
    % N number of spins, dim dimension of system
    % J, g are numbers
    % x,y,z 1-spin pauli matrices (NOT spin operators)
    
    H = sparse(dim,dim);
    
    for h = 1:N-1
        H = H + gmax*rand*mykron(speye(2^(h-1)),z,speye(2^(N-h)));
        H = H + J*mykron(speye(2^(h-1)),x,x,speye(2^(N-h-1)));
        H = H + J*mykron(speye(2^(h-1)),y,y,speye(2^(N-h-1)));
    end
end
