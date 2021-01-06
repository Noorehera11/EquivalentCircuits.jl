"""
    OptimizeParameters(Objective,Initial_parameters)
Returns the optimal parameters for a given circuit, provided its Objective function (obtained by the ObjectiveFunction function)
and a set of Initial_parameters (as obtained by the InitializeParameters function).
"""


function OptimizeParameters(Objective,Initial_parameters)
    if length(Initial_parameters) == 1
        return [1]
    else
    lower = zeros(length(Initial_parameters))
    upper = [10e3 for i in 1:length(Initial_parameters)]
    inner_optimizer = NelderMead()
    results = optimize(Objective, lower, upper, Initial_parameters, Fminbox(inner_optimizer),Optim.Options(time_limit = 20.0))
    return results.minimizer
end
end

function OptimizeParameters2(Objective,Initial_parameters,upper)
    lower = zeros(length(Initial_parameters))
    inner_optimizer = NelderMead()
    results = optimize(Objective, lower, upper, Initial_parameters, Fminbox(inner_optimizer),Optim.Options(time_limit = 20.0))
    return results.minimizer
end
