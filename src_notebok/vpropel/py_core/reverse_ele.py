
def combined_ele_reverse():
    """
    Combine the list l1 and l2,  and find the element in reverse order
    Output: ['blue', 'green', 'red', 'banna', 'orange', 'mango']
    """
    l1 = ['mango', 'orange', 'banana']
    l2 = ['red', 'green', 'blue']
    res = l1 + l2
    return res[::-1]


print(combined_ele_reverse())