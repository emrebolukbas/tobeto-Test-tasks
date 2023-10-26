#2-Maaşı ve zam oranı girilen işçinin zamlı maaşını hesaplayarak ekranda gösteriniz.
maas=int(input("Maaşınızı giriniz :"))
zamOrani=int(input("Zam oranınızı giriniz % :"))
zamliMaas=((zamOrani*maas)/100)+maas

print("Maaşınız :",maas,"\nZam Oranı %",zamOrani,"\nZamlı Maaşınız :",zamliMaas)
