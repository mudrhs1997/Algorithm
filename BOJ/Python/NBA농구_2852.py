import sys

n = int(sys.stdin.readline())
teamOne = 0
teamTwo = 0
score = 0
lastTime = 0

for i in range(n+1):
    if i == n:
        currentTime = 48 * 60

        if score > 0:
            teamOne += currentTime - lastTime
        elif score < 0:
            teamTwo += currentTime - lastTime

        break

    team, time = sys.stdin.readline().split()
    minute, second = time.split(":")
    currentTime = int(minute) * 60 + int(second)

    if score > 0:
        teamOne += currentTime - lastTime
    elif score < 0:
        teamTwo += currentTime - lastTime

    lastTime = currentTime

    if team == "1":
        score += 1
    elif team == "2":
        score -= 1

print("{0:02d}:{1:02d}".format(teamOne//60, teamOne%60))
print("{0:02d}:{1:02d}".format(teamTwo//60, teamTwo%60))

