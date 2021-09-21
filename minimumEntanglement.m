%% qfibar.m
% Ben Alford
% August, 2021
%
% Calculates minimum entanglement based on QFI-bar as defined in: 
% Hyllus et. al, 2012 --- 10.1103/PhysRevA.85.022321
%

function kmin = minimumEntanglement(FQbar,N)
    
    enough = false;
    k = 0;
    while ~enough
        s = floor(N/k);
        r = N - s*k;
        bound = (1/3)*(s*(k^2 + 2*k - (k==1)) + r^2 + 2*r - (r==1));
        if FQbar <= bound
            enough = true;
        elseif k == N
            enough = true;
        else
            k = k+1;
        end
    end
    kmin = k;
end

