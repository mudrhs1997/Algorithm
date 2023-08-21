def solution(n, times):
    new_times = {}
    
    for time in times:
        if time in new_times.keys():
            new_times[time] += 1
            continue
        new_times[time] = 1
    
    left = n // len(times) * min(times)
    right = (n // len(times) + n % len(times)) * max(times)
    mid = (left + right) // 2

    while left < right:
        current_sum = 0
        remain = 1_000_000_000
        for time, num in new_times.items():
            current_sum += (mid // time) * num
            remain = min(mid%time, remain)
        if current_sum == n:
            return mid - remain
        if current_sum > n:
            right = mid
        if current_sum < n:
            left = mid + 1
            
        mid = (right + left) // 2
    
    
    return mid