"""
/ Write a program that will count the frequency of the words in the String.
 
// Example: I think coding is fun.. fun Fun fun!
// Output
// I - 1
// think - 1
// coding - 1
// is - 1
// fun - 3
// Fun - 1

"""

def remove_special_char(word):
  special_char = ['.','!']
  clean_word = ''
  for ch in word:
    if ch in special_char:
      continue
    clean_word +=ch
  return clean_word

def count_string_word(text):

  word_count = {}
  
  for word in text.split():
    word = remove_special_char(word)
    if word in word_count:
      word_count[word] +=1
    else:
      word_count[word] = 1
  return word_count


text = 'I think coding is fun.. fun Fun fun!'
for key,val in count_string_word(text).items():
  print(f'{key} - {val}')



"""
1: remove postfix from word if contain 'ing','ly','ed'
2. If the resulting word is longer than 8 letters, keep the first 8 letters.

Implement a function that takes a string of space-separated words and returns its stemmed
counterpart.

Example
text = 'an extremely dangerous dog is barking'
'an' does not end in one of the suffixes and is less than 8 letters.
'extremely' is 'extreme' after removing the suffix. 'extreme' is less than 8 letters.
'dangerous' is 9 letters long, so reduce it to 8 letters: 'dangerou'.
'dog' and 'is' are unchanged.
'barking' is 'bark' after removing the suffix, and is less than 8 letters.

Return 'an extreme dangerou dog is bark'.
        an extreme dangerous dog is bark
        an extreme dangerou dog is bark

Function Description
Complete the function stemmer in the editor below.
stemmer has the following parameter(s):
string text: the input text
Returns
string: the input text with each of the words replaced by its stem
"""

def get_refined_word(word : str) -> str:

    word = word[:8] if len(word) > 8 else word
    return word

def stemmed_word(string : str) -> str:

    resp = ''
    for word in string.split():
        if 'ing' == word[-3:]:
            word = word[:len(word) -3]
        elif 'ly' == word[-2:]:
            word = word[:len(word) - 2]
        elif 'ed' == word[-2:]:
            word = word[:len(word) - 2]

        word = get_refined_word(word)

        resp +=' ' + word

    return resp.strip()

text = 'an extremely dangerous dog is barking'
resp = stemmed_word(string = text)
print("text = ",text)
print("resp = ",resp)

