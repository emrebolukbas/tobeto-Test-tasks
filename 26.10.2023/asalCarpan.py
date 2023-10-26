def isPrime1 (sayi):
    isPrime = True
    if sayi <= 1 :
        isPrime = False
    for i in range (2, sayi):
        if sayi % i ==0:
         isPrime = False

    return isPrime

sayi = int(input("Lütfen Bir Sayı Giriniz."))
asalCarpan = []

for i in range (1,sayi + 1):
    if sayi % i ==0 :
        if isPrime1(i) == True:
            asalCarpan.append(i)
print(asalCarpan)