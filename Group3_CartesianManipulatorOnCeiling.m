disp('Cartesian Manipulator on ceiling')

syms a1 a2 a3 a4 d1 d2 d3

%% Link lengths
a1 = 3;
a2 = 1.25;
a3 = 1.5;
a4 = 1.25;

%% Joint Variable
d1 = 1.25;
d2 = 1.5;
d3 = 1.25;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,0,0,pi/2,1,-a1]);
H0_1.qlim = [0 0];

H1_2 = Link([pi/2,0,0,pi/2,1,a2+d1]);
H1_2.qlim = [0 a2+d1];

H2_3 = Link([pi/2,0,0,2*pi-pi/2,1,a3+d2]);
H2_3.qlim = [0 a3+d2];

H3_4 = Link([0,0,0,0,1,a4+d3]);
H3_4.qlim = [0 a4+d3];

Cart = SerialLink([H0_1 H1_2 H2_3 H3_4], 'name', 'Cartesian_On_Ceiling');
Cart.plot([0 0 0 0], 'workspace', [-4 10 -10 1 -10 2])
Cart.teach
