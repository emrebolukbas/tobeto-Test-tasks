#1-Kullanıcının girdiği boy ve ağırlık değerlerine göre vücut kitle indeksini (VKİ = ağırlık/(boy*boy)) hesaplayınız.
boy = float(input("Lütfen boyunuzu metre cinsinden giriniz: "))
kilo = float(input("Lütfen kilonuzu giriniz: "))
vki = kilo/(boy*boy)
print("Vücut kitle indeksiniz :", vki)