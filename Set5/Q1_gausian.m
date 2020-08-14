%%%%%%%%tolid data gausian%%%%%%%%
clear

N=100000;
gama=-1.05;
t=[1:N];
Ct=t.^(gama);    %%%%%farz mikonim ke correlation azin rabete peirovi konad

S=fft(Ct); %%%dakhele del formole correlation S neshaste baraye bedast avardane an kafist roye correlation forie bezanim
A1=randn(1,N);%%%%%%%%A1 va A2 az tarighe box muller bedast miayad
A2=randn(1,N);
X=sqrt(S/2).*(A1+1i*A2); %% taghsim bar 2 be dalil in ast ke variance ra yek farz kardim(hal X(w) ra darim)
x=ifft(X);%% baraye be dast avardane x(t) bayad roye X(w) inverse forie trasform bezanim(ifft)
x=real(x);% tanha ghesmate real made nazar ast

figure
plot(Ct(1:10));%plot correlation ,oadele avalie
%--------------calculating PDF of the generated data--------------%
M=100;    %tedade binbandi
P=zeros(2,M+1);
delta=(max(x)-min(x))/M;
Kmin=floor(min(x)/delta);
Kmax=floor(max(x)/delta);
P(1,:)=(Kmin:Kmax).*delta;

for i=1:N ;
    k=floor(x(i)/delta);
    w=abs(Kmin)+k+1;
    P(2,w)=P(2,w)+1;
end

P1=P(2,:)./N;
figure
plot(P(1,:),P1);title('PDF')

%-----------calculating correlation of the generated data-----------%
T=10;
Cx=zeros(1,T+1);

for t1=0:T;
    %k=N-t1;
    for i=1:N-t1;
        %a=t1+i;
        Cx(1,t1+1)=Cx(1,t1+1)+(x(1,(t1+i))*x(1,i));
    end
    Cx(1,t1+1)=Cx(1,t1+1)/(N-t1);
end
figure
plot(Cx);title('Correlation');xlabel('t');ylabel('C(t)');
