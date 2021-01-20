MODEL 1: 

using JuMP, GLPK;

m = Model(with_optimizer(GLPK.Optimizer));

@variable(m, xge >=0);
@variable(m, xke >=0);
@variable(m, xgt >=0);
@variable(m, xkt >=0);
@variable(m, xgn >=0);
@variable(m, xkn >=0);

@objective(m, Min, 21xge + 22.5xke + 22.5xgt + 24.5xkt + 23xgn + 25.5xkn)

@constraint(m, constraint1, xge + xke <= 425)
@constraint(m, constraint2, xgt + xkt <= 400)
@constraint(m, constraint3, xgn + xkn <= 750)
@constraint(m, constraint4, xge + xgt + xgn >= 550)
@constraint(m, constraint5, xke + xkt + xkn >= 450)

print(m)

optimize!(m)

termination_status(m)

println("Optimal Solutions:")
println("xge = ", value(xge))
println("xke = ", value(xke))
println("xgt = ", value(xgt))
println("xkt = ", value(xkt))
println("xgn = ", value(xgn))
println("xkn = ", value(xkn))
