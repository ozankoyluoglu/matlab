% How to reduce marker frequency in MATLAB Plots
% I had this problem several times and everytime I was just like "forget it". 
% Last time when I needed this, I said "enough" and established this code.

clear all;
close all;
MarkerFactor = 20/100; % Will reduce marker frequency to 20 percent.

x=[-pi:pi/40:pi];
y(1,:)=sin(x);
y(2,:)=cos(x);
y(3,:)=sin(x).^2;
legend_v = ['sin ';'cos ';'sin^2'];
notation_v = ['rd: ';'b.--';'ys- '];

% Bad Marking
figure();
title('Bad Marking');
hold on;
for i=1:length(legend_v(:,1))
  plot(x,y(i,:),notation_v(i,[1,2,3,4]),'LineWidth',3,'MarkerSize',12);
end
legend(legend_v);

% Good Marking
figure();
title('Good Marking');
hold on;
for i=1:length(legend_v(:,1))
  plo_index(i) = plot(x,y(i,:),notation_v(i,[1,3,4]),'LineWidth',3);
end
leg_index = legend(plo_index,legend_v);
lin_index = findall(leg_index,'type','line'); % legend indices in reverse order, odd indices are mid-points of the lines in the legend, even indices are the end points of the lines
marker_v = [1:ceil(length(x)*MarkerFactor):length(x) length(x)]; % marker vector
% Plot markers
Index_Marker = 1;
for i = length(legend_v(:,1)):-1:1
  plot(x(marker_v),y(i,marker_v),notation_v(i,[1,2]),'LineWidth',3,'MarkerSize',12);
  point_x = get(lin_index(2*Index_Marker-1),'xdata');
  point_y = get(lin_index(2*Index_Marker-1),'ydata');
  plot(point_x,point_y,'parent',leg_index,'marker',notation_v(i,2),'color',notation_v(i,1),'LineWidth',3,'MarkerSize',12);
  Index_Marker = Index_Marker + 1;
end
