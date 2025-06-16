# Prime Modulated Quadratic Residuosity Validator

def exponentiate_modularly(base, index, modulus)
    if base == 0 then return 0 end
    if index == 0 then return 1 end
    
    if base > modulus then base %= modulus end
    if index == 1 then return base end
    
    residue = 1
    
    while index > 0
        if index & 1 == 1 then residue = (residue * base) % modulus end
        
        base = (base * base) % modulus
        index >>= 1
    end
    
    return residue
end

def validate_prime_modulated_quadratic_residuosity(prime_modulus, quadratic_residue_candidate)
    exponent = (prime_modulus - 1) >> 1
    congruence = exponentiate_modularly(quadratic_residue_candidate, exponent, prime_modulus)
    
    if congruence == 1 then
        return true
    else
        return false
    end
end

print "Enter a prime number modulus: "
prime_modulus = gets.to_i

print "Enter a quadratic residue candidate modulo " + prime_modulus.to_s + ": "
quadratic_residue_candidate = gets.to_i

puts

if validate_prime_modulated_quadratic_residuosity(prime_modulus, quadratic_residue_candidate)
    quadratic_residue = quadratic_residue_candidate
    puts quadratic_residue.to_s + " is a quadratic residue modulo " + prime_modulus.to_s + "."
else
    quadratic_nonresidue = quadratic_residue_candidate
    puts quadratic_nonresidue.to_s + " is a quadratic nonresidue modulo " + prime_modulus.to_s + "."
end

puts

# Factorized Semiprime Modulated Quadratic Residuosity Validator

def validate_factorized_semi_prime_modulated_quadratic_residuosity(first_prime_factor, second_prime_factor, quadratic_residue_candidate)
    if validate_prime_modulated_quadratic_residuosity(first_prime_factor, quadratic_residue_candidate) and validate_prime_modulated_quadratic_residuosity(second_prime_factor, quadratic_residue_candidate)
        return true
    else
        return false
    end
end

print "Enter first prime number: "
first_prime_factor = gets.to_i

print "Enter second prime number: "
second_prime_factor = gets.to_i

puts

semiprime_modulus = first_prime_factor * second_prime_factor

print "Semiprime modulus æ " + semiprime_modulus.to_s + " æ " + first_prime_factor.to_s + " ⋅ " + second_prime_factor.to_s + " æ " + "first prime factor ⋅ second prime factor"

puts
puts

print "Enter a quadratic residue candidate modulo " + semiprime_modulus.to_s + ": "
quadratic_residue_candidate = gets.to_i

puts

if validate_factorized_semi_prime_modulated_quadratic_residuosity(first_prime_factor, second_prime_factor, quadratic_residue_candidate)
    quadratic_residue = quadratic_residue_candidate
    puts quadratic_residue.to_s + " is a quadratic residue modulo " + semiprime_modulus.to_s + "."
else
    quadratic_nonresidue = quadratic_residue_candidate
    puts quadratic_nonresidue.to_s + " is a quadratic nonresidue modulo " + semiprime_modulus.to_s + "."
end
