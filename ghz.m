%% ghz.m
% Ben Alford
% August 2021
%
% Creates an N-particle GHZ state in the direction specified by the
% normalized one-particle input states up, down
%
% Can also be used to create a state with all spins aligned by using the
% same state for up and down

function psi = ghz(N, up, down)
    psi1 = 1;
    psi2 = 1;
    for i=1:N
        psi1 = mykron(psi1,up);
        psi2 = mykron(psi2,down);
    end
    psi = (psi1+psi2)/sqrt(2);
end