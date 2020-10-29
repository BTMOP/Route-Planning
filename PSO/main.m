xs=0;      ys=0;      %��ʼ��
xt=1.5;    yt=8.9;    %Ŀ���
xobs=[1.5 4.0 1.2];   %�ϰ��Բ��
yobs=[6.5 3.0 1.5];
robs=[1.5 1.0 0.8];
possize =81;          %��Ⱥ��С
gendai =200;          %�ݻ�����
w =0.9;               %Ȩ��ϵ��
c1= 2; c2 =2;         %ѧϰѧϰ����
dim = 5;              %ÿ������ά��
vmax = 1;             %�ٶ����ֵ
lim = [0 6 0 10];     %�ռ䷶Χ����
[posx,posy] = initpos(possize,dim,lim,xobs,yobs,robs,xs,ys,xt,yt);%��ʼ����Ⱥ
[ vx ,vy ] = initv(possize,dim,vmax);                 %��ʼ���ٶ�

pbest =zeros(possize,1);  %ÿ������������Ӧ��
pidx =zeros(possize,dim);  %ÿ�����Ӷ�Ӧ��λ�� x����
pidy =zeros(possize,dim);  %ÿ�����Ӷ�Ӧ��λ�� y����

maxgbest = zeros(1);    %����������������Ӧ��
maxpgdx = zeros(1,dim); %��������ȫ������λ�� x����
maxpgdy = zeros(1,dim); %��������ȫ������λ�� y����
maxfitvalueall = [];    %����������Ӧ��

for item = 1:gendai
   [ posxx,posyy ] = addallgen( posx,posy,xs,ys,xt,yt);  %����ʼ���Ŀ������
   [collision] = iscollison( posxx,posyy,xobs,yobs,robs);%����Ƿ����ϰ����ཻ
   [fitvalue] = fitvalue_cal( posxx,posyy,collision);    %��Ӧ�ȼ��� 
   [pbest,pidx,pidy,gbest,pgdx,pgdy ] = fit_cmp(posx,...
       posy,fitvalue,pbest,pidx,pidy);     %����������Ӧ�Ⱥ�ȫ��������Ӧ�ȸ���
   [vx,vy] = updatev( vx,vy,w,posx,posy,pidx,pidy,...
       pgdx,pgdy,c1,c2);                   %�ٶȸ���
   [posx,posy] = updatepos( posx,posy,vx,vy);%λ�ø���
   if(maxgbest<gbest)                      %�ж��Ƿ�������ʷ���Ž��
       maxgbest = gbest;                   %������ʷ������Ӧ��
       maxpgdx = pgdx;                     %������ʷ��������x
       maxpgdy = pgdy;                     %������ʷ��������y
   end
   maxfitvalueall = [maxfitvalueall,maxgbest];    %����������Ӧ��
   w = w-(w-0.3)/gendai;                  %Ⱥ������
end
theta=linspace(0,2*pi,100);             %��ͼx����
figure(1)                               %��ͼ���
for k=1:numel(xobs)                     %ѭ�������ϰ���
fill(xobs(k)+robs(k)*cos(theta),yobs(k)...
    +robs(k)*sin(theta),[0.5 0.7 0.8]);
hold on;
end
plot(xs,ys,'bs','MarkerSize',12,'MarkerFaceColor','y'); %������ʼ��
plot(xt,yt,'kp','MarkerSize',16,'MarkerFaceColor','g'); %����Ŀ���
plot([xs maxpgdx xt],[ys maxpgdy yt])                   %��������·��
axis([0 7 0 10])                                        %����������
title('����Ⱥ�㷨-·���滮');grid on;                    %���ñ��� �������
figure(2)
plot(maxfitvalueall)                           %������Ӧ�ȱ仯����
title('��Ӧ�ȱ仯����'); grid on;               %���ñ��� �������
xlabel('����/n'); ylabel('��Ӧ��')              %���������
disp(['���ž��룺',num2str(1/(maxgbest*10))])