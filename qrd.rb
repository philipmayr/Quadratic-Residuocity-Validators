# Prime Modulus Quadratic Residuosity Decider Algorithm

def decide_prime_modulus_quadratic_residuosity(p, x)
    b = (x ** ((p - 1) / 2)) % p
    
    if b == 1
        return true 
    else 
        return false
    end
end

# get prime p
print "Enter a prime number: "
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

# Known Factorization Composite Modulus Quadratic Residuosity Decider Algorithm

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

# quadradic residue candidate
print "Enter a quadratic residue candidate modulo " + N.to_s + ": "
x = gets.to_i

puts

if decide_known_factorization_composite_modulus_quadratic_residuosity(p, q, x)
    puts x.to_s + " is a quadratic residue modulo " + N.to_s + "."
else
    puts x.to_s + " is a quadratic nonresidue modulo " + N.to_s + "."
end
