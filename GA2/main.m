xs=0;      ys=0;      %��ʼ��
xt=1.5;    yt=8.9;    %Ŀ���
xobs=[1.5 4.0 1.2];   %�ϰ��Բ��
yobs=[6.5 3.0 1.5];
robs=[1.5 1.0 0.8];
gensize =31;          %��Ⱥ��С
gendai =50;          %�ݻ�����
pa =0.7;              %�������
pc= 0.07;             %�������
dim = 4;              %Ⱦɫ����Ŀ
lim = [0 6 0 10];     %�ռ䷶Χ����
[genx,geny] = initgen(gensize,dim,lim,xobs,yobs,robs,xs,ys,xt,yt);%��ʼ����Ⱥ
[ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt);  %����ʼ���Ŀ������
[collision] = iscollison( genxx,genyy,xobs,yobs,robs);%����Ƿ����ϰ����ཻ
[fitvalue] = fitvalue_cal( genxx,genyy,collision);    %��Ӧ�Ⱦ���
maxfitvalue = 0;
maxfitvalueall=[];
for index = 1:gendai
 pa = pa -pa/gendai*0.1;                            %������ʸ���
[ genx,geny ] = seclect( genx,geny,fitvalue,'lunpan');%ѡ�����
[ genx,geny ] = jiaocha( genx,geny,pa,fitvalue,xobs,yobs,robs,xs,ys,xt,yt);%�������
[ genx,geny ] = bianyi( genx,geny,pc,lim,fitvalue,xobs,yobs,robs,xs,ys,xt,yt);%�������
[ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt);  %����ʼ���Ŀ������
[collision] = iscollison( genxx,genyy,xobs,yobs,robs);%����Ƿ����ϰ����ཻ
[fitvalue] = fitvalue_cal( genxx,genyy,collision);%��Ӧ�ȼ���
[tt,ttt] = max(fitvalue);               %�ҵ����Ÿ���
if(maxfitvalue<tt)                      %�������Ÿ���
    maxfitvalue=tt;                     %��Ӧ��
    maxgenx = genx(ttt,:);              %����x
    maxgeny = geny(ttt,:);              %����y
end
maxfitvalueall=[maxfitvalueall,tt];     %�����������ŵ���Ӧ��
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
[maxfitvalue,maxvalueindex] = max(fitvalue);            %��ȡ��Ӧ������·��
plot(genxx(maxvalueindex,:),genyy(maxvalueindex,:))     %��������·��
axis([0 7 0 10])                               %����������
title('�Ŵ��㷨-·���滮');grid on;             %���ñ���
figure(2)
plot(maxfitvalueall)                           %������Ӧ�ȱ仯����
title('��Ӧ�ȱ仯����'); grid on;               %���ñ��� �������
xlabel('����/n'); ylabel('��Ӧ��')              %���������
disp(['���ž��룺',num2str(1/(maxfitvalue*10))])%�����̾���