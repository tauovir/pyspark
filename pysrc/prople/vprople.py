


def gen(l1):
    for row in l1:
        yield row


l1 = [1,2,3]

x = gen(l1)
for i in x:
    print(i)


