function [ posx,posy ] = updatepos( posx,posy,vx,vy )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatepos()�����ӵ�λ�ø���
% posx posy��λ�� vx vy���ٶ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
posx = posx+vx;  %����x����λ��
posy = posy+vy;  %����y����λ��
end
