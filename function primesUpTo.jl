#-------------------------------------------------------------------------------
function primesUpTo(limit::Integer)
    if limit < 2    return []  end
    primes = Int64[2]
    πLim = convert( Int64, floor( limit / log(limit) ) )
    sizehint!(primes, πLim)
    oddsElim = falses(limit-1 ÷ 2) # odds except 1
    i_max = (convert(Int64, floor(√limit))-1) ÷ 2

    for i = 1 : i_max
        if !oddsElim[i]
            n = 2i + 1
            for ĩ = i + n : n : length(oddsElim)
                oddsElim[ĩ] = true
            end
        end
    end

    for i = 1 : length(oddsElim)
        if !oddsElim[i]    push!(primes, 2i + 1)  end
    end

    primes
end
#-------------------------------------------------------------------------------
