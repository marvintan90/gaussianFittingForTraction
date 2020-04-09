function [x,resnorm,residual,exitflag,output,xdata, xpk, ypk, xSig, ySig] = D2GaussFit(Im)

%% Fit a 2D gaussian function to data
%% PURPOSE:  Fit a 2D gaussian centroid to simulated data
% Uses lsqcurvefit to fit
%
% INPUT:
% 
%   MdataSize: Size of nxn data matrix
%   x0 = [Amp,x0,wx,y0,wy,fi]: Inital guess parameters
%   x = [Amp,x0,wx,y0,wy,fi]: simulated centroid parameters
%   noise: noise in % of centroid peak value (x(1)
%   InterpolationMethod = 'nearest' or 'linear' or 'spline' or 'cubic'
%       used to calculate cross-section along minor and major axis
%     
%
%
% NOTE:
%   The initial values in x0 must be close to x in order for the fit
%   to converge to the values of x (especially if noise is added)
%
% OUTPUT:  non
%
% CREATED: G. Nootz  May 2012
% 
%  Modifications:
%  non
%% ---------User Input---------------------


%   Detailed explanation goes here
    MdataSize=size(Im,1)-1;
    [X,Y] = meshgrid(  int32(-MdataSize/2) : int32(MdataSize/2)  );
    xdata = zeros(size(X,1),size(Y,2),2);
    xdata(:,:,1) = X;
    xdata(:,:,2) = Y;
    x0 = [150,0,4,0,4];  %[Amp,x0,wx,y0,wy]
    
    % lb = [0,-MdataSize/2,0,-MdataSize/2,0,-pi/4];
    % ub = [realmax('double'),MdataSize/2,(MdataSize/2)^2,MdataSize/2,(MdataSize/2)^2,pi/4];
    % options = optimset('Display','off');
    %  [x,resnorm,residual,exitflag] = lsqcurvefit(@D2GaussFunction,x0,xdata,Im,lb,ub,options);
    [x,resnorm,residual,exitflag,output] = lsqcurvefit(@D2GaussFunction,x0,xdata,Im);
    %  fit=D2GaussFunction(x,xdata);
    xpk = x(2); % mean
    ypk = x(4); % mean
    xSig = x(3); % standard deviation
    ySig = x(5); % standard deviation
    

end

