



def main():
    # collatz_jun(100);
    frequency_of_num(900 , 0)

# answer Number 4
def collatz_jun(number):
    print(number  , end =" , ")
    if number ==1:
        print()
        return;
    if number%2==0:
        number = number// 2
    else:
        number= (number *3)+1
    collatz_jun(number)


# Qn 5
def findDigits(val ):
    count =0
    while val //10 >0:
        val = val //10
        count += 1
    if val < 10  or val > 0:
        count +=1
    print(count  , " Digits ")

# Qn 6
def frequency_of_num(value , num):
    nums =[0,0 , 0 , 0 ,0 , 0 , 0 , 0 ,0 ,0]
    if num <0:
        print("Invalid number " , num )
    while value >0:
        rem = value %10
        val = value//10
        nums[rem]+=1
        value = val
    print( num , " Occurs :",nums[num] , " Times ")


if __name__ == '__main__':
    main()