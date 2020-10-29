function [tij ] = updatexinxisu( px,py,sita,tij,jindu,p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatexinxisu() ��Ϣ�ظ���
% nij�������� tij ��Ϣ��,
% Q ��ʼ��Ϣ�� p ����ϵ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distance = caldis(px,py);
[mindis,minindex] = min(distance);%�ҵ�����·��
bestpx = px(minindex,:);        %����·��x
bestpy = py(minindex,:);        %����·��y
bestsita = sita(minindex,:);    %����·���Ƕ�
deta = 1/mindis;                %����ƽ����Ϣ��
[sizex,sizey] = size(px);       %��ȡ�ߴ�
detatij = zeros(size(tij));     %��ʼ����Ϣ�ر仯����
for i = 1:sizex      %ѭ��ÿһֻ����          
    for j = 1:sizey-1
        ttx = find( bestpx == px(i,j));
        tty = find( bestpy == py(i,j));
        ttsita = find(bestsita == sita(i,j));
        set = isempty(ttx)&&isempty(tty)&&isempty(ttsita);
        if (~set)
            % ������·�������������Ϣ��
            tx = px(i,j)/jindu+1;
            ty = py(i,j)/jindu+1;
            detatij(tx,ty,sita(i,j)) = detatij(tx,ty,sita(i,j))+deta;
        end
    end
end
tij = (1-p)*tij+detatij;     %��Ϣ�ظ���
[a,b,c] = size(tij);
for i = 1:a
    for j =1:b
        for t =1:c
            if(isnan(tij(i,j,t)))
                tij(i,j,t)=1000;
            elseif(tij(i,j,t)>1000)
                tij(i,j,t)=1000;
            elseif(tij(i,j,t)<0)
                tij(i,j,t)=0;
            else
                tij(i,j,t)=tij(i,j,t);
            end
                
        end
    end
end
end