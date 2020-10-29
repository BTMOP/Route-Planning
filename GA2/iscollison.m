function [ output ] = iscollison( genxx,genyy,xobs,yobs,robs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscollison()�������ж��Ƿ����ϰ�����ײ
% genx genyΪ��Ⱥ xs ys,xt,yt�ֱ�Ϊ��ʼ���Ŀ���
% xobs��yobs��robsΪ�ϰ���Բ�ĺͰ뾶
% output ����һ����gensize��1������Ϊ0.1 ������ײ Ϊ0����ײ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx); %��ȡ��Ⱥά��
output = 0.1*ones(sizex,1);%��ʼ��
for i = 1:sizex         % ѭ��ÿ������
    for j = 1:sizey-1   % ѭ��ÿ��·���ķֶ�
        if(output(i)==0)
            break;
        end
        for t=1:length(xobs)
            fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
            if(strcmp(iscoll(fcoll,[genxx(i,j) genyy(i,j)],...
                    [genxx(i,j+1),genyy(i,j+1)]),'yes'))
                output(i)=0;%������ײ��ֵ0
                break;
            end
        end
    end
end

end

