disp('Spherical Manipulator - Modern Variant')
%nyenyenye
syms a1 a2 a3 a4 d3

%% Link lengths
a1 = 0;
a2 = 3.5;
a3 = 3.5;
a4 = 1;

%% Joint Variable
d3 = 1;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,0,0,0,1,a1]);
H0_1.qlim = [0 0];

H1_2 = Link([0,a2,0,pi/2,0,0]);
H1_2.qlim = [0 pi/2];

H2_3 = Link([0,0,a3,3*pi/2,0,pi/2]);
H2_3.qlim = [0 pi/2];

H3_4 = Link([0,0,0,0,1,a4+d3]);
H3_4.qlim = [0 a4+d3];

Sphe = SerialLink([H0_1 H1_2 H2_3 H3_4], 'name', 'Spherical_Modern_Variant')
Sphe.plot([0 0 0 0], 'workspace', [-10 10 -10 10 -8 8])
Sphe.teach
