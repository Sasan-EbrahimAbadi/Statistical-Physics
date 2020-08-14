clear
a=load('data_error.txt');
b=a(:,2);
L=length(b);
T=1;                              
s=[];
for n=1:4        %for computing (D1,D2,D3,D4)               
    Mn=zeros(1,L);
    for h=1:L
        x=b(h);
        j=0;
        for i=1:L-T        
            if b(i)==x; %tarife moment sharti(agar x(i) barabar ba meghdar morede nazar bood moment ra hesab kon)
                j=j+1;
                s(j)=((b(i+T)-x)^n);
                Mn(h)=Mn(h)+s(j);
            end
            if j~=0 %baraye inke agar x(i)~=x (adade entekhab shode barabar ba x morede nazar nabood) moment ra hesab nakonad
                Mn(h)=Mn(h)/j;
   
            end
        end
    end
    D{n}=Mn/(factorial(n)*T);
   
end
a1=polyfit(b',D{1},1);% moadele daraje yek fit mikonad
a2=polyfit(b',D{2},2);% moadele daraje do fit mikonad
a3=polyfit(b',D{3},3);% moadele daraje se fit mikonad
a4=polyfit(b',D{4},4);% moadele daraje chahar fit mikonad
X3=(1/L)*(((4*a1(2)+12*a2(2)+24*a3(2)+24*a4(2))/(-4*a1(1)-12*a2(1)-24*a3(1)-24*a4(1)))*std(b));%jaigozari dar moadelei ke ba hale tahlili bedast amade
X2=(12*a2(3)+24*a3(3)+24*a4(3))/(-4*a1(1)-12*a2(1)-24*a3(1)-24*a4(1));
fprintf('<x^4>=(%X)<x^3>+(%X2)<x^2>^2',X3,X2)
