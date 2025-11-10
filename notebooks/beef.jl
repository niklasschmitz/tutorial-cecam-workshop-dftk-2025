module Beef
using DftFunctionals

"""
The BEEF ensemble is described by a Gaussian distribution
    in parameters θ ∼ N(θ_bf, LLᵀ)
    or equivalently: θ = θ_bf + L * α
    where α is standard normal.

From the paper:
    `Bayesian Error Estimation in Density-Functional Theory` (2005)
    J. J. Mortensen, K. Kaasbjerg, S. L. Frederiksen, J. K. Nørskov,
    J. P. Sethna, and K. W. Jacobsen
    DOI: https://doi.org/10.1103/PhysRevLett.95.216401
"""
function params_beef_2005()
    θ_bf = [1.0008, 0.1926, 1.8962]  # After Eq (4)
    L = [
        0.066 0.055 -0.034 
       -0.812 0.206  0.007 
        1.996 0.082  0.004
    ]  # Eq (5)
    (; θ_bf, L)
end

struct BeefExchange{T} <: Functional{:gga,:x} where {T}
    θ::T
    identifier::Symbol
end
BeefExchange(θ) = BeefExchange(θ, :gga_x_beef_custom)

DftFunctionals.parameters(beefx::BeefExchange) = beefx.θ
DftFunctionals.identifier(beefx::BeefExchange) = beefx.identifier

function DftFunctionals.change_parameters(beefx::BeefExchange, parameters::AbstractArray;
    keep_identifier=false)
    if keep_identifier
        BeefExchange(parameters, beefx.identifier)
    else
        BeefExchange(parameters)
    end
end

function f_x_beef(s, θ)
    sum(enumerate(θ)) do (i, θi)
        θi * (s / (one(s) + s))^(2i - 2)  # (3)
    end
end

function DftFunctionals.energy(beefx::BeefExchange, ρ::T, σ::U) where {T<:Number,U<:Number}
    TT = DftFunctionals.arithmetic_type(beefx, T, U)

    # s is the dimensionless electron density gradient
    # s = sqrt(σ) / (2kF * ρ)  # Above eq (2)
    s = sqrt(σ) / (ρ^(4 / 3) * 2cbrt(3π^2))
    
    res = DftFunctionals.energy(LdaExchange(), ρ) * f_x_beef(s, beefx.θ)
    TT(res)
end

make_beef(θ) = [DftFunctional(Val(:gga_c_pbe)), BeefExchange(θ)]
end # module Beef
