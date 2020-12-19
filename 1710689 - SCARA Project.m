L1 = 325;
L2 = 225;
L(1) = Link([0 0 L1 0 0]);
L(2) = Link([0 0 L2 pi 0]);
L(3) = Link([-pi/4 0 0 0 1]);
% set limits for joints
L(1).qlim=[deg2rad(-170) deg2rad(170)];
L(2).qlim=[deg2rad(-150) deg2rad(150)];
L(3).qlim=[0 140];
Scara = SerialLink(L, 'name', 'Scara');
input_data = readmatrix('ellipse.xlsx');
X = input_data(:,2:2);
Y = input_data(:,3:3);
Z = input_data(:,4:4);
for i = 1:(length(X)-1)
T(:,:,i) = transl(X(i), Y(i), Z(i));
% T(:,:,i) = transl(X(i), Y(i), 0);
end
qs = Scara.ikcon(T);
Scara.plot(qs,'loop','trail', {'r', 'LineWidth', 2});