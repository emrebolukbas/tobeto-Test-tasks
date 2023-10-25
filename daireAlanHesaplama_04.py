#4-Dairenin alanını ve çevresini hesaplayan python kodunu yazınız.(Dairenin yarıçapını kullanıcıdan alınız)
import math
r = int(input("Lütfen daire için yarıçap değerini giriniz: "))
alani = int(math.pi * (r ** 2))
cevre = int(2 * (math.pi * r))
print("Daire alanı: ", alani, "\nDaire çevre: ", cevre)
                