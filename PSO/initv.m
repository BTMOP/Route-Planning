function [ vx ,vy ] = initv(possize,dim,vmax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initv():��ʼ���ٶ� dim:ÿ�����ӵ�ά��
%possize:����Ⱥ��С vmax �ٶ�����
%vx\vy����ʼ����Ⱥ ÿһ��Ϊһ������(genx �� geny)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vx = vmax*rand(possize,dim);  %����Ⱥx
vy = vmax*rand(possize,dim);  %����Ⱥy
end