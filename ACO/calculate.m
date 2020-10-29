function [ px,py,sita ] = calculate(nij,tij,obs,xt,yt,lim,m,jindu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate() ���ڼ���ÿһ������
% nij ����ĵ��� tij ��Ϣ��  a ��Ϣ����Ҫ�̶� b ����������Ҫ�̶�
% tabu ���ɱ� newtabu ·�������ɱ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
px = zeros(m,1);py=zeros(m,1); %��ʼ����ǰ��
sitaran = [0 pi/4 pi/2 3/4*pi pi 5/4*pi 3/2*pi 7/4*pi 2*pi];
sita = zeros(m,1);
while(1)
    genx = (px(:,end)==xt*ones(m,1));
    geny = (py(:,end)==yt*ones(m,1));
    if(sum(genx)+sum(geny)==2*m)   %�������϶����յ�
        break;
    end
    sita = [sita,zeros(m,1)];
    px = [px ,zeros(m,1)];
    py = [py ,zeros(m,1)];
    for i = 1:m                %ѭ��ÿһֻ����
        disp(['��',num2str(i),'����']);
        while(1)
            if((px(i,end-1)==xt)&&(py(i,end-1)==yt)) %�Ѿ������յ�
                px(i,end) = px(i,end-1); %���ֲ���
                py(i,end) = py(i,end-1);
                sita(i,end) = sita(i,end-1);
                disp(['��',num2str(i),'���ϵ����յ�']);
                break;
            end
            lasttx =  px(i,end-1)/jindu+1;
            lastty =  py(i,end-1)/jindu+1;
            ttij = reshape(tij(lasttx,lastty,:),1,8);
            nnij = reshape(nij(lasttx,lastty,:),1,8);
            pij = ttij.*nnij/sum(ttij.*nnij); % ����˸�����ѡ�����
            nextsita =  select(pij);          % ѡ��Ƕ�
            ppx = px(i,end-1)+jindu*design(cos(sitaran(nextsita)));
            ppy = px(i,end-1)+jindu*design(sin(sitaran(nextsita)));
            ab = [px(i,:);py(i,:)];           % ��iֻ�����߹���·��
            abc =  [ppx;ppy];                 % ��һ���ĵ�
            for mt = 1:size(ab,2)
                set = (sum(ab(:,mt)-abc));   % set =0 ��ʾ�߹� 1û�߹�
                if(set==0)
                break
                end
            end
            if((ppx>lim(1))&&(ppy>lim(3))&&(ppx<lim(2))&&(ppy<lim(4))&&set)
                tx = ppx/jindu+1;             % ��������λ��
                ty = ppy/jindu+1;
                if(obs(ty,tx)==0)             % ����ײ
                   px(i,end) = ppx;
                   py(i,end) = ppy;
                   [px;py]
                   sita(i,end) = nextsita;
                   break;
                end
            end
        end
    end
end

