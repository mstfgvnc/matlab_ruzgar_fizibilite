dvam=menu('��lem Se�iniz','Ortalamas� girilen rastgele 8760 adet r�zgar h�z� �ret','Tek tek r�zgar h�z� verilerini gir');
if dvam==1
    t=input('�retilecek verilerin ortlamas�n� giriniz= ');
x=round(0+(2*t)*rand(1,8760))
a=mean(x)
i=0;
while i<8760
    i=i+1;
    v(i)=x(1,i);
end
elseif dvam==2
    t=0;
   while t<8760
       t=t+1;
    v(t)=input(t,'. R�zgar h�z�n� giriniz= ');
   end
end
ser=menu('L�tfen i�lem se�iniz','STANDART DE�ERLERLE ��LEM(Q=1.225 1 ATM 25 C)','KO�ULLARIN KULLANICI TARAFINDAN BEL�RLENMES�');
if ser==2
h1=input('�l��m y�ksekli�ini metre cinsinden giriniz(h1)=  ');
h2=input('�telenecek y�ksekli�i metre cinsinden giriniz(h2)=  ');
H=input('Rak�m� giriniz= ');
T=input('S�cakl��� giriniz (Derece cinsinden) = ');
Q=((exp(-1.18575*0.0001*(H+h2)))*28.97*0.001)/(8.2056*0.00001*(273+T));
j=0;
dvm=menu('S�rt�nme Katsay�s�n� Se�iniz','P�r�zs�z sert toprak,durgun su ( 0.10 )','Toprak seviyesinde uzun �imenli b�lge( 0.15 )','Toprak seviyesinin �zerinde daha uzun mahsul ( 0.20 )','K�rsal orman alanlar�,bir �ok a�a� ( 0.25 )','A�a�l�k ufak kasabalar ( 0.30 )','Uzun binalarla dolu b�y�k �ehirler ( 0.40 )');
if dvm==1
    s=0.1
elseif dvm==2
    s=0.15
elseif dvm==3
    s=0.2
elseif dvm==4
    s=0.25
    elseif dvm==5
    s=0.3
    elseif dvm==6
    s=0.4
end
while j<8760
    j=j+1;
    u(j)=v(j)*((h2/h1)^s);
end
elseif ser==1
    j=0;
    while j<8760
    j=j+1;
    u(j)=v(j);
end
    Q=1.225;
end
z=0;
while z<8760
    z=z+1;
    ruzgar(1,z)=u(z);
end
ortalama=mean(ruzgar);
    t=0;
r=0;
while t<8760
    n=8760;
    t=t+1;
    b(t)=((u(t)-ortalama)^2)/(n-1);
    r=r+b(t);
end 
k=(sqrt(r)/ortalama)^-1.086
c=ortalama/gamma((k+1)/k)
xk=0;
while xk<1
pn=menu('L�tfen r�zgar t�rbini se�iniz.','100KW','500KW','1MW','2MW','3MW','PROGRAMI B�T�R');
if pn==1
    p=100;
    vin=3;
    vr=10;
    vout=25;
elseif pn==2
       p=500;
    vin=4;
    vr=12;
    vout=26;
elseif pn==3
 p=1000;
    vin=3.5;
    vr=14;
    vout=25;
elseif pn==4
       p=2000;
    vin=4;
    vr=13;
    vout=27;
elseif pn==5
     p=3000;
    vin=3;
    vr=15;
    vout=25;
elseif pn==6
    xk=2;
end
if pn<6
kf=((vin/vr)^3)*exp(-((vin/c)^k))+(((3*gamma(3/k))/(k*((vr/c)^3)))*(gammainc(((vr/c)^k),0.75)-gammainc(((vin/c)^k),0.75)))-exp(-((vout/c)^k))
adt=input('R�zgar �iftli�i i�in gereken t�rbin adedini giriniz= ');
yillikenerji=adt*8760*p*kf
ag=0;
while ag<1
kw=menu('L�tfen Senaryo Se�iniz.','T�M ENERJ�N�N �RET�C� TARAFINDAN KULLANILMASI','YARISINI �EBEKEYE SATIP YARISINI KULLANMAK','ENERJ�N�N T�M�N�N �EBEKEYE SATILMASI','T�RB�N SE��M�NE GER� D�N','PROGRAMI B�T�R');
if kw==1
yillikgelir=yillikenerji*0.223
elseif kw==2
    yillikgelir=(yillikenerji*0.153+yillikenerji*0.223)/2
elseif kw==3
    yillikgelir=yillikenerji*0.153
elseif kw==4
    ag=2;
elseif kw==5
    ag=2;
    xk=2;
end
if kw<4
toplammaliyet=p*2000*adt
ccc=menu('�deme �eklini se�iniz ','%50 pe�in kalan kredi ile ','%25 pe�in gerisi kredi ile','%10 pe�in gerisi kredi ile','Tamam� kredi ile');
if ccc==1
    milk=toplammaliyet/2
elseif ccc==2
    milk=toplammaliyet/4
elseif ccc==3
    milk=toplammaliyet/10
elseif ccc==4
    milk=0
end
mt=toplammaliyet-milk;
n=20;
zzz=menu('Faiz oran�n� giriniz','%4 faizle ','%5 faizle ','%6 faizle ','%7 faizle ','%8 faizle ','%9 faizle ');
if zzz==1
    i=4
   elseif zzz==2
    i=5
   elseif zzz==3
    i=6
  elseif zzz==4
    i=7
  elseif zzz==5
    i=8
  elseif zzz==6
    i=9
   end
maliyetsimdikideger=milk+(mt*(((i/100)*(((i/100)+1)^n))/((((i/100)+1)^n)-1))*n)
bakimonarimmaliyeti=0.002*yillikenerji
yilliktoplammaliyet=(maliyetsimdikideger/n)+bakimonarimmaliyeti
birimmaliyet=yilliktoplammaliyet/yillikenerji
yilliknetgelir=yillikgelir-yilliktoplammaliyet
geriodemesuresi=maliyetsimdikideger/yillikgelir
end
end
end
end