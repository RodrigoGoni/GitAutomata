%% ejes 
clear clc
% X
x=-30:0.1:50;
VelMax_x=[-4 4];
acelMax_x=[-1 1];
% Y
y=-20:0.1:40;
Yt0=45;
despejeMin_m=15;
VelMax_yC=[-1.5 1.5];
VelMax_yD=[-3 3];
acleMax_y=[-1 1];
% carga supendida
g=9.80665;
delta_t=0;
Spreader=15000;
mCont_D=2000;
mCont_C=50000;
carga_min=Spreader+mCont_D;
carga_nom=Spreader+mCont_C;
% Traslacion de carro
m_c=50000;
Rw=0.5;
Jw=2;
i_c=15;
Jm_c=10;
beq_c=30;
beq_cel=beq_c*i_c^2;
bv_c=0;
m_i=0;
% izaje de carga
Kw=1800e3;
bw=30e3;
Rd=0.75;
Jd=8;
i_i=30;
Jm_i=30;
beq_i=18;
beq_iel=beq_i*i_i^2;
m_h=0;
b_h=0;
%% Resultado equivalentes 
%carro
Jeq_c=Jw+Jm_c*i_c^2;
Meq_c=m_c+Jeq_c/Rw^2;
beq_tc=(bv_c+beq_cel)/Rw^2;
%izaje
Jeq_i=Jd+Jm_i*i_i^2;
Meq_i=m_h+Jeq_i/Rd^2;
beq_ti=(b_h+beq_iel)/Rd^2;
% Modulador de torque
Tau=1e-3;
ml=65000
% %% Load
bcx=1000e3;
bcy=500e3;
Kcy=1.3e9;
% t_carro=0:0.1:120;
% torque_carro=zeros(1,1201);
% for i=1:1201
% if i<100    
% torque_carro(i)=1;
% end
% if and(i>300,i<400)
% torque_carro(i)=-2;
% end
% end
% torque_ts=timeseries(torque_carro,t_carro);
% plot(torque_ts)

%% frecuencia lazo discreto 
polo_c=7*beq_tc/Meq_c;
polo_i=5*beq_ti/Meq_i;
n=2.5;
% PID gains
Kcd=Meq_c*polo_c*n;
Kcp=Kcd*polo_c;
Kci=Kcp*polo_c/n;

Kii=Meq_i*polo_i*n;
Kip=Kcd*polo_i;
Kid=Kcp*polo_i/n;
X_com=0;
Y_com=0;
Manual2Auto=0;
