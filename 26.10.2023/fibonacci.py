#Fibonacci sayıları: 

sayi = int(input("sayı adedini giriniz: "))
fibonacci = [1,1]

if sayi > 19:
    for i in range (2,sayi):
   
        sonEleman = fibonacci [i-1]  + fibonacci [i-2]
        fibonacci.append(sonEleman)
    print(fibonacci)

else: 
    print("20 elemandan az girilemez.")