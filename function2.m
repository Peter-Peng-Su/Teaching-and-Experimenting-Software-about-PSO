%Ѱ��e^(-x^2/200)*cos(x)�����ֵ
%����ÿһ����n�㣨һά��
%N      ��ĸ���
%a      ����Ӧϵ��
%b      ������Ӧϵ��
%c      ȫ����Ӧϵ��
%M      ��������

%�����СӦ����50/8=6.25

function [xtotal,ptotal,pgtotal,pntotal] = function2(N,a,b,c,M)

% ��ʼ����Ⱥ�ĸ��壨�����������޶�λ�ú��ٶȵķ�Χ��
format long;
x = zeros(1,N);
for i = 1:N
    x(i) = (rand-0.5)*50;
end

% ��ʼ��p��pg��pn
p = x;      %һ����������ʷ���λ�õ�

pg = x(N);  % pgΪһ����ȫ�����ŵ�
for i=1:(N-1)
    if(fitness(x(i))>fitness(pg))
        pg = x(i);
    end
end

pn = x;     %pnΪһ�����������ŵ�
for i = 1:N
    for j = 1:N
        if x(j)-x(i)<=6.25 && fitness(x(j))>fitness(pn(i))
            pn(i) = x(i);
        end
    end
end

% ������Ҫѭ�������չ�ʽ���ε�����ֱ�����㾫��Ҫ��
thex = zeros(M,N);  %ÿһ�����λ��
thept = zeros(M,N); %ÿһ��������Ž�
thepn = zeros(M,N); %ÿһ���������ŵ��λ��
thepg = zeros(1,M);   %ÿһ��ȫ�����ŵ��λ��
for t=1:M
    thex(t,:) = x;
    thept(t,:) = p;
    thepg(t) = pg;
    thepn(t,:) = pn;
    for i=1:N
        x(i)=x(i)+a*(p(i)-x(i))+b*(pn(i)-x(i))+c*(pg-x(i));     % ����λ��
        if fitness(x(i)) > fitness(p(i))             %�����������Ž�
            p(i)=x(i);
        end
        if fitness(x(i)) > fitness(pg)       %����ȫ�����Ž�
            pg=x(i);
        end
        for j = 1:N                     %�����������Ž�
            if x(j)-x(i)<=7.5 && fitness(x(j))>fitness(pn(i))
                pn(i) = x(j);
            end
        end
    end
end

%������
xtotal = thex;
ptotal = thept;
pgtotal = thepg;
pntotal = thepn;
end

function y = fitness(x)
    y = exp(-(x*x)/200)*cos(x);
end
