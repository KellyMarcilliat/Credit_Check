# card_number = "5541808923795240" #valid
# card_number = "4024007136512380" #valid
# card_number = "6011797668867828" #valid
# card_number = "342804633855673" #valid

# card_number = "5541801923795240" #invalid
# card_number = "4024007106512380" #invalid
# card_number = "6011797668868728" #invalid
# card_number = "342801633855673" #invalid

card_number = "4929735477250543"
valid = false

# Luhn Algorithm
eval_number = card_number

if card_number.length < 16
  eval_number = "0" + card_number
end

# change string to cc_array
cc_array = eval_number.split("")

#change to integers
cc_array.map! do |element|
  element.to_i
end

# from back to front pop elements into 2 new arrays
sequence_1 = [] #holds every first digit from back to front
sequence_2 = [] #holds every other digit from back to front
8.times do ||
  sequence_1 << cc_array.pop
  sequence_2 << cc_array.pop
end

# sequence 1: pass through unchanged for later summing

# sequence 2: a)if < 5, double each; b) if >/= 5, double then %/sum
sequence_2a = []
sequence_2b = []
sequence_2.map do |element|
  if element < 5
    sequence_2a << element * 2
  else
    sequence_2b << element * 2 %10 + 1
  end
end

# addition of all cc numbers (from 3 arrays)
eval_sum = sequence_1.sum + sequence_2a.sum + sequence_2b.sum

if eval_sum %10 == 0
  p "The number is valid!"
  valid = true
else
  p "The number is invalid!"
end
