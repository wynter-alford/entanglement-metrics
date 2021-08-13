%% Control Parameters

N1 = 3; %subsystem 1
N2 = 3; %subsystem 2
N = N1+N2;
dim = 2^(N);

J = 10; % coupling between spins
gmax = 1; % on-site interaction (multiplied by rand for each site)

%% Pauli Matrices
z=sparse([1 0; 0 -1]);
x=sparse( [ 0 1;1 0]); 
y=1i*sparse([0 -1;1 0]);

Z=sparse(dim,dim);
X=sparse(dim,dim);
Y=sparse(dim,dim);
for k=1:N
      Z = Z + mykron(speye(2^(k-1)),2*z,speye(2^(N-k)));
      X = X + mykron(speye(2^(k-1)),2*x,speye(2^(N-k)));
      Y = Y + mykron(speye(2^(k-1)),2*y,speye(2^(N-k)));
end

zUp = [1; 0];
zDn = [0; 1];
xUp = (1/sqrt(2))*[1; 1];
xDn = (1/sqrt(2))*[1; -1];
yUp = (1/sqrt(2))*[1; 1i];
yDn = (1/sqrt(2))*[1; -1i];

Hsys = getHising(N,dim,x,[0 0; 0 0],z,J,gmax);  % spin chain with NN coupling (currently no YY coupling)

%% Access QETLAB
addpath('QETLAB-0.9')
addpath('QETLAB-0.9/helpers')

%% Initial State

% Random Pure State
% psi = randState(N);

% Aligned in +X
psi = ghz(N,zUp,zUp);

% GHZ in Z
% psi = ghz(N,zUp,zDn);

% Density Op
rho0 = psi*psi';

%% Time-Evolution
T = 1e-4; % how long to time-evolve for
timesteps = 120;
dt = T/timesteps;

U0 = expm(-1i*Hsys*dt);
rho = rho0;

VNEE = zeros(timesteps,2);
QFI = zeros(timesteps,1);
kmin = zeros(timesteps,2);
time = zeros(timesteps,1);

for i=1:timesteps
    time(i)=(i-1)*dt;
    VNEE(i,:)=vnee(rho,N1,N2);
    QFI(i)=qfi(rho,Hsys);
    kmin(i,:)=minimumEntanglement(rho,N,X,Y,Z);
    
    rho = U0*rho*U0';
end

%% Plot Results?

myColors = {[250 190 212],[230 25 75],[245 130 48],[255 225 25], [210 245 60], [60 180 75], [70 240 240], [0 130 200], [145 30 180]};
% colors are:  pink          red          orange      yellow        lime          green        cyan         blue         violet

for cloop = 1:length(myColors)
    myColors{cloop} = myColors{cloop}/255;
end

hold on
colororder({'black','black'})
plot(time,VNEE(:,1),'Color',myColors{2})
h = ylabel('von Neumann Entanglement Entropy');
set(h,'interpreter','Latex','FontSize',18);
yyaxis right
ax.Ycolor = [0 0 0];
plot(time,QFI,'Color',myColors{8})
plot(time,kmin(:,2),'Color',myColors{9})
h = ylabel('Quantum Fischer Information');
set(h,'interpreter','Latex','FontSize',18);
h=xlabel('Time(s)');
set(h,'interpreter','Latex','FontSize',18);
legend('EE','QFI(rho,Hsys)','QFI(rho,Ji)')