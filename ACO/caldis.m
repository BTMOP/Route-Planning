function [ distance ] = caldis(px,py)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caldis() ��Ϣ�ظ���
% distance ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distance = zeros(size(px,1),1);  %��ʼ������
for i = 1:size(px,1)       %ѭ������ÿһֻ���ϵľ���
    dist = 0;
    for j = 1:size(px,2)-1 %�����������
        dist =dist +sqrt((px(i,j+1)-px(i,j+1)).^2+(py(i,j+1)-py(i,j+1)).^2);
    end
    distance(i) = dist;      %�������ֵ
end          
end