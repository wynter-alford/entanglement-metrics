%% Control Parameters

N1 = 3; %subsystem 1
N2 = 3; %subsystem 2
N = N1+N2;
dim = 2^(N);

J = 10; % coupling between spins
gmax = 1; % on-site interaction

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

Hsys = getHising(N,dim,x,y,z,J,gmax);  % spin chain with NN coupling

%% Access QETLAB
addpath('QETLAB-0.9')
addpath('QETLAB-0.9/helpers')

%% Initial State

% Random Pure State
%psi = randState(N);

% Aligned in X
psi = 1;
for i=1:N
    psi=mykron(psi,xUp);
end

% Density Op
rho = psi*psi';

%% Time-Evolution
T = 1e-3; % how long to time-evolve for
timesteps = 40;

dt = T/timesteps;
U0 = expm(-1i*Hsys*dt);

VNEE = zeros(timesteps,2);
QFI = zeros(timesteps,1);
time = zeros(timesteps,1);

for i=1:timesteps
    time(i)=(i-1)*dt;
    VNEE(i,:)=vnee(rho,N1,N2);
    QFI(i)=qfi(rho,Hsys);
    
    rho = U0*rho*U0';
end

%% Plot Results?
hold on
plot(time,VNEE(:,1))
h = ylabel('Von Neumann Entanglement Entropy');
set(h,'interpreter','Latex','FontSize',14);
yyaxis right
plot(time,QFI)
h = ylabel('Quantum Fischer Information');
set(h,'interpreter','Latex','FontSize',14);

h=xlabel('Time(s)');
set(h,'interpreter','Latex','FontSize',14);