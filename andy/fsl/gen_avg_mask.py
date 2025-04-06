import numpy as np

NUM_SUB = 26
NUM_RUNS = NUM_SUB * 2
p = np.zeros((NUM_RUNS, NUM_SUB), dtype=np.int32)

# Desired matrix has 1s down the column but offset by 2
# 1
# 1
# 0 1
# 0 1
# .
# .
# .
# shaped
# r52 ... -> c26

# set
j = 0
for i in range(0, NUM_RUNS, 2):
    p[i, j] = 1
    p[i + 1, j] = 1
    j += 1

# print
for i in range(NUM_RUNS):
    for j in range(NUM_SUB):
        print(p[i, j], end=" ")
    print()
