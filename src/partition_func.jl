using Interpolations

"""
    functon setup_atomic_partition_funcs()

Constructs a Dict holding functions for various atomic species that computes the partition function
at an input temperature.

In more detail, the partition function is linearly interpolated from values tabulated from Barklem 
& Collet (2016). The partition functions can only be evaluated at temperatures between 1e-5 K and 
1e4 K. The tabulated values were NOT computed with a cutoff principle quantum number. This can lead
to a couple percent error for some neutral species in solar type stars (I think the problem becomes
worse in hotter stars). See the paper for more details.

Note that the paper seems to suggest that we could actually use cubic interpolation. That should be
revisited in the future.
"""
function setup_atomic_partition_funcs(fname=joinpath(_data_dir, 
                                                     "BarklemCollet2016-atomic_partition.dat"))
    # We had the option of downloading the file as a FITS table, but when we do that, we lose the
    # information about the temperatures. It might make sense to repackage the data in the future.
    temperatures = Vector{Float64}()
    data_pairs = Vector{Tuple{AbstractString,Vector{Float64}}}()
    open(fname, "r") do f
        for line in eachline(f)
            if (length(line)>=9) && (line[1:9] == "#   T [K]")
                append!(temperatures, parse.(Float64,split(strip(line[10:length(line)]))))
            elseif line[1] == '#'
                continue
            else # add entries to the dictionary
                row_entries = split(strip(line))
                species = popfirst!(row_entries)
                push!(data_pairs, (species, parse.(Float64, row_entries)))
            end
        end
    end

    map(data_pairs) do (species, vals)
        species, LinearInterpolation(temperatures, vals, extrapolation_bc=Throw())
    end |> Dict
end