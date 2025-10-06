using Base: @kwdef
import Base: show
using SatelliteDynamics

"""
Immutable parameters of the orbital problem.
"""
@kwdef struct OrbitalParameters
    μ::Float64 = GM_EARTH           # Earth's gravitational parameter (m^3/s^2)
    R_earth::Float64 = R_EARTH      # Earth's radius (m)
    
    J2::Float64 =  J2_EARTH         # J2 perturbation coefficient
    J3::Float64 = -0.2532435346e-5  # J3 perturbation coefficient 
    J4::Float64 = -0.1619331205e-5  # J4 perturbation coefficient 
    J5::Float64 = -0.2277161016e-6  # J5 perturbation coefficient 
end


"""
Parameters for the control system (thruster).
"""
@kwdef struct Thruster
    max_thrust::Float64 # In Newtons
    Isp::Float64        # Specific impulse in seconds
end


"""
A container for all simulation parameters.
This is what we will pass to the ODE solver as `p`.
"""
@kwdef struct SimulationParameters
    orbit::OrbitalParameters
    thruster::Thruster
    initial_mass::Float64
end
