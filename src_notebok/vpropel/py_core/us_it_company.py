
"""
Problem-1
Given Input:
data_dict = [
{ "x": "y"},
{ "1": "2"},
{ "t": "y"}
]

Generate Output:
 {"x": "y", "1": "2", "t": "y"}
"""

## Method-1
def method1():
    output = {}
    for item in data_dict:
        output.update(item)
    return output

method1()

def method2():
    output = {}
    for item in data_dict:
        for key,val in item.items():
            output[key] = val
    return output
               
method2()   

"""
Problem-2
x = [ 'a', 'b', 'c' ] 
y = [ 'a', 'b' ]
# how to get x - y operation
"""
def get_subtraction():
    x = [ 'a', 'b', 'c' ] 
    y = [ 'a', 'b' ]
    res = [ele for ele in x if ele not in y]
    # res =set(x) - set(y)

    return res
