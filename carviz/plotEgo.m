function [] = plotEgo(x,y,theta,T,l,w)
% Real-time plot of car with length l, width w. x,y,theta,T are of same
% length, where x, y are position coordinates, theta is orientation (yaw)
% and T is the timestamp for thee values.

car = Polyhedron('lb',[-l/2 -w/2],'ub',[l/2 w/2]);
xu = x;yu = y;
plot(car,'alpha',0.1);
%%
cpt = []; arr = []; %tmp vars for plotting
arrow = Polyhedron('lb',[0 -eps],'ub',[l eps]);
h = plot(0,0,'o');
plot(xu,yu);hold all;
for i = 1:numel(T)
    delete(h);
    delete(cpt);
    delete(arr);
    
    h = plot(xu(i),yu(i),'*');hold on;
    R = [cos(theta(i)) -sin(theta(i));...
        sin(theta(i)) cos(theta(i))];
    car_t = R*car+[xu(i);yu(i)];
    arrow_t = R*arrow+[xu(i);yu(i)];
    cpt = plot(car_t,'Color','Green','alpha',0.5);hold on;
    arr = plot(arrow_t,'Color','Black');hold on;
    %
    if(i==1)
        pause(T(i)-0);
    else
        pause((T(i)-T(i-1))*0.1);
    end
    mkt = sprintf('%.3f',T(i));
    title(['Time= ',mkt])
end
