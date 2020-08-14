clear
a=load('data_error.txt');
b=a(:,2);
l=length(b);
K=[];
N=200;

delta=(max(b)-min(b))/N;
pdf=zeros(N+1,1);
for i=1:l
    k=floor((b(i)-min(b))/delta)+1;
    K=[K,k];
    pdf(k,1)=pdf(k,1)+1;
end
x=zeros(N+1,1);
for ii=1:N+1
    x(ii,1)=(((ii-1)*delta)+min(b));
end
PDF=zeros(N+1,1);
m=10;
sum=0;
sigma=1;
PDF1=zeros(N+1,1);
for g=1:N+1
    P=0;
    jmin=max(1,g-m);
    jmax=min(N+1,g+m);
    for j=jmin:jmax
        P=P+(pdf(j,1)*((1/(sigma*sqrt(2*pi)))*exp(-((g-j)^2)/(2*(sigma^2)))));
    end
    PDF1(g,1)=P;
    sum=sum+P;
end
PDF=PDF1(:,1)./sum;
plot(x,PDF)