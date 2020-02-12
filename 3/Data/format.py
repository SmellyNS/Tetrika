def rewrite(name):      # formating function
    
    with open(name+'.txt','r') as f:        # there are 5 extra lines without any data in each file
        a = [line.strip(' ').replace(' |','|').replace('| ','|') for line in f][2:-3]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]    # hardcode for 
        a = [line.replace(' |','|').replace('| ','|') for line in a]    # removing spaces 
        a = [line.replace(' |','|').replace('| ','|') for line in a]    # from data
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]
        a = [line.replace(' |','|').replace('| ','|') for line in a]

    with open(name+'2.txt','w') as f:
        f.write("".join(a))


names = ['lessons','participants','quality','users']

for name in names:
    rewrite(name)

with open('users2.txt','r') as f:
    a = list(set([line for line in f]))     # deleting duplicates from users
with open('users2.txt','w') as f:
    f.write("".join(a))
