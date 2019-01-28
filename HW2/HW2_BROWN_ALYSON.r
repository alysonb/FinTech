
####################
### HW2
### Alyson Brown
### 1/25/19
####################

rm(list = ls())

##### Part 0 #######
#install.packages("openssl")
library("openssl")

##### Part 1 #######
# Create Public & Private Keys

p=bignum("112481050639317229656723018120659623829736571015511322021617837187076258724819")
q=bignum("89185111938335771293328323333111422985697062149139368049232365065924632677343")

n = p*q
y = (p-1)*(q-1)
e=bignum("65537")

d=bignum_mod_inv(e,y)
print(d)

##### Part 2 #######
# Encrypt a message

m= bignum(charToRaw("Running late. Wait for me."))
#print(m)
c=bignum_mod_exp(m,e,n)
#print(c)
x = base64_encode(c)
print(x)

##### Part 3 #######
# Decrypt a message

x = 'rGhkBLUmPQStyYGrhIcNxnhZw6GeGoFGswZuUihd+kPx21VtPSMmdBRQOkKw8uLPhsh0NV4qk27G/EFuVT2iAw=='

c = bignum(base64_decode(x))
m=bignum_mod_exp(c,d,n)
m = rawToChar(m)
print(m)


##### Part 4 #######
# Sign a message

m_hash = sha256(m)
m_hash= bignum(charToRaw(m_hash))
print(m_hash)

#signature
S = bignum_mod_exp(m_hash,d,n)
print(S)

##### Part 5 #######
# Verify Signature

m_hash = bignum_mod_exp(S,e,n)
print(m_hash)


