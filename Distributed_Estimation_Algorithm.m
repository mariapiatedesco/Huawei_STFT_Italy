%% Define a random number of nurses and patients
nurses_number = 5;
patients_number = 20;

%% Create the array position of patients and the starting position for the nurses
patient_positions = zeros(patients_number, 2);
nurse_positions = zeros(nurses_number, 2);

%Define the max and min value of the cartisian coordinates
max_x = 100;
min_x = 5;

max_y = 20; 
min_y = 10;

%Create patient position matrix
for i = 1:patients_number
    if i <= patients_number/2
        patient_positions(i,1) = 10*i;
        patient_positions(i,2) = min_y;
    else
        patient_positions(i,1) = 10*(i-patients_number/2);
        patient_positions(i,2) = max_y;
    end
end

%Create nurse position matrix
for i = 1:nurses_number
    nurse_positions(i,1) = randi([min_x max_x]);
    nurse_positions(i,2) = randi([min_y max_y]);
end

%% Define the graph adjacency matrix (device connection)
system_dim = patients_number+nurses_number;
A = ones(system_dim,system_dim)-eye(system_dim,system_dim);
pos = [patient_positions; nurse_positions];

g = graph(A);

%% Simulation

%Define parameters for the simulation
X = zeros(system_dim, 2); %First estimate of the positions X = 0nxn
B = incidence(g); %Define the incidence matrix
n_measurements = 200; %Number of measurements that the devices do during 1s
alpha = 0.01; %Learning rate from measurement
cov = 0.01; %Covaraince for every edge
mu = 0; %Mean of the noise
sigma = 0.05;   %Variance of the noise
step = 0.5; %Variance of the gaussian distribution to run the random walk

n_movements = 100
fig = figure(1);
fig.Position = [100 50 1080 720];

for i = 1:n_movements
    %Estimate of the position
    
    x_hat = estimatePosition(X, pos, B, n_measurements, alpha, cov, mu, sigma, system_dim, g);
    x_hat = round(x_hat, 2);
    Labels = labeling(x_hat, system_dim);
    
    %plot the position and the labels
    
    p = plot(g);
    title('Distributed algorithm for indoor localization')
    p.XData = pos(:,1);
    p.YData = pos(:,2);
    highlight(p,[system_dim-nurses_number+1:system_dim],'NodeColor','g');
    labelnode(p,[1:system_dim],Labels);
    drawnow
    pause(0.001)
    frame = getframe(fig);
    im{i} = frame2im(frame);
    
    %update the nurses position
    
    nurses_new_position = random_walk(pos, mu, step, system_dim, nurses_number, max_y, min_y);
    pos(system_dim-nurses_number+1:system_dim,:) = nurses_new_position;  
end
close;

%% Create the gif

figure;
for i = 1:n_movements
    subplot(n_movements/2,n_movements/2,i)
    imshow(im{i});
end

filename = "Distributed_Algorithm_for_Internal_Localization.gif"; % Specify the output file name
for i = 1:n_movements
    [A,map] = rgb2ind(im{i},256);
    if i == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1);
    end
end

%% Define useful functions

function y = compute_measurement(system_dimension, real_positions, mu, sigma, g)
    y = zeros(system_dimension*(system_dimension-1)/2,2);
    [sOut,tOut] = findedge(g);
    for i = 1:system_dimension*(system_dimension-1)/2
        y(i, 1) = real_positions(sOut(i),1) - real_positions(tOut(i),1);
        y(i, 2) = real_positions(sOut(i),2) - real_positions(tOut(i),2);
    end
end

function x_hat = estimatePosition(X, real_positions, B, n_measurements, alpha, cov, mu, sigma, system_dimension, g)
    I = eye(system_dimension);
    size(I)
    cov_matrix =  eye(system_dimension*(system_dimension-1)/2)*cov;
    inv_cov_matrix =  eye(system_dimension*(system_dimension-1)/2)*1/cov;
    L = B*cov_matrix*B.';
    for measure = 1:n_measurements
        y = compute_measurement(system_dimension, real_positions, mu, sigma, g);
        meas_contribute = alpha*B*inv_cov_matrix*y;
        x_hat = (I - alpha*L)*X + meas_contribute;
    end
end

function nurses_new_position = random_walk(x_real, mu, sigma, sys_dim, n_n, max_y, min_y)
    nurses_position_x = x_real(sys_dim-n_n+1:sys_dim,1);
    nurses_position_y = x_real(sys_dim-n_n+1:sys_dim,2);
    
    for nurse = 1:n_n
       if max_y - nurses_position_y(nurse)<=1
           nurses_position_y(nurse) = nurses_position_y(nurse) - 1;
       elseif abs(nurses_position_y(nurse)- min_y) <=1
           nurses_position_y(nurse) = nurses_position_y(nurse) + 1;
       end
    end
    
    x_movement = normrnd(mu,sigma,[n_n,1]);
    y_movement = normrnd(mu,sigma,[n_n,1]);
    
    nurses_position_x = nurses_position_x + x_movement;
    nurses_position_y = nurses_position_y + y_movement;
    
    nurses_new_position = [nurses_position_x, nurses_position_y];

end

function labels = labeling(x_hat, sys_dim)
    labels = {};
    for i = 1:sys_dim
        x_str = num2str(x_hat(i,1));
        y_str = num2str(x_hat(i,2));
        label = strcat(x_str, ',', y_str);
        labels(i) = cellstr(label);
    end
end