%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%first method for pdf%%%%%%%%%%%%%%%%%%%%%%%
clear
a=load('data_error.txt');
format long e
b=a(:,2);
l=length(b);
N=100;
K=[];
pdf=zeros(N+1,1);
delta=(max(b)-min(b))/N;
for i=1:l
    k=floor((b(i)-min(b))/delta)+1;
    K=[K,k];
    pdf(k,1)=pdf(k,1)+1;
end
Min=min(K);
Max=max(K);
x=zeros(N+1,1);
PDF=zeros(N+1,1);
for j=1:N+1
    x(j,1)=((j-1)*delta)+min(b);
    PDF(j,1)=pdf(j,1)*delta;
end
e=((N.*(PDF./sum(PDF(:,1)))).*(sqrt(1-(PDF./sum(PDF(:,1))))));%NP(sqrt(1-p))variance tozi gausi
figure
plot(x,PDF);xlabel('data');ylabel('number');title('simple method for PDF');
figure
plot(x,(PDF./sum(PDF(:,1))));xlabel('data');ylabel('probability distibution');
figure
errorbar(x,(PDF./sum(PDF(:,1))),e)