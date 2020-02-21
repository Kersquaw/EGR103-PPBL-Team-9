%{
    Brennen Mullins
    Spring Calculations
    EGR103-003 Team 9
    02/21/20
%}

% Velocity of our ball:
L = input("Length in meters: "); % meters
angle = input("Angle in degrees: "); % degrees
g = 9.8; % meters/second^2 !constant!

v = sqrt((L*g)/(sind(angle)*cosd(angle)*2)); % meters/second
vRnd = round(v); % round up v to ensure ball will make it
fprintf("The velocity is %f m/s.\n Rounded, that is %d m/s.\n", v, vRnd);

% Kinetic Energy of the Ball:
m = 0.00247; % kilograms !constant!

KE = .5 * m * vRnd^2; % KE = PE for springs

% Finding ideal value for k and deciding on spring:
sprDepress = 0.025; % meters, assuming abt. 1 inch depression
k = (2 * KE)/(sprDepress^2);
kLBIN = k/(17.858);

fprintf("You need a spring that will depress 1 inch comfortably\n and has a k value of %f lb/in.\n", kLBIN);

% Compression Spring 2 Parameters and Proof of Concept:
springCompLength = 0.74; % inches compressed spring length !constant!
springFreeLength = 2.00; % inches free spring length !constant!
springK = 8.5; % lb/in spring factor !constant!
depressMax = springFreeLength - springCompLength; % inches depression distance max
maxForce = springK * depressMax; % lbs force max for spring
safeForce = kLBIN * 1.75;

fprintf("Using spring 1, a maximum force of %f lbs can be achieved.\n",maxForce);