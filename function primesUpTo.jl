#-------------------------------------------------------------------------------
function primesUpTo(limit::Integer)
    if limit < 2;    return []; end
    primes = Int64[2]

    # Use the prime counting function to set
    # the amount of memory to allocate.
    sizehint!(primes, convert( Int64, floor( limit / log(limit) ) ))

    # Keep track of all odd numbers greater than 1
    # that are still candidates for being prime.
    # oddsCandidates[index] represents the number, 2index + 1
    oddsCandidates = trues((limit-1) ÷ 2)

    # Iterate through odd numbers from 3 to the square root of the limit.
    # If that number is still a viable candidate then it must be prime
    # and its multiples must be eliminated as being prime.
    i_max = (convert( Int64, floor(√limit) ) - 1) ÷ 2
    for i = 1 : i_max
        if oddsCandidates[i]
            n = 2i + 1
            for j = i+n : n : length(oddsCandidates)
                oddsCandidates[j] = false
            end
        end
    end

    # Any odd number now that is still a candidate is prime.
    for i = 1 : length(oddsCandidates)
        if oddsCandidates[i];    push!(primes, 2i + 1); end
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
