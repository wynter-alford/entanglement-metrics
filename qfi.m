%% qfi.m
% Ben Alford
% August 2021
% Calculates the Quantum Fischer Information for a density matrix rho and a
% given operator op (usually op = Hsys) 

function QFI = qfi(rho, op)
    [vecs, vals] = eig(rho);
    QFI = 0;
    for k=1:length(vecs)
        for l=1:length(vecs)
            if (vals(k,k)+vals(l,l)) ~= 0
                coeff = ((vals(k,k)-vals(l,l))^2)/(vals(k,k)+vals(l,l));
                prod = abs((vecs(:,k)'*op*vecs(:,l)))^2;

                QFI = QFI + coeff*prod;
            end
        end
    end
    QFI= 2*real(QFI);
end

