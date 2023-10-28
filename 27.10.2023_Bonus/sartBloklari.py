dolarDun = 28.16
dolarBugun = 28.14
kur = (dolarDun - dolarBugun) / dolarDun * 100
#print(kur)
#print(f"{dolarDun} kurunda: {round(kur, 2)} % artış vardır.") 
# #round(x,y) y' si yuvarlamanın (küsüratdaki) ilk iki ifadesini göster anlamına gelir.
roundYuvarlama = 0.1461321 
print(round(roundYuvarlama,2)) # örnek

if dolarBugun>dolarDun:
    print(f"{dolarDun} Dün {dolarBugun} Bugün dolar kuru arasında: {round(kur, 2)} % artış vardır.")
elif dolarBugun<dolarDun:
    print( f"{dolarDun} Dün {dolarBugun} Bugün dolar kuru arasında: {round(kur, 2)} % azalma vardır.")
else:
    print("Kur değişimi yoktur.")
    
