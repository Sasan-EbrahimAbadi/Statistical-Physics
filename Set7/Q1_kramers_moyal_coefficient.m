
clear
tic
d=load('data_error.txt');
data=d(:,2);
N=length(data);
x=min(data):0.01:max(data);
L=length(x);
t=1; %markov length

for n=1:4                      
    Mn=zeros(1,L);
    for k=1:L
  
        j=0;
        for i=1:N-t        
            if abs(data(i)-x(k))<0.01; %baraye in ast ke ba in shart dar nazar begirim ke agar data ha dar yek mahdode nazdik ham boodand mosavi dar nazar begirad va moment ra hesab konad
                j=j+1;
                a=(((data(i+t)-x(k)))^n);
                Mn(k)=Mn(k)+a;
            end         
        end
        if j~=0
            Mn(k)=Mn(k)/j;
        end
    end

%-------------------------------------------%
    D{n}=Mn/(factorial(n)*t);
   
end
toc
figure
plot(x,D{1,1});title('D1');xlabel('x');ylabel('D1');
figure
plot(x,D{1,2});title('D2');xlabel('x');ylabel('D2');
figure
plot(x,D{1,3});title('D3');xlabel('x');ylabel('D3');
figure
plot(x,D{1,4});title('D4');xlabel('x');ylabel('D4');
