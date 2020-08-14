clear   
N=100000;
gama=-1.05;
t=[1:N];
Ct=t.^(gama);%% formol correlation farzi
x=rand(1,N);  %%%%x(w)
x=x-mean(x); %baraye inke miangin sefr shavad
Py=fft(Ct); %baraye tolid py bayad roye correlation tabdil forie zad
X=fft(x);   %x(k) barabar tabdil forie x(w) ast
Y=sqrt(Py/var(x)).*X; %tolid dade gheire gausi y(k)
y=ifft(Y);  %%%baraye tolid y(x) makose tabdile forie mizanim
y=real(y); %faghat ghesmate haghighie an madde nazar ast

%-------------- PDF of the generated data--------------%
figure
hist(y,200);title('PDF')  %hist faravani ra mikeshad ba 200 bin bandi
%-----------calculating correlation of the generated data-----------%
T=100;
Cy=zeros(1,T+1);

for t1=0:T;
    %k=N-t1;
    for i=1:N-t1;
        %a=t1+i;
        Cy(1,t1+1)=Cy(1,t1+1)+(y(1,t1+i)*y(1,i));
    end
    Cy(1,t1+1)=Cy(1,t1+1)/(N-t1);
end
figure
plot(Cy);title('Correlation');xlabel('t');ylabel('C(t)')