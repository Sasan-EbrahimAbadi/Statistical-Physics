
clear
tic
d=load('data_error.txt');
data=d(:,2);
N=length(data);
x=min(data):0.01:max(data);
L=length(x);
T=100;
for n=1:2 %baraye D1 va D2
    Mn=zeros(L,T);
    delta=zeros(1,T);
    for t=1:T; %be ezaye tav haye mokhtalef D hara mohasebe mikonim
        for k=1:L
            j=0;
            for i=1:N-T        
                if abs(data(i)-x(k))<0.01; %baraye in ast ke ba in shart dar nazar begirim ke agar data ha dar yek mahdode nazdik ham boodand mosavi dar nazar begirad va moment ra hesab konad
                    j=j+1;
                    a=(((data(i+t)-x(k)))^n);
                    delta(1,t)=data(i+t)-x(k); %delta_x(t)
                    Mn(k,t)=Mn(k,t)+a;
                end         
            end
            if j~=0
               Mn(k,t)=Mn(k,t)/j;
            end
        end

%-------------------------------------------%
        D{n,t}=Mn/(factorial(n)*t);
        Ds=D{n,t};
    %dc(t)=-(delta(t,:).*(Ds(1,t)))-Ds(2,t);

    end
    
end
toc
DD1=D{1,T};%%DD1 haman D1 ha baraye tav haye molkhtalef
DD2=D{2,T};%%%DD2 haman D(2) ha be ezaye tav haye mokhtalef
dc=zeros(1,T);
for tt=1:T
    for jj=1:808
        dc(tt)=dc(tt)-delta(1,tt).*DD1(jj,tt)-DD2(jj,tt);%%dc(t)/dt=-<deltax(t)*D1(T)>-<D2(T)>
    end
end
figure
plot((diff(dc))./100);axis([0,100,-0.75,0.5]);
figure
plot(x,DD1(:,10));title('D1');xlabel('x');ylabel('D1');
figure
plot(x,DD2(:,10));title('D2');xlabel('x');ylabel('D2');
