clear
a=load('data3.txt');
L=length(a);
N=100;
d=(max(a)-min(a))/N;
Kmin=floor(min(a)/d);
Kmax=floor(max(a)/d);
M=10;
delta=zeros(1,M+1);
for t=0:M;
    P1=zeros(1,N+1);
    Pj=zeros(N+1,N+1);
    for i=1:L-M ;
        k1=floor(a(i)/d);
        k2=floor(a(i+t)/d);
        W1=abs(Kmin)+k1+1;
        W2=abs(Kmin)+k2+1;
        P1(1,W1)=P1(1,W1)+1;
        Pj( W1, W2)=Pj( W1, W2)+1;
    end
    S=sum(P1);
    P1(1,:)=P1(1,:)./S;
    Pj(:,:)=Pj(:,:)./S;


    for n=1:N;
        for b=1:N;
            delta(1,t+1)=delta(1,t+1)+abs(Pj(n,b)-(P1(n)*P1(b)));
        end
    end
end
plot(delta);title('deltaT')
 
