function [ output ] = iscoll( f , x1 , x2 )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscoll()���ڼ��ÿһ��·���Ƿ����ϰ����ཻ
% f �ϰ���߽�������  x1��x2�ֱ�Ϊ�����˵�
% output���Ϊ'no' ��û����ײ����֮
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
item = 20;                 %����ȡ����Ŀ
xx = linspace(x1(1),x2(1),item); %����x
yy = linspace(x1(2),x2(2),item); %����y
output = 'no';                   %��ʼ��
for index = 1:item               %ѭ��
    if(f(xx(index),yy(index))<=0)%������ײ
        output = 'yes';          %��ֵ���
        break;
    end
end
end

