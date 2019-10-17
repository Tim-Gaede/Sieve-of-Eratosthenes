#-------------------------------------------------------------------------------
# Implementation of the Sieve of Eratosthenes where we take advantage of
# the option to iterate a for loop by more than 1.  Multiplying two numbers to
# get an odd would imply that both of those numbers were also odd.
function primesTo(n::Integer)
    if n < 2;    return []; end
    primes = Int64[2]
    sizehint!(primes, convert( Int64, floor( n / log(n) ) ))
    oddsAlive = trues((n-1) ÷ 2) # oddsAlive[i] represents 2i + 1

    i_lim = (convert( Int64, floor(√n) ) - 1) ÷ 2
    for i = 1 : i_lim
        if oddsAlive[i] # It's prime.  Kill odd multiples of it
            push!(primes, 2i + 1)
            Δi = 2i + 1
            for iₓ = i+Δi : Δi : length(oddsAlive);   oddsAlive[iₓ] = false; end
        end
    end
    for i = i_lim + 1 : length(oddsAlive) # Surviving odds also prime
        if oddsAlive[i];    push!(primes, 2i + 1); end
    end

    primes
end
#-------------------------------------------------------------------------------


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function main()
    println(primesTo(50))
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
main()
