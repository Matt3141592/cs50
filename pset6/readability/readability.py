from cs50 import get_string


def main():
    # takes in text from the user
    text = get_string("Enter text: ")
    words = 1
    sentences = 0
    letters = 0
    
    # counts the letters, words and sentences
    for a in text:
        if a == " ":
            words += 1
        if a == "." or a == "!" or a == "?":
            sentences += 1
        if (ord(a.lower()) >= 97) and (ord(a.lower()) <= 122):
            letters += 1
    
    # calcs the sentences and letters per 100
    sentences = (sentences / words) * 100
    letters = (letters / words) * 100
    index = round((0.0588 * letters) - (0.296 * sentences) - 15.8)
    
    # prints grade in correct format
    if index < 1:
        print("Before Grade 1")
    elif index > 16:
        print("Grade 16+")
    else:
        print(f"Grade {index}")
    
    
main()