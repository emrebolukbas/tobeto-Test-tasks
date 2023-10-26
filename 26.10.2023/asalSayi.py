sayi1 = int(input("Sayı Giriniz: "))
isPrime = True
if sayi1 <= 1 :
    isPrime = False
for i in range (2, sayi1):
    if sayi1 % i ==0:
        isPrime = False

if isPrime == True: 
    print(sayi1, "Asal Sayıdır.")
else:
    print(sayi1, "Asal Sayı Değildir.")
