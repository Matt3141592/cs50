import sys
import csv


def main():
    if len(sys.argv) != 3:
        sys.exit("Incorrect usage, need 2 arguemnts.")
    
    people = []
    # stores lists in people
    with open(sys.argv[1]) as file:
        reader = csv.reader(file)
        for row in reader:
            people.append(row)
    
    # creates a string called unknown which contains dna of person
    with open(sys.argv[2]) as file:
        unknown = file.read()
    
    data = []
    x = len(people[0])
    for i in range(x - 1):
        data.append(0)
    
    # searches one str at a time
    for i in range(1, x):
        y = len(people[0][i])
        # search for longest str in unknown
        for j in range(len(unknown)):
            chain = 1
            if unknown[j: y + j] == people[0][i]:
                while True:
                    if unknown[j + y: 2 * y + j] == people[0][i]:
                        chain += 1
                        j += y
                    else:
                        j += y
                        if chain > data[i - 1]:
                            data[i - 1] = chain
                        break
    
    # checks if the person is in memory
    # if they are, then it prints the name and ends the program
    for i in range(1, len(people)):
        count = 0
        for j in range(x - 1):
            if data[j] == int(people[i][j + 1]):
                count += 1
            else:
                break

        if count == (x - 1):
            sys.exit(people[i][0])
    # base case where it doesn't match anyone
    print("No match")
    
    
main()