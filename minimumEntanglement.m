%% qfibar.m
% Ben Alford
% August, 2021
%
% Calculates minimum entanglement based on QFI-bar as defined in: 
% Hyllus et. al, 2012 --- 10.1103/PhysRevA.85.022321
%
% Does not currently work properly (as best I can tell)

function result = minimumEntanglement(rho,N,X,Y,Z)
    FQbar = (qfi(rho,X/N)+qfi(rho,Y/N)+qfi(rho,Z/N))/3;
    
    enough = false;
    k = 0;
    while ~enough
        s = floor(N/k);
        r = N - s*k;
        if FQbar < (1/3)*(s*(k^2+2*k-(k==1)) + r^2 + 2*r - (r==1))
            enough = true;
        elseif k == N
            enough = true;
        else
            k = k+1;
        end
    end
    result = [k FQbar];
end

