krediler = ["Hızlı Kredi","Maaşını Halkbank'tan alanlara özel"
 ,"Mutlu emekli ihtiyaç kredisi"]

#alias
for kredi in krediler:
    print("<option>" +kredi+"<option>")

for i in range (len(krediler)):
    print(krediler[i])

for i in range(3,10):
    # 3 ile 10 arasındaki sayıları döndürür 3 dahil 10 dahil degil 
    print(i)

for i in range (0,11,2):
    # 0 dan başlayarak 2 adet atla
    print(i) 