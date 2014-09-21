%clc;
%clear all;
vid = videoinput('winvideo',1);
%display('Video object created \m/');
triggerconfig(vid,'manual');
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat', Inf);
vid.ReturnedColorSpace='rgb';

start(vid);

   COM='COM9';
   s = serial(COM,'BaudRate',9600);
   fopen(s);
a1=0;
a2=0;
a3=0;
a4=0;
a5=0;
command=0;

for i=1:50
    trigger(vid);
    r=getdata(vid,1);
end
  [m n z]=size(r);
display('Video object created \m/');

while(1)
    
    trigger(vid);
    c=getdata(vid,1);
    l_f1=zeros(m,n);
    l_f2=zeros(m,n);
    r_f1=l_f1;
    r_f2=l_f1;
    m_f1=l_f1;
    m_f2=l_f1;
    i_f=l_f1;
    t_f=l_f1;
        
    l_f1(find((c(:,:,1)-c(:,:,2))>25))=1;        %%%%detect red colour in little finger
    l_f2(find((c(:,:,1)-c(:,:,3))>25))=1;
    l_f=l_f1.*l_f2;
    [x_l_f y_l_f]=find(l_f);
    s_x_l=size(x_l_f);
    
    r_f1(find((c(:,:,3)-c(:,:,2))>40))=1;        %%%%detect blue colour in ring finger
    r_f2(find((c(:,:,3)-c(:,:,1))>45))=1;
    r_f=r_f1.*r_f2;
    [x_r_f y_r_f]=find(r_f);
    s_x_r=size(x_r_f);
    
    m_f1(find((c(:,:,2)-c(:,:,1))>35))=1;        %%%%detect green colour in index finger
    m_f2(find((c(:,:,2)-c(:,:,3))>12))=1;
    m_f=m_f1.*m_f2;
    [x_m_f y_m_f]=find(m_f);
    s_x_m=size(x_m_f);
    
    %i=1;j=1;    
    for i=1:m-1
        for j=1:n-1
            if(((c(i,j,1)-c(i,j,3))<60) && (c(i,j,1)-c(i,j,3))>35)
                if((((c(i,j,1)-c(i,j,2))<15) && (((c(i,j,1)-c(i,j,2))>7))))
                i_f(i,j)=1;                                                      %detecting robot(yellow)
                 
                end
            end
        end
    end
    [x_i_f y_i_f]=find(i_f);
    s_x_i=size(x_i_f);
    
    i=1;j=1;    
    for i=1:m-1
        for j=1:n-1
            if(((c(i,j,1))<15) && (c(i,j,2)<20) && (c(i,j,3)<20))
                t_f(i,j)=1;                        %detecting black
                 
            end
        end
    end
    [x_t_f y_t_f]=find(t_f);
    s_x_t=size(x_t_f);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    if(s_x_l(1) ==0)
        if(a1==0)
        %turn little finger motor
        disp('red colour not detected');
        a1=1;
        command=1;
        end
    end
    if(s_x_r(1) ==0)
        if(a2==0)
        %turn ring finger motor
        disp('blue colour not detected');
        a2=1;
        command=2;
        end
    end
    if(s_x_m(1) ==0)
        if(a3==0)
        %turn middle finger motor
        disp('green colour not detected');
        a3=1;
        command=3;
        end
    end
    if(s_x_i(1) ==0)
        if(a4==0)
        %turn index finger motor
        disp('yellow colour not detected');
        a4=1;
        command=4;
        end
    end
    if(s_x_t(1) ==0)
        if(a5==0)
        %turn thumb finger motor
        disp('black colour not detected');
        a5=1;
        command=9;
        end
    end
      fwrite(s,command);   
      command=0;
   imshow(c);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if(s_x_l(1) >=1 )
        if(a1==1)
        disp('turn little finger motor opp');
        a1=0;
        command=5;
        end
    end
    if(s_x_r(1) >= 1)
        if(a2==1)
        disp('turn ring finger motor opp');
        a2=0;
        command=6;
        end
    end
    if(s_x_m(1) >= 1)
        if(a3==1)
        disp('turn middle finger motor opp');
        a3=0;
        command=7;
        end
    end
    if(s_x_i(1) >= 1)
        if(a4==1)
        disp('turn index finger motor opp');
        a4=0;
        command=8;
        end
    end
    if(s_x_t(1) >= 1)
        if(a5==1)
        disp('turn thumb finger motor opp');
        a5=0;
        command=10;
        end
    end
    imshow(c);
     fwrite(s,command);   
         command=0;
 end
  fclose(s);
stop(vid);