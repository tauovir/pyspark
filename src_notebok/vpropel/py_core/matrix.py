import numpy as np
class Matrix:

    def __init__(self):
        self.mat = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]

    def flatten(self):
        # output: [1, 2, 3, 4, 5, 6, 7, 8, 9]
        resp = [ele for row in self.mat for ele in row]
        return resp

    def row_addtion(self):
        # list comprehension
        # output:[6, 15, 24]
        resp = [sum(row) for row in self.mat]
        return resp

    def col_addtion(self):
        # output: [12, 15, 18]
        new_mat = []
        col_length =  len(self.mat[0])
        row_length = len(self.mat)
        for row_ind in range(row_length):
            temp = []
            for col_ind in range(col_length):
                temp.append(self.mat[col_ind][row_ind])
            new_mat.append(temp)
        resp = [sum(row) for row in new_mat]
        return resp


    def row_reverse(self):
        # Result: [[3, 2, 1], [6, 5, 4], [9, 8, 7]]
        resp = [row[::-1] for row in self.mat]
        return resp

if __name__ == "__main__":
    obj = Matrix()
    print(obj.col_addtion())