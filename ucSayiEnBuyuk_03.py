#3-Kullanıcının girdiği üç sayı arasında en büyük olanı bulan ve sonucu yazdıran bir program yazınız.
sayi1 = int(input("Lutfen ilk sayıyı giriniz: "))
sayi2 = int(input("Lutfen ikinci sayıyı giriniz: "))
sayi3 = int(input("Lutfen üçüncü sayıyı giriniz: "))

if sayi1>sayi2 and sayi1>sayi3:
    print("En büyük sayı :", sayi1)
elif sayi2>sayi3:
    print("En büyük sayı :",sayi2)
else:
    print("En büyük sayı :",sayi3)
