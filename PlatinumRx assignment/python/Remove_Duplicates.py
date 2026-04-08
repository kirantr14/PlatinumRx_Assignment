# Remove duplicate characters from a string using loop

def remove_duplicates(s):
    result = ""

    for char in s:
        if char not in result:
            result += char

    return result

input_string = "programming"
print(remove_duplicates(input_string))  