# aaabccdaaaa  => 3a1b2c1d4a
# bbcdda =>2b1c2d1a

string_name = 'aaabccdaaaa'
string_name2 = 'bbcdda'

def make_str_group(string_name):
    grp = ''
    cnt = 1
    for ind in range(len(string_name)):
      if (ind < len(string_name) -1) and (string_name[ind] == string_name[ind+1]) :
        cnt = cnt +1
      else:
        grp += str(cnt) + string_name[ind]
        cnt = 1
    return grp

print(make_str_group(string_name))
print(make_str_group(string_name2))