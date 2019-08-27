#-------------------------------------------------------------------------------
function primesUpTo(limit::Integer)
    if limit < 2;    return []; end
    primes = Int64[2]
    sizehint!(primes, convert( Int64, floor( limit / log(limit) ) ))
    oddsAlive = trues((limit-1) ÷ 2) # oddsAlive[i] represents 2i + 1

    i_max = (convert( Int64, floor(√limit) ) - 1) ÷ 2
    for i = 1 : i_max
        if oddsAlive[i] # It's prime.  Kill odd multiples of it 
            push!(primes, 2i + 1)
            Δᵢ = 2i + 1
            for iₓ = i+Δᵢ : Δᵢ : length(oddsAlive);   oddsAlive[iₓ] = false; end
        end
    end
    for i = i_max + 1 : length(oddsAlive) # Remaining living odds also prime
        if oddsAlive[i];    push!(primes, 2i + 1); end
    end

    primes
end
#-------------------------------------------------------------------------------



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function main()
    println("\n"^2)
    @time primes = primesUpTo(10^8)
    println(typeof(primes))
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

main()
