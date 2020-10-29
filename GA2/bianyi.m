function [ newgenx,newgeny ] = bianyi( genx,geny,pc,lim,fitvalue,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bianyi������������� genx genyΪ��Ⱥ
% pc ������� lim ��Ⱥ��Χ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [maxfitvalue,maxvalueindex] = max(fitvalue);
    [gensizex,gensizey] = size(genx);         %��ȡ��Ⱥ��ά�� genx ��Ⱥ����
    newgenx = zeros(gensizex,gensizey);       %��ʼ������Ⱥ
    newgeny = zeros(gensizex,gensizey);       %��ʼ������Ⱥ
    newgenx(1,:) = genx(maxvalueindex,:);     %�������Ÿ���
    newgeny(1,:) = geny(maxvalueindex,:);     
    genx(maxvalueindex,:) = genx(1,:);        %�滻���Ÿ���
    geny(maxvalueindex,:) = geny(1,:);
    genx(1,:) = newgenx(1,:);
    geny(1,:) = newgenx(1,:);
    for i = 2:gensizex
        pat = rand(1);               %���������
        if pat<=pc                   %��������
            genxline = lim(1) + (lim(2)-lim(1))*rand(1,gensizey);
            genyline = lim(3) + (lim(4)-lim(3))*rand(1,gensizey);
            while(1)                %�������������ײ �����±���
              if(iscollison([xs genxline xt],[ys genyline yt],xobs,yobs,robs)~=0)
                 break;
              end                   %���±���
              genxline = lim(1) + (lim(2)-lim(1))*rand(1,gensizey);
              genyline = lim(3) + (lim(4)-lim(3))*rand(1,gensizey);
            end
            newgenx(i,:) = genxline; %���������ĸ���
            newgeny(i,:) = genyline;           
        else                         %������
            newgenx(i,:) = genx(i,:);%ֱ�ӱ�������
            newgeny(i,:) = geny(i,:);
        end
    end
end