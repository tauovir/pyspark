
### Sort list without sorting function
def sor_list(lines : list) -> list:

    for i in range(len(lines)):
        for j in (range(i+1, len(lines))):
            if lines[i] < lines[j]:
                lines[i],lines[j] = lines[j],lines[i]
    print(lines)
