module RadiativeTransfer

# for generate_mu_grid
using FastGaussQuadrature: gausslegendre
"""
    generate_mu_grid(n_points)

Used by both radiative transfer schemes to compute quadature over μ. Returns `(μ_grid, μ_weights)`.
"""
function generate_mu_grid(n_points; mode="gl")
    if mode == "gl"
        μ_grid, μ_weights = gausslegendre(n_points)
        μ_grid = @. μ_grid/2 + 0.5
        μ_weights ./= 2
    elseif mode == "user"
        μ_grid = range(0, 1, npoints)
        μ_weights = ones(npoints)
    end
    μ_grid, μ_weights
end

include("BezierTransfer.jl")
include("MoogStyleTransfer.jl")

end #module