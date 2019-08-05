running_sum=0

for test_num in range(1, 100):
    if ((test_num%3)==0) or ((test_num%5)==0):
        running_sum=running_sum+test_num

print(running_sum)
