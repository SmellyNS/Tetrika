ipqty = dict()
with open("hits.txt","r") as f:
    for line in f:
        a = line.split('\t')
        if a[1] in ipqty.keys():
            ipqty[a[1]] += 1
        else:
            ipqty[a[1]] = 1

sorted_items = sorted(ipqty.items(), key=lambda a: a[1])
for i in range(1,6):
    print("%d) IP: %s \t Qty: %d"%(i,sorted_items[-i][0],sorted_items[-i][1]))
