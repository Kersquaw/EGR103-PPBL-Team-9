% Create a program to plot the motion of the ping pong ball with drag. 
% The program will take inputs for velocity in m/s and angle of launch.
% note that with a high speed camera I estmated a launch speed for a ping
% pong ball could be 30 m/s.

%--------------------------------------------------------------------------
% WRITTED BY DR. JULIE WHITNEY
% MODIFIED BY TEAM 9 (PING PONG BALLERS) EGR103-003 02/23/20
% Jason S., Brennen M., Griffin D., William Y., Christian S.
%--------------------------------------------------------------------------
vel=30;  %m/s
angle=60;
% convert the degrees into radians so MATLAB likes it
angle=angle*pi/180;

% set initial values (time, distance, mass, gravity, drag) 
x(1)=0; % meters
y(1)=.01;  % meters
time(1)=0; % seconds
mass=.00247; %kg  ping pong ball .00247 Kg
g=-9.8; % m/sec^2
c=.0005; % coefficient of drag with density and area in this constant
index=1; % so I can load an array for plotting

% start to increment the motion and define it component forces
velx=vel*cos(angle);
VelocityX(1)=velx;
vely=vel*sin(angle);
VelocityY(1)=vely;

% set a time step and variable for height
deltaTime=.001; % seconds
height=y(1);

while height>=0 % check that the ball has not hit ground yet 
    index = index+1; % setup and index
    time(index)=time(index-1)+deltaTime;
   
    % *******************************************************
    % break velocity into its components
    velx = vel*cos(angle);
    vely = vel*sin(angle);
    % *******************************************************
    
    
    % *******************************************************
    % use an if/else statement to check to see if the ball is moving 
    % down (negative). If it is, then drag has an opposite sign
    % as gravity in the acceleration formula.  Otherwise gravity
    % and drag have the same sign. Calculate the new acceleration in the y.
    if vely < 0
        adragy = g + (c*vely^2)/mass;
    else
        adragy = g - (c*vely^2)/mass;
    end
    % *******************************************************
    
    % *******************************************************
    % Now calculate the acceleration in the x .
    adragx = (-c*velx^2)/mass;
    % *******************************************************
    
    
    % *****************************************************
    % calculate the new velocity at the end of the time step
    % this will have X and Y components, so you need a variable
    % for each.  One is velFinalX and the other is velFinalY.
    velFinalX = velx + adragx*deltaTime;
    velFinalY = vely + adragy*deltaTime;
    % *******************************************************
   
    
    % ******************************************************
    % Get a new velocity vector and angle given the X and Y
    % The velocity is the variable "vel" and angle is "angle"
    vel = sqrt(velFinalX^2 + velFinalY^2);
    angle = atan(velFinalY/velFinalX);
    %*******************************************************
    
    % now save my values at this time step
    VelocityX(index)=velFinalX;
    VelocityY(index)=velFinalY;
    
    % and distance numbers
    distX=velx*deltaTime;
    distY=vely*deltaTime;
    
    % save distance values 
    x(index)=x(index-1)+distX;
    y(index)=y(index-1)+distY;
    height=y(index);
   
end

plot(x,y)
title('distance traveled by ping pong ball in meters')
xlabel('horizontal distance traveled (meters)')
ylabel('vertical distance traveled (meters)')
