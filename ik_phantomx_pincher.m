clear variables;
clc;

pincher = importrobot('phantomx_rst-master/turtlebot_arm_description/urdf/pincher_arm.urdf');
ik = inverseKinematics('RigidBodyTree', pincher);
initialguess = pincher.homeConfiguration;
tform = [1 0 0 0.3; 0 1 0 0.0; 0 0 1 0.5; 0 0 0 1];
weights = [0.005, 0.05, 0.005, 0.001, 0.001, 0.001];
[configSoln,solnInfo] = ik('gripper_link',tform,weights,initialguess);
for i = 1:4
    configSoln(i)
end
%show(pincher, configSoln);