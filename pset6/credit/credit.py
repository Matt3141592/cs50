from math import log
from cs50 import get_int


def main():
    # takes card numebr as int so that it only accepts integers
    number = str(get_int("Number: "))
    checksum = 0
    length = len(number)
    
    # find start of the card
    start = int(number[0] + number[1])
    
    # does the checksum (alternating digits mulitplied by 2)
    for a in number[length % 2::2]:
        x = str(int(a) * 2)
        for b in x:
            checksum += int(b)
    
    # adds the rest of the numbers that weren't added before
    for a in number[1 - length % 2::2]:
        checksum += int(a)
    # print(checksum)
    
    # decides which card type it is
    if checksum % 10 != 0:
        print("INVALID")
    elif (start == 34 or start == 37) and length == 15:
        print("AMEX")
    elif start > 50 and start < 56 and length == 16:
        print("MASTERCARD")
    elif start >= 40 and start <= 49 and (length == 13 or length == 16):
        print("VISA")
    else:
        print("INVALID")
   
    
main()