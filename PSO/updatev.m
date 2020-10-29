function [ newvx,newvy ] = updatev( vx,vy,w,posx,posy,pidx,pidy,pgdx,pgdy,c1,c2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% update() ���������ٶ�
% posx posy��λ�� vx vy���ٶ�
% w Ȩ�� c1 c2 ѧϰ����
% pidx,pidy,pgdx,pgdy�������ź�ȫ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pgdxx = zeros(size(vx));  %��ʼ���ٶ�x
pgdyy = zeros(size(vx));  %��ʼ���ٶ�y
%Ϊ�˾������㣬��ȫ���������Ӻ���Ӧ�Ƚ��й㲥
for j = 1:size(vx,1)      
    pgdxx(j,:) = pgdx;
    pgdyy(j,:) = pgdy;
end
%%%%%%   �ٶȸ���   %%%%%%
newvx = w*vx+c1*rand(1)*(pidx-posx)+c2*rand(1)*(pgdxx-posx);
newvy = w*vy+c1*rand(1)*(pidy-posy)+c2*rand(1)*(pgdyy-posy);
end
