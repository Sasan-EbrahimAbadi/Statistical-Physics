clear 
Data=load('data3.txt');
tic
N=length(Data);
Nr=2*N;
a=-5;
b=5;
Random=(b-a)*rand(Nr,1)+a;

%------------threshold on Data--------
L=Data>3;
Data=Data(L);
F=Random>3;
Random=Random(L);
N=length(Data);
Nr=length(Random);

%---------------finding feature ;here our feature is local maximmum--------
 
d=0;
ND=0; %number of features in Data%
for i=2:N-1
    if Data(i)>Data(i-1) && Data(i)>Data(i+1)
        ND=ND+1;
        d(ND)=i;
    end
end
r=0;
NR=0; %number of features in Random set%
for i=2:Nr-1
    if Random(i)>Random(i-1) && Random(i)>Random(i+1)
        NR=NR+1;
        r(NR)=i;
    end
end

%---------------- computing DD,RD and RR %---------------%
tic
DD=zeros(1,N);
for i=1:ND
    for s=1:ND
        p1=abs(d(i)-d(s));
        DD(p1+1)=DD(p1+1)+1;
    end
end
toc
RR=zeros(1,Nr);

for i=1:NR
    for s=1:NR
        p3=abs(r(i)-r(s));
        RR(p3+1)=RR(p3+1)+1;
    end
end
DR=zeros(1,Nr);
for i=1:ND
   for s=1:NR
       p2=abs(d(i)-r(s));
       DR(p2+1)=DR(p2+1)+1;
    end
end

k_c=zeros(1,N);
for i=1:N
    k_c(i)=((DD(i)/RR(i))*((Nr*(Nr-1))/(N*(N+1))))-1;
end
 k_c(isnan(k_c))=0;
 k_c(1)=-1;
 figure
 plot(k_c(1:100));title('TPCF');xlabel('distance');ylabel('tpcf')
 
for i=1:50
    k_c1(i)=4*(DD(i)*RR(i))/(100*(DR(i)^2));
end

k_c1(1)=-1;

e=zeros(1,50);
for i=1:2:50
    e(i)=(sqrt(i)/abs(k_c1(i)))/1000;
end
figure
errorbar(k_c1,e)
title('TPCF')
xlabel('distance')
ylabel('tpcf')
toc