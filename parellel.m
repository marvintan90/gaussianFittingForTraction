
% fun is the function to apply, vectorized (see the dot)
fun = @(x) x.^2;


inputs = 1:10;
numCores = nproc();

% assumes that processInput is defined in a separate function file
[result] = pararrayfun (numCores, fun, inputs);

[result] = pararrayfun ( nproc(), fun, inputs);