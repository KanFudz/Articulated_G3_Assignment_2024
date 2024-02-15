disp('SCARA_PRRVARIANT')
ewrwe
syms a1 a2 a3 a4 d1

%% Link lengths

a1 = 2.5;
a2 = 3;
a3 = 3;
a4 = 4;

%% Joint Variables
d1 = 2.5;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,0,a2,0,1,a1+d1]);
H0_1.qlim = [0 d1];

H1_2 = Link([0,0,a3,0,0,0]);
H1_2.qlim = pi/180*[-90 90];

H2_3 = Link([0,0,a4,0,0,0]);
H2_3.qlim = pi/180*[-90 90];

SCARA_PRRVARIANT = SerialLink([H0_1 H1_2 H2_3], 'name', 'SCARA_PRR_VARIANT');
SCARA_PRRVARIANT.plot([0 0 0], 'workspace', [-15 15 -15 15 -15 15])
SCARA_PRRVARIANT.teach
