warning('off', 'all')

run("./createMainModel.m")

dateData = "20241211";

run("./runScript")

%parameterEstimation_main([], "Nonlinear Least Squares", dateData)
parameterEstimation_main([], 'mainModelNew', "Simplex", dateData)

