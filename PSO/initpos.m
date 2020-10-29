function [ genx ,geny ] = initpos(possize,dim,lim,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initgen():��ʼ������   possize:����Ⱥ��С
% xobs��yobs��robsΪ�ϰ���Բ�ĺͰ뾶
%n:ÿ�������Ⱦɫ����Ŀ  dimÿ�����ӵ�ά��
%lim:��Χ[xmin xmax ymin ymax]
%genx\geny����ʼ������Ⱥ ÿһ��Ϊһ������(genx �� geny)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
genx = zeros(possize,dim);      %��ʼ������Ⱥx
geny = zeros(possize,dim);      %��ʼ������Ⱥy
for tt = 1:possize              %�����ȡ����Ⱥ
  genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,dim);
  genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,dim);
  while(1)                      %ѭ����������
      if(iscollison([xs genxx1 xt],[ys genyy1 yt],xobs,yobs,robs)~=0)
          break;
      end    %���������ɵ�����·�����ϰ����ཻ������������
      genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,dim);
      genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,dim);
  end
  genx(tt,:) = genxx1;          %��������x
  geny(tt,:) = genyy1;          %��������y
end
end

