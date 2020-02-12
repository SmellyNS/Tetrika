arr = []

with open('names.txt','r') as f:
    arr = f.read().split(',')

arr = [ elem[1:-1] for elem in arr]
arr[-1] = arr[-1][:-1]


arr.sort()

arr = [[elem, sum([ord(i.upper())-64 for i in elem]) ] for elem in arr]

arr = [[elem[0],elem[1],(arr.index(elem)+1)*elem[1]] for elem in arr ]

s = 0
for elem in arr:
    s += elem[2]

print(s)
