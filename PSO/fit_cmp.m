function [ pbest,pidx,pidy,gbest,pgdx,pgdy ] = fit_cmp(posx,posy,fitvalue,pbest,pidx,pidy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fit_cmp(��������Ӧ�ȱȽ�
% pos ��ǰλ��            fitvalue ��ǰ��Ӧ��
% pbest ÿ������������Ӧ�� pidx pidy ÿ�����Ӷ�Ӧ��λ��
% gbest ȫ��������Ӧ��     pgdx pgdy ȫ������λ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[max1,index1] = max(fitvalue); %��Ӧ�����ֵ
gbest = max1;                  %������Ӧ��
pgdx = posx(index1,:);         %��������x
pgdy = posy(index1,:);         %��������y
for i = 1:size(posx,1)         %ѭ��ÿ������
    if(fitvalue(i)>pbest(i))   %�ҵ���������
        pidx(i,:) = posx(i,:); %������ʷ����λ��x
        pidy(i,:) = posy(i,:); %������ʷ����λ��y
        pbest(i) = fitvalue(i);%ÿ������������Ӧ��
    end
end
end