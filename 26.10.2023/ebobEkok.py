def ebob(sayi1, sayi2):
    if sayi1 > sayi2 :
        for i in range (1, sayi2 + 1):
            if sayi1 % i == 0 and sayi2 % i == 0:
                ebob = i 
        ekok = int((sayi1 * sayi2) / ebob)
        print("ebob:", ebob, "\nekok:", ekok)
    else:
        for i in range (1, sayi1 + 1):
            if sayi1 % i == 0 and sayi2 % i == 0:
                ebob = i 
        ekok = int((sayi1 * sayi2) / ebob)
        print("ebob:", ebob, "\nekok:", ekok)

sayi1 = int(input("Birinci Sayıyı Giriniz."))
sayi2 = int(input("İkinci Sayıyı Giriniz."))
ebob(sayi1, sayi2)