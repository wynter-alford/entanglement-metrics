function H = getHDQ(N, dim, x, y, z, J, gx, gz) 
    
    % N number of spins, dim dimension of system
    % J should be NxN
    % g should be Nx1
    % x,y,z 1-spin pauli matrices (NOT spin operators)
    %
    % Currently only implements NN-coupling
    
    H = sparse(dim,dim);
    
    for h = 1:N-1
        H = H + gz*mykron(speye(2^(h-1)),z,speye(2^(N-h)));
        H = H + gx*mykron(speye(2^(h-1)),x,speye(2^(N-h)));
        H = H + J*mykron(speye(2^(h-1)),x,x,speye(2^(N-h-1)));
        H = H - J*mykron(speye(2^(h-1)),y,y,speye(2^(N-h-1)));
    end
end
