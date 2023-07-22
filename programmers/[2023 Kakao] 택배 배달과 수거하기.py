# 230722 12:05 ~ 14:46
# 스택
# 정답 확인

# 내 풀이 (시간초과)
# def solution(cap, n, deliveries, pickups):
#     answer = 0
#     start_idx = n
#     while True:
#         delivery_remain = cap
#         pickup_remain = cap
#         delivery_idx = 0
#         pickup_idx = 0

#         for house in range(start_idx-1, -1, -1):

#             if delivery_remain == 0 and pickup_remain == 0:
#                 break
                
#             if deliveries[house] != 0:
#                 delivery_idx = max(delivery_idx, house + 1)
#                 if delivery_remain > 0:
#                     canDelivery = deliveries[house] - delivery_remain
#                     if canDelivery > 0:
#                         deliveries[house] = canDelivery
#                         delivery_remain = 0
#                     elif canDelivery < 0:
#                         delivery_remain -= deliveries[house]
#                         deliveries[house] = 0
#                     else:
#                         delivery_remain = 0
#                         deliveries[house] = 0
            
#             if pickups[house] != 0:
#                 pickup_idx = max(pickup_idx, house + 1)
#                 if pickup_remain > 0:
#                     canPickup = pickups[house] - pickup_remain
#                     if canPickup > 0:
#                         pickups[house] = canPickup
#                         pickup_remain = 0
#                     elif canPickup < 0:
#                         pickup_remain -= pickups[house]
#                         pickups[house] = 0
#                     else:
#                         pickup_remain = 0
#                         pickups[house] = 0

#         start_idx = max(delivery_idx, pickup_idx)
#         answer += max(delivery_idx, pickup_idx) * 2
#         if delivery_remain == cap and pickup_remain == cap:
#             break
            
        
            
#     return answer

def solution(cap, n, deliveries, pickups):
    while deliveries and not deliveries[-1]:
        deliveries.pop()
    while pickups and not pickups[-1]:
        pickups.pop()

    answer = 0
    while deliveries or pickups:
        answer += max(len(deliveries), len(pickups)) * 2

        deliveries_cap = pickups_cap = cap
        while deliveries:
            if deliveries[-1] <= deliveries_cap:
                deliveries_cap -= deliveries.pop()
            else:
                deliveries[-1] -= deliveries_cap
                break
        while pickups:
            if pickups[-1] <= pickups_cap:
                pickups_cap -= pickups.pop()
            else:
                pickups[-1] -= pickups_cap
                break

    return answer