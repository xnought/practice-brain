import numpy as np

p = np.eye(26, dtype=np.int32)
for i in range(26):
    for j in range(26):
        print(p[i, j], end=" ")
    print()
