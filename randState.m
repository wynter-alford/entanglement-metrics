%% Random initial state (pure)
% Code by Kent Ueno

function psi_rand = randState(N) %N is the total number of spins
    up = [1; 0];
    down = [0; 1];

    psi_rand = 1;
    for j=1:N
        angles = 2*pi.*rand(3,1); theta = angles(1);
        phi1 = angles(2);
        phi2 = angles (3);
        new_rand = exp(1i*phi1)*cos(theta).*up+exp(1i*phi2)*sin(theta).*down;
        psi_rand = mykron(psi_rand,new_rand);
    end
end