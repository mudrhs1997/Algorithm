def solution(n, k, cmd):
    undo = []
    table = { i:[i - 1, i + 1] for i in range(n) }
    table[0] = [-1, 1]
    table[n - 1] = [n - 2, -1]
    state = ['O' for _ in range(n)]
    current = k
    for c in cmd:
        command = list(c.split())
        if len(command) == 2:
            if command[0] == 'U':
                for _ in range(int(command[1])):
                    current = table[current][0]
            if command[0] == 'D':
                for _ in range(int(command[1])):
                    current = table[current][1]
        else:
            if command[0] == 'C':
                state[current] = 'X'
                pre, post = table[current]
                undo.append([pre, current, post])
                if post == -1:
                    current = pre
                else:
                    current = post
                if pre == -1:
                    table[post][0] = -1
                elif post == -1:
                    table[pre][1] = -1
                else:
                    table[post][0] = pre
                    table[pre][1] = post
            if command[0] == 'Z':
                pre, cur, post = undo.pop()
                state[cur] = 'O'
                if pre == -1:
                    table[post][0] = cur
                elif post == -1:
                    table[pre][1] = cur
                else:
                    table[pre][1] = cur
                    table[post][0] = cur
            
    return ''.join(state)