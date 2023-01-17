import sys

n, m, k = map(int, sys.stdin.readline().split())
data = [0]
tree = [0 for _ in range(4000000)]


# Segment Tree
def segTree(start, end, node):
    if start == end:
        tree[node] = data[start]
        return tree[node]
    mid = int((start + end) / 2)
    tree[node] = segTree(start, mid, node * 2) + segTree(mid + 1, end, node * 2 + 1)
    return tree[node]


def treeSum(start, end, node, left, right):
    if left > end or right < start:
        return 0
    if left <= start and end <= right:
        return tree[node]
    mid = int((start + end) / 2)
    return treeSum(start, mid, node * 2, left, right) + treeSum(mid + 1, end, node * 2 + 1, left, right)


def treeUpdate(start, end, node, index, dif):
    if start <= index <= end:
        tree[node] += dif
        if start == end:
            return
        mid = int((start + end) / 2)
        treeUpdate(start, mid, node * 2, index, dif)
        treeUpdate(mid + 1, end, node * 2 + 1, index, dif)
    else:
        return


for i in range(n):
    data.append(int(sys.stdin.readline()))
segTree(1, n, 1)
for _ in range(m + k):
    a, b, c = map(int, sys.stdin.readline().split())
    if a == 1:
        treeUpdate(1, n, 1, b, c - data[b])
        data[b] = c
        continue
    else:
        print(treeSum(1, n, 1, b, c))
