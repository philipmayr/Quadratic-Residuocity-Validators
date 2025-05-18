# Prime Modulus Quadratic Residuosity Decider

def exponentiate_modularly(base, index, modulus)
    if base == 0 return 0
    if index == 0 return 1
    
    if base > modulus base %= modulus;
    if index == 1 return base;
    
    residue = 1
    
    while index > 0
        if index & 1 == 1
            residue = (residue * base) % modulus
        end
        
        base = (base * base) % modulus
        index >>= 1
    end
    
    return residue;
end

def decide_prime_modulus_quadratic_residuosity(p, x)
    i = (p - 1) >> 1
    b = exponentiate_modularly(x, i, p)

    if b == 1 
        return true
    else
        return false
    end
end

# get prime p
print "Enter a prime number modulus: "
p = gets.to_i

# get quadradic residue candidate
print "Enter a quadratic residue candidate modulo " + p.to_s + ": "
x = gets.to_i

puts

if decide_prime_modulus_quadratic_residuosity(p, x)
    puts x.to_s + " is a quadratic residue modulo " + p.to_s + "."
else
    puts x.to_s + " is a quadratic nonresidue modulo " + p.to_s + "."
end

puts

# Known Factorization Composite Modulus Quadratic Residuosity Decider

def decide_known_factorization_composite_modulus_quadratic_residuosity(p, q, x)
    if decide_prime_modulus_quadratic_residuosity(p, x) and decide_prime_modulus_quadratic_residuosity(q, x)
        return true
    else
        return false
    end
end

# get prime p
print "Enter first prime number: "
p = gets.to_i

# get prime q
print "Enter second prime number: "
q = gets.to_i

puts

N = p * q

print "N æ " + N.to_s + " æ " + p.to_s + " ⋅ " + q.to_s + " æ " + "p ⋅ q"

puts
puts

# get quadradic residue candidate
print "Enter a quadratic residue candidate modulo " + N.to_s + ": "
x = gets.to_i

puts

if decide_known_factorization_composite_modulus_quadratic_residuosity(p, q, x)
    puts x.to_s + " is a quadratic residue modulo " + N.to_s + "."
else
    puts x.to_s + " is a quadratic nonresidue modulo " + N.to_s + "."
end
