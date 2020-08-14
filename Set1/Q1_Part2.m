clear
load g.txt
format long e
b=g;
x=zeros(16384,3);
z=zeros(16384,3);
for i=1:16384
    for j=1:3
        x(i,j)=b(i,j);
    end
end
for i=16385:32768
    for j=1:3
        z(i-16384,j)=b(i,j);
    end
end
s=zeros(16384,1);
k=zeros(16384,1);
X=0;
for i=1:16384
 s(i,1)=2*x(i,2);
 X=X+(1/(x(i,3)^2));
end
sigmax=1/X;
K=0;
for i=1:16384
    k(i,1)=2*z(i,1);
    K=K+(1/(z(i,3)^2));
end
sigmak=1/K;
%y=2x+2z;
sigma1=0;
sigma2=0;
for i=1:16383 %sigma(y)^2=seri(df(i)/dx)^2*(sigmax(i)^2))+seri((df(i)/dz)^2)*sigmaz(i)^2); dletax=deltaz=1;
    sigma1=sigma1+((s(i+1,1)-s(i,1))^2)*(sigmax);
    sigma2=sigma2+((k(i+1,1)-k(i,1))^2)*(sigmak); 
end
SIGMAY2=sigma1+sigma2;
disp(SIGMAY2)


    