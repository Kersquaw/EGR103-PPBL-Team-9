%{
    Brennen Mullins
    webcamFind !FUNCTION!
    EGR103-003 Team 9 PING PONG BALLERS
    02/24/20
    Searches for, connects to, and previews the webcam.
%}

% MUST HAVE THE USB WEBCAM LIBRARY
function[cam] = webcamFind()
camList = webcamlist;
webcamIndex = -1; % NOT FOUND
for index = 1:length(camList)
    if camList(index) == "USB2.0 HD UVC WebCam"
        webcamIndex = index;
        break;
    end
end
if webcamIndex == -1 % IF NOT FOUND
    fprintf('Could not find project webcam...')
else
    cam = webcam(webcamIndex);
    fprintf(['The project webcam is indexed at %d.\n'...
         'Camera has been set as variable: webcam.\n'...
         'Now previewing video feed...\n'], webcamIndex);
     preview(cam);
end
end
