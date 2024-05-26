
"""
In this challenge, the user enters a string and a substring. You have to print the number of times that the substring 
occurs in the given string. String traversal will take place from left to right, not from right to left.

string = 'ABCDCDC'
sub_string = 'CDC'
Output: 2
"""



def count_substring(string, sub_string):
    sub_str_len = len(sub_string)
    str_len = len(string)
    cnt = 0
    for ind in range(str_len + 1):
        if string[ind:ind + sub_str_len] == sub_string:
            cnt += 1

    return cnt