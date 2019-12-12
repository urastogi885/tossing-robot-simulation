clear variables;
clc;

% Define symbolic variables
t1 = 0.0068;
t2 = 0.3851;
t3 = 2.2724;
t4 = -1.0876;
len1 = 0.1318;
len2 = 0.0519;
len3 = 0.0519;
len4 = 0.0464;

% Define tranformation matrices
T_0_1 = [cos(t1) 0 sin(t1) 0; sin(t1) 0 -cos(t1) 0; 0 1 0 len1; 0 0 0 1];
T_1_2 = [cos(t2) -sin(t1) 0 0; sin(t1) cos(t1) 0 0; 0 0 1 0; 0 0 0 1];
T_2_3 = [cos(t3) -sin(t3) 0 0; sin(t3) cos(t3) 0 0; 0 0 1 0; 0 0 0 1];
T_3_3prime = [-sin(t4) 0 cos(t4) 0; cos(t4) 0 sin(t4) 0; 0 1 0 0; 0 0 0 1];
T_3prime_4 = [1 0 0 0; 0 1 0 0; 0 1 0 len2+len3+len4; 0 0 0 1];
T_3_4 = T_3_3prime * T_3prime_4;

% Define transformation matrices w.r.t base frame
T_0_2 = T_0_1 * T_1_2;
T_0_3 = T_0_1 * T_1_2 * T_2_3;
T_0_4 = T_0_1 * T_1_2 * T_2_3 * T_3_4;