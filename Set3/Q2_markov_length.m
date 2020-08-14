tic
a=load('data3.txt');
L=length(a);
N=100;
d=(max(a)-min(a))/N;
Kmin=floor(min(a)/d);
Kmax=floor(max(a)/d);
M=1000;
delta=zeros(1,M);
for t=1:M;
    
    P1=zeros(1,N+1);
    P2=zeros(1,N+1);
    P3=zeros(1,N+1);
    Pj32=zeros(N+1,N+1);
    Pj31=zeros(N+1,N+1);
    Pj21=zeros(N+1,N+1);
    Pc32=zeros(N+1,N+1);
    Pc31=zeros(N+1,N+1);
    Pc21=zeros(N+1,N+1);
   
    for i=1:L-2*t;
    k1=floor(a(i)/d);
    k2=floor(a(i+t)/d);
    k3=floor(a(i+2*t)/d);
    
    W1=abs(Kmin)+k1+1;
    W2=abs(Kmin)+k2+1;
    W3=abs(Kmin)+k3+1;
    
    P1(1,W1)=P1(1,W1)+1;
    P2(1,W2)=P2(1,W2)+1;
    P3(1,W3)=P3(1,W3)+1;
    
    Pj32( W3, W2)=Pj32(W3, W2)+1;
    Pj31( W3, W1)=Pj31( W3, W1)+1;
    Pj21( W2,W1)=Pj21( W2, W1)+1;
    
    end
    S1=sum(P1);
    S2=sum(P2);
    S3=sum(P3);
    S31=sum(Pj31(:));
    S32=sum(Pj32(:));
    S21=sum(Pj21(:));
    P1(1,:)=P1(1,:)./S1;
    P2(1,:)=P2(1,:)./S2;
    P3(1,:)=P3(1,:)./S3;
    Pj31(:,:)=Pj31(:,:)./S31;
    Pj32(:,:)=Pj32(:,:)./S32;
    Pj21(:,:)=Pj21(:,:)./S21;
    
   for j=1:N+1;
       
    Pc31(j,:)=Pj31(j,:)./P1;
    Pc32(j,:)=Pj32(j,:)./P2;
    Pc21(j,:)=Pj21(j,:)./P1;
   end
   f31=find(isnan(Pc31));
   f32=find(isnan(Pc32));
   f21=find(isnan(Pc21));
   Pc31(f31)=0;
   Pc32(f32)=0;
   Pc21(f21)=0;
  
   for k3=1:N+1;
       for k1=1:N+1;
           Pm=0;
           for k2=1:N+1;
               Pm=Pm+Pc32(k3,k2)*Pc21(k2,k1);
           end
           delta(1,t)=delta(1,t)+abs(Pc31(k3,k1)-Pm);     
       end
   end

end
 plot(delta);title('Markov');xlabel('t');ylabel('delta(t)')

 
 toc