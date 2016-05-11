sha256 = require 'sha256'

# take a list [a, b, c, d, ...] and return [sha(a+b), sha(c+d), ..]
# if an odd number of elements, append last element to the end
pairup = (hashes) ->
  ret = []
  while hashes.length > 1
    ret = ret.concat sha256(hashes[0] + hashes[1])
    hashes = hashes[2..]

  return ret.concat hashes # hashes is either empty (even count) or single element (odd count)

# take a list of hashes, taken as leaf nodes, and return merkle tree root hash
hash_tree = (hashes) ->
  if hashes.length == 1
    return hashes[0]
  else
    return hash_tree pairup hashes

# take a list of data elements, hash them, create a merkle tree and return the root hash
main = (data) ->
  if data.length == 0
    throw new Error 'No data supplied'

  hashes = data.map (s) -> sha256 s # hash the data in leaf nodes
  return hash_tree hashes

module.exports = main
