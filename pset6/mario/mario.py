from cs50 import get_int


def main():
    # asks user for the height
    # continues to ask until they enter a valid height
    while True:
        height = int(get_int("Height: "))
        if height >= 1 and height <= 8:
            break
    # printing both sides of the pyramid
    for i in range(1, height + 1):
        print(" " * (height - i), end="")
        print("#" * i, end="")
        print("  ", end="")
        print("#" * i)
         
         
main()