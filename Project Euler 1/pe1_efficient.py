#The basis of this algorithm will be multiples of 3
#+ multiples of 5 that aren't multiples of 15

three_mult_total = 0
five_mult_total = 0
test_num=0

divide_by_3_counter=0

while (test_num<100):
    three_mult_total += test_num
    test_num += 3

test_num = 0

while (test_num < 95):
    divide_by_3_counter += 1
    test_num += 5   
    five_mult_total += test_num
    if (divide_by_3_counter >= 2): 
        test_num +=5
        divide_by_3_counter=0
    
        
    
print(three_mult_total+five_mult_total)

