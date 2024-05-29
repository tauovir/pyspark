/ Write a program that will count the frequency of the words in the String.
 
// Example: I think coding is fun.. fun Fun fun!
// Output
// I - 1
// think - 1
// coding - 1
// is - 1
// fun - 3
// Fun - 1

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
