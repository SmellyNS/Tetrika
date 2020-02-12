# loading names.txt string object into array by ',' separator
with open('names.txt','r') as f:
    arr = f.read().split(',') 

# first: deleting quotes from array elements ('"AARON"' -> 'AARON') by iterating it with generator
# second: sorting and iterating the array received with generator to get [[name, char_sum],...] object
# third: iterating each name by chars, getting their decimal codes with ord() with generator,
#        (ord("A") = 65 means we have to subtract 64 from received values)
# fourth: summing received arrays with sum()

arr = [[line, sum([ord(i.upper())-64 for i in line]) ] for line in sorted([ name[1:-1] for name in arr])] 

# getting product of received sums
# getting [[name, sum, product], ...] object

arr = [[elem[0],elem[1],(arr.index(elem)+1)*elem[1]] for elem in arr ]


# printing the answer after summing products
print("Answer: ", sum([elem[2] for elem in arr]))
