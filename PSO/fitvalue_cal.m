function [ output ] = fitvalue_cal( genxx,genyy,collision)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fitvalue_cal() ��Ӧ�ȼ���
% genxx genyy ����Ⱥ collision �Ƿ��������ϰ�����ײ
% ��Ӧ�ȼ��� ����Ϊ1/distance*collision
% output ��Ӧ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);      %����Ⱥ��С��ά��
dis = zeros(sizex,1);             %��ʼ������
for i = 1:sizex                   %ѭ��ÿ������
    for j=1:sizey-1               %ѭ��ÿ��·��
        dis(i)=dis(i)+sqrt((genxx(i,j+1)-genxx(i,j)).^2....
        +(genyy(i,j+1)-genyy(i,j)).^2); %�ۼӼ���·��
    end
end
output = ones(sizex,1)./dis.*collision; %������Ӧ��
end

