function [ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addallgen()������ʼ���Ŀ��������Ⱥ
% genx genyΪ��Ⱥ xs ys,xt,yt�ֱ�Ϊ��ʼ���Ŀ���
% genxx genyy ���ذ�����ʼ���Ŀ��������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genx);     %��ȡ��Ⱥά��
genxx = zeros(sizex,sizey+2);   %��ʼ����Ⱥx����
genxx(:,1) = ones(sizex,1)*xs;  %�ֱ�Ŀ��� ��ʼ�����
genxx(:,end) = ones(sizex,1)*xt;%�������
genxx(:,2:end-1)=genx;
genyy = zeros(sizex,sizey+2);   %y������ͬ����
genyy(:,1) = ones(sizex,1)*ys;
genyy(:,end) = ones(sizex,1)*yt;
genyy(:,2:end-1)=geny;
end