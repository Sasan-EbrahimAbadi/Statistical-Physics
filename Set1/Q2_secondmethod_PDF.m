%%%%%%%%%%%%%%%%%%%%%%%%%%%second method od PDF%%%%%%%%%%%%%%%%%%%%%

clear
a=load('data_error.txt');
format long e
b=a(:,2);
l=length(b);
q=2;
N=100;
K=[];
D=(q/((2^((2*q)+1))*((factorial(q)*factorial(q))/factorial((2*q)+1))));
pdf=zeros(N+1,1);
delta=(max(b)-min(b))/N;
for i=1:l
    k=floor((b(i)-min(b))/delta)+1;
    K=[K,k];
    pdf(k,1)=pdf(k,1)+abs(((1-(k^2))*D));
end
Min=min(K);
Max=max(K);
x=zeros(N+1,1);
PDF=zeros(N+1,1);
for j=Min:Max
    x(j,1)=((j-1)*delta)+min(b);
    PDF(j,1)=pdf(j,1)*delta;
end
figure
plot(x,PDF);xlabel('data');ylabel('number');title('distribution')
figure
plot(x,(PDF./sum(PDF(:,1))));xlabel('data');ylabel('PDF');title('probability')
figure
errorbar(x,(PDF./sum(PDF(:,1))),(PDF./(sum(PDF(:,1))*20)))