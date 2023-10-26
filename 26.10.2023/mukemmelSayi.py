sayi = int(input("Bir Sayı Giriniz."))



def mükemmelSayi (sayi):
    toplam = 0
    for i in range (1, sayi + 1):
        if sayi % i == 0 :
            toplam += i
            
    
    if toplam == (2 * sayi):
        print(sayi, "Mükemmel Sayıdır.")
    
    else:
        print(sayi, "Girdiğiniz Sayı Mükemmel Sayı Değildir.")

mükemmelSayi(sayi) 