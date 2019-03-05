
####################
### HW3
### Alyson Brown
### 1/31/19
####################

rm(list = ls())

## Mining Bitcoin ##
##### Part 2 #######

library("openssl")
x1 = sha256("Cesare sends one bitcoin to Shimon")
x0 = "85738f8f9a7f1b04b5329c590ebcb9e425925c6d0984089c43a022de4f19c281"
timestamp = "2018-01-07 21:05:34"
bits = 3

#paste(x0, x1 ,sep = " ")
blockheader = x1

n=FALSE
nonce = 0
while (nonce <99999){
  x2 = paste(blockheader, x0, timestamp, bits, nonce, sep=" ")
  x3=sha256(x2)
  if(startsWith(x3,"000")){
    break
  }
  nonce = nonce +1
}

print(nonce)
print(x3)



