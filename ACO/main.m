clear all;clc;
xs=0;      ys=0;      %��ʼ��
xt=1.5;    yt=9;    %Ŀ���
xobs=[1.5 4.0 1.2];   %�ϰ��Բ��
yobs=[6.5 3.0 1.5];
robs=[1.5 1.0 0.8];

theta=linspace(0,2*pi,100);             %��ͼx����
NC = 100;                            %��������
tij_ori = 1000;                       %��ʼ��Ϣ��
m = 1;                               %������������
p= 0.01;                              %����ϵ��
tlim =[0 1000];                       %��Ϣ�صķ�Χ
a = 1; b = 3;                         %�̶�
lim=[0 3 0 3];
sitaran = [0 pi/4 pi/2 3/4*pi pi 5/4*pi 3/2*pi 7/4*pi 2*pi];
jindu = 0.5;                          %�ָ��
enx = lim(2)/jindu; eny = lim(4)/jindu;        %���ݷָ���Ŀ
tij = tij_ori*ones(enx,eny,8);        %�˸��������Ϣ��
nij = zeros(enx,eny,8);
nij(:,:,1:2:8) = jindu*ones(enx,eny,4);
nij(:,:,2:2:8) = sqrt(2)*jindu*ones(enx,eny,4);
nij = ones(enx,eny,8)./nij;
obs = zeros(eny+1,enx+1);   %���ϰ������Ϊ1
for i = 1:enx+1         % ѭ��x����
    for j = 1:eny+1   % ѭ��y����
        x = i*jindu-jindu;
        y = j*jindu-jindu;
        for t=1:length(xobs)
            fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
            if(fcoll(x,y)<=0)
              obs(j,i)=1;%������ײ��ֵ0
              break;
            end
        end
    end
end


item = 1; %������
while(1)
    if (item>NC)
        break;
    end;
    disp(['��',num2str(item),'����']);
    item = item+1;                              %��������1
    [ px,py,sita ] = calculate(nij,tij,obs,xt,yt,lim,m,jindu);
    sita(:,1)=[];
    [tij ] = updatexinxisu( px,py,sita,tij,jindu,p);
%     if (sum(sum(lasttij-tij,2),1)==0)
%         break;
%     end;
end

figure(1)                               %��ͼ���
for k=1:numel(xobs)                     %ѭ�������ϰ���
fill(xobs(k)+robs(k)*cos(theta),yobs(k)...
    +robs(k)*sin(theta),[0.5 0.7 0.8]);
hold on;
end
plot(xs,ys,'bs','MarkerSize',12,'MarkerFaceColor','y'); %������ʼ��
plot(xt,yt,'kp','MarkerSize',16,'MarkerFaceColor','g'); %����Ŀ���
axis([0 6 0 10])                                        %����������
title('��Ⱥ�㷨-·���滮');grid on;                    %���ñ��� �������
