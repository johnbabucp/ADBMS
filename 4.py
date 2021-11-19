strl=input("enter a string:")
wordlist=strl.split()
count=[]
for w in wordlist:count.append(wordlist.count(w))
print("count of the occurrence:" + str(list(zip(wordlist,count))))
