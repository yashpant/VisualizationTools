% have mpt installed and init

simdata = 1; %change this to 0 if using gomentum data. Sim orientations are in degrees (and offset), GoM in rads.
%filename = 'GoMentum_F5_Run1_ego_from_start'; %the csv file, should be in path
filename = '20200212143750';

l = 4.3;w=1.85; %car dims

% data for a run
data = importfile_csv(filename);
xu = data.position_x;
yu = data.position_y;
if(simdata)
    theta = deg2rad(data.heading+90); %check deg2rad or not, sims are in degrees
else
    theta = theta;
end
T = data.timestamp_sec;

% make the viz
figure(1);
close(1);
figure(1);
plotEgo(xu,yu,(theta),T,l,w); % real-time plot

figure(2) %plot trajectory in x,y plane. Hold all allows you to overlay all trajs the code was run for.
hold all;
plot(xu,yu);

figure(3);
hold all;
subplot(311);hold all;plot(T,xu);ylabel('x (m)');xlabel('Time (s)');hold all;
subplot(312);hold all;plot(T,yu);ylabel('x (m)');xlabel('Time (s)');hold all;
subplot(313);hold a;;plot(T,theta);ylabel('x (m)');xlabel('Time (s)');hold all;



