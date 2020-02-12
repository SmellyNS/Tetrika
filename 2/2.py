# the hits.txt file is too large to upload its data to an array

# thats why I decided to use dictionary {ip: count}

ipqty = dict()

with open("hits.txt","r") as f:
    for line in f:              # iterating file by lines (line = 'host\tip\tpage')
        a = line.split('\t') # host and page are not needed to goal the task
                             # so only second element in a row (ip) have to be used
        if a[1] in ipqty.keys(): # if actual ip is already a key from dictionary that means we iterating it one more time
            ipqty[a[1]] += 1 # so we add 1 every time we met it
        else:   # otherwise we dont have this key in dict,
            ipqty[a[1]] = 1 # so we appending it with 1 value


# sorting by values with lambda-comparator
sorted_items = sorted(ipqty.items(), key=lambda a: a[1])

# printing last five elements, which are the answer
for i in range(1,6):
    print("%d) IP: %s \t Qty: %d"%(i,sorted_items[-i][0],sorted_items[-i][1]))
