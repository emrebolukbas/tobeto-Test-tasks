#5-Kullanıcıdan alınan bir sayının palindrom olup olmadığını bulan bir program yazınız.
isim = str(input("Palidrom Bir Kelime Giriniz :"))
tersi=isim[::-1]

if isim==tersi:
    print("Girdiğiniz İsim :",isim,"\nTersten hali :",tersi,"\n Bu isim bir palidromdur...")
else:
    print("Girdiğiniz İsim :",isim,"\nTersten hali :",tersi,"\n Bu isim bir palidrom değildir...")
