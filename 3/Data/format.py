#2 start
#3 end
#1 left


def rewrite(name):
    
    with open(name+'.txt','r') as f:
        a = [line.strip(' ').replace(' |','|').replace('| ','|') for line in f][2:-3]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]

    with open(name+'2.txt','w') as f:
        f.write("".join(a))


names = ['lessons','participants','quality','users']

for name in names:
    rewrite(name)

with open('users2.txt','r') as f:
    a = list(set([line for line in f]))
with open('users2.txt','w') as f:
    f.write("".join(a))
