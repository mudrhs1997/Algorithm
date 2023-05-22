def solution(plans):
    answer = []
    remainReport = []
    currentReport = []
    
    sortedPlans = []
    
    for plan in plans:
        sortedPlans.append([plan[0], hourToMinute(plan[1]), int(plan[2])])
        
    sortedPlans = sorted(sortedPlans, key=lambda x : x[1])
    
    for plan in sortedPlans:
        if currentReport == []:
            currentReport = plan
            continue
        if currentReport[1]+currentReport[2] <= plan[1]:
            remainTime = plan[1] - currentReport[1] - currentReport[2]
            answer.append(currentReport[0])
            currentReport = plan
            while remainTime > 0 and remainReport:
                
                subject, start, remain = remainReport.pop()
                if remain <= remainTime:
                    answer.append(subject)
                    remainTime -= remain
                else:
                    remainReport.append([subject, start, remain-remainTime])
                    remainTime = 0
        else:
            remainReport.append([currentReport[0], currentReport[1], currentReport[2]-(plan[1]-currentReport[1])])
            currentReport = plan
        if sortedPlans[-1] == plan:
            answer.append(plan[0])
       
    if remainReport != []:
        for report in reversed(remainReport):
            answer.append(report[0])
        
    return answer

def hourToMinute(time):
    hour, minute = time.split(':')
    return int(hour)*60+int(minute)
    