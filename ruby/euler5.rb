# Least Common Multiple
#
# Keep a running list of prime factors (including duplicates).
# At each step, add the prime factors of the current number such that the
# running list is a superset of the current number prime factors.
# 
# For further optimization, could go from highest to lower number, and skip any
# numbers that are a multiple of a prime factor of one of the higher numbers.
# So, after doing 16, skip 8, 4, and 2.
#
# Reuse code from the prime factorization problem.

require_relative 'primefactorize'

def leastcommonmultiple(iterable)
  factors = Hash.new(0)
  iterable.each do |i|
    curr = primefactorize(i)
    curr.each_key { |k| factors[k] = [factors[k], curr[k]].max }
  end
  lcm = 1
  factors.each_pair { |k,v| lcm*=k**v }
  #p factors
  return lcm
end

maxnumber = 20  # Should be 232792560
p leastcommonmultiple(2..maxnumber)

# Or just use the built-in lcm method. It's a bit cheating because no thought
# is required, but it works!
#
# My routine is actually faster than this for larger numbers, probably because
# it keeps the running list of primes instead of just keeping the running
# value of the least common multiple.
# For maxnumber=100000, mine ran in 1 second vs 6 seconds for built-in function
# on a macbook pro.
require 'rational'
x =* 2..maxnumber
p x.reduce(:lcm)

