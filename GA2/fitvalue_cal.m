function [ output ] = fitvalue_cal( genxx,genyy,collision)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addallgenfitvalue_cal������Ӧ�ȼ���
%genx genyΪ��Ⱥ xs ys,xt,yt�ֱ�Ϊ��ʼ���Ŀ���
% genxx genyy ���ذ�����ʼ���Ŀ��������
% ��Ӧ�ȼ��� ����Ϊ1/distance*collision
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);
dis = zeros(sizex,1);
for i = 1:sizex
    for j=1:sizey-1
        dis(i)=dis(i)+sqrt((genxx(i,j+1)-genxx(i,j)).^2....
        +(genyy(i,j+1)-genyy(i,j)).^2);
    end
end
output = ones(sizex,1)./dis.*collision;
end

