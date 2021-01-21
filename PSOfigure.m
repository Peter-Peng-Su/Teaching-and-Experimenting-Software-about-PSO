% �½�����
clear;
clc;
f = figure('Units','pixels','Position',[10 60 432 768],'menu','none');

%����
homepanel = uipanel('Parent',f,'Visible','on','Units','normalized','Position',[0 0.05 1 0.95]); %��ֵ1
conpanel = uipanel('Parent',f,'Visible','off','Units','normalized','Position',[0 0.05 1 0.95]); %��ֵ2
apppanel = uipanel('Parent',f,'Visible','off','Units','normalized','Position',[0 0.05 1 0.95]); %��ֵ3
exerpanel = uipanel('Parent',f,'Visible','off','Units','normalized','Position',[0 0.05 1 0.95]);%��ֵ4

combpanel = uipanel('Parent',f,'Visible','off','Units','normalized','Position',[0 0.05 1 0.95]);%��ֵ5
numpanel = uipanel('Parent',f,'Visible','off','Units','normalized','Position',[0 0.05 1 0.95]);%��ֵ6

conshowpanel = uipanel('Parent',conpanel,'Units','normalized','position',[0 -0.8 1 0.7]);
conrespanel = uipanel('Parent',conpanel,'Units','normalized','position',[0 -1.68 1 0.6]);

%����������
context = axes('Parent',conpanel,'Units','normalized','position',[0 0.5 1 0.5]);
set(context,'visible','off');
%��ǰ����
global cpanel;
cpanel = 1;

%�����ϵ
global selfp parent parentpanel;
selfp = [homepanel,conpanel,apppanel,exerpanel,combpanel,numpanel];
parent = [homepanel,homepanel,homepanel,homepanel,apppanel,apppanel];
parentpanel = [1 1 1 1 3 3];

%������ť���
bback = uicontrol('Parent',f,'style','pushbutton','units','normalized','string','back','Position',[0 0 0.333 0.05]);
bhome = uicontrol('Parent',f,'style','pushbutton','units','normalized','string','home','Position',[0.334 0 0.333 0.05]);
bprocess = uicontrol('Parent',f,'style','pushbutton','units','normalized','string','process','Position',[0.667 0 0.333 0.05]);

%���ⰴť���
concepts = uicontrol('Parent',homepanel,'style','pushbutton','units','normalized','string','��������','FontSize',17,'Position',[0 0.92 1 0.08]);
classicapps = uicontrol('Parent',homepanel,'style','pushbutton','units','normalized','string','����Ӧ��','FontSize',17,'Position',[0 0.84 1 0.08]);
exercise = uicontrol('Parent',homepanel,'style','pushbutton','units','normalized','string','�κ���ϰ','FontSize',17,'Position',[0 0.76 1 0.08]);

%������ť����
bback.Callback = {@backF};
bhome.Callback = {@homeF};

%���ⰴť����
concepts.Callback = {@conF,conpanel,context,conshowpanel,conrespanel};
classicapps.Callback = {@appF,apppanel};
exercise.Callback = {@exerF,exerpanel};

%conpanel��ʾ
text1 = text('Parent',context,'string','����Ⱥ�㷨�Ļ���֪ʶ','horizontalalignment','center','fontsize',20,'Units','normalized','position',[0.5 0.92]);
text2 = text('Parent',context,'string','\diamondsuit�����','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.8]);
text3 = text('Parent',context,'string',{'    1995�꣬�����������ѧ��James Kennedy�͵�����';
                                        '��ʦRussell Eberhart��ͬ���������Ⱥ�㷨��ģ���Ⱥ';
                                        '��������߸����������ʳ���ӱܲ�ʳ�ߵ���Ϊ��'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.05 0.65]);
text4 = text('Parent',context,'string','\diamondsuit�����ѧϰ��Ϊ','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.5]);
text5 = text('Parent',context,'string',{'\bullet����ѧϰ���ܽ��Լ���ʷ����';
                                        '\bullet����ѧϰ���۲��ܱ�ͬ����Ϊ';
                                        '\bulletȫ��ѧϰ����ȫ�������߿���'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.07 0.35]);
text6 = text('Parent',context,'string','\diamondsuit�򻯵ĸ���ѧϰ����','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.2]);
text7 = text('Parent',context,'string',{'\bulletÿ�����嶼���������һ�����н�';
                                        '\bullet���������Լ���ʷ���������ҵ�����ý�';
                                        '\bullet���ݸ���֮���ڽ�ս��еľ��루��ͬ�����������';
                                        '  ��ͬ�ľ��붨�壩�������и������ֳ���������';
                                        '\bullet���������и��幹�ɵ�����ȫ��'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.07 -0.01]);
text8 = text('Parent',context,'string','\diamondsuit�򻯵ĸ���ѧϰ��Ϊ','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 -0.22]);
text9 = text('Parent',context,'string',{'\bullet����ѧϰ����ͼ��С���Լ���ʷ��ý�Ľ�ս����';
                                        '\bullet����ѧϰ����ͼ��С�뵱ǰ������ý�Ľ�ս����';
                                        '\bulletȫ��ѧϰ����ͼ��С�뵱ǰȫ����ý�Ľ�ս����'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.07 -0.36]);
text10 = text('Parent',context,'string','\diamondsuit����Ⱥ�㷨�����','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 -0.5]);
text11 = text('Parent',context,'string',{'\bullet����ѧϰ��Ľ� = ���嵱ǰ�� + a��';
                                        '                               (������ʷ��ý� - ���嵱ǰ��)';
                                        '\bullet����ѧϰ��Ľ� = ���嵱ǰ�� + b��';
                                        '                               (����ǰ��ý� - ���嵱ǰ��)';
                                        '\bulletȫ��ѧϰ��Ľ� = ���嵱ǰ�� + c��';
                                        '                               (ȫ��ǰ��ý� - ���嵱ǰ��)'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.07 -0.73]);
textnew1 = text('Parent',context,'string','\diamondsuit����Ⱥ�㷨�����й�����ʾ','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 -0.95]);
textnew2 = text('Parent',context,'string',{'    ����������Ⱥ�㷨�Ķ�̬��ʾ�����к��������ÿһ';
                                        '�����ӵ�λ�ã����������ÿһ�����ӵ�ֵ����Ӧ�ȣ���';
                                        'ÿһ�����ӵ��˶�Ŀ����Ѱ��������Ӧ�����ֵ��'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.05 -1.08]);
textnew3 = text('Parent',context,'string','\diamondsuit����Ⱥ�㷨�����н������','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 -2.66]);
textnew4 = text('Parent',context,'string',{'    �����ÿһȺ��������ҵ������ֵ���ᱻ��¼������';
                                           '�����������������ҵ������ֵ���бȽϡ�ÿһ����Ⱥ';
                                           '���˶��еõ�����ʱ��仯�����ֵ������ͼ����ʽ����';
                                           '������ͬ��ɫΪ��ͬ����Ⱥ������ͼ��'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 -2.82]);

conshow = axes('Parent',conshowpanel,'Units','normalized','position',[0.1 0.45 0.8 0.47],'nextplot','add','xlim',[-25 24.9]);
x = -25:0.1:24.9;
plot(conshow,x,exp(-(x.*x)/200).*cos(x));
text12 =  uicontrol('Parent',conshowpanel,'style','text','units','normalized','string','����Ⱥ�㷨�Ļ�����ʾ','FontSize',17,'Position',[0 0.95 1 0.05]);
f2Ntext = uicontrol('Parent',conshowpanel,'style','text','units','normalized','string','��Ⱥ����','FontSize',16,'Position',[0 0.28 0.4 0.06]);
f2atext = uicontrol('Parent',conshowpanel,'style','text','units','normalized','string','����ѧϰϵ��a','FontSize',16,'Position',[0 0.22 0.4 0.06]);
f2btext = uicontrol('Parent',conshowpanel,'style','text','units','normalized','string','����ѧϰϵ��b','FontSize',16,'Position',[0 0.16 0.4 0.06]);
f2ctext = uicontrol('Parent',conshowpanel,'style','text','units','normalized','string','ȫ��ѧϰϵ��c','FontSize',16,'Position',[0 0.1 0.4 0.06]);
f2Mtext = uicontrol('Parent',conshowpanel,'style','text','units','normalized','string','����������','FontSize',16,'Position',[0 0.04 0.4 0.06]);
f2N = uicontrol('Parent',conshowpanel,'style','edit','units','normalized','string','20','FontSize',17,'Position',[0.4 0.28 0.15 0.06]);
f2a = uicontrol('Parent',conshowpanel,'style','edit','units','normalized','string','0.01','FontSize',17,'Position',[0.4 0.22 0.15 0.06]);
f2b = uicontrol('Parent',conshowpanel,'style','edit','units','normalized','string','0.01','FontSize',17,'Position',[0.4 0.16 0.15 0.06]);
f2c = uicontrol('Parent',conshowpanel,'style','edit','units','normalized','string','0.01','FontSize',17,'Position',[0.4 0.1 0.15 0.06]);
f2M = uicontrol('Parent',conshowpanel,'style','edit','units','normalized','string','200','FontSize',17,'Position',[0.4 0.04 0.15 0.06]);
f2manual = uicontrol('Parent',conshowpanel,'style','pushbutton','units','normalized','string','�ֶ�����','FontSize',15,'Position',[0.57 0.34 0.2 0.05],'backgroundcolor',[0.8 0.8 0.8]);
f2auto = uicontrol('Parent',conshowpanel,'style','pushbutton','units','normalized','string','�Զ�����','FontSize',10,'Position',[0.77 0.34 0.2 0.05],'backgroundcolor',[1 1 1]);
f2manpanel = uipanel('Parent',conshowpanel,'Units','normalized','position',[0.56 0.03 0.43 0.32],'visible','on');
f2autopanel = uipanel('Parent',conshowpanel,'Units','normalized','position',[0.56 0.03 0.43 0.32],'visible','off');
f2conti1 = uicontrol('Parent',f2manpanel,'style','pushbutton','units','normalized','string','����1��','FontSize',14,'Position',[0.02 0.75 0.45 0.2]);
f2conti5 = uicontrol('Parent',f2manpanel,'style','pushbutton','units','normalized','string','����10��','FontSize',14,'Position',[0.52 0.75 0.45 0.2]);
f2back1 = uicontrol('Parent',f2manpanel,'style','pushbutton','units','normalized','string','����ǰ1��','FontSize',12,'Position',[0.02 0.5 0.45 0.2]);
f2back5 = uicontrol('Parent',f2manpanel,'style','pushbutton','units','normalized','string','����ǰ10��','FontSize',11,'Position',[0.52 0.5 0.45 0.2]);
f2currtext = uicontrol('Parent',f2manpanel,'style','text','units','normalized','string','��ǰ����','FontSize',14,'Position',[0.02 0.26 0.45 0.16]);
f2curr = uicontrol('Parent',f2manpanel,'style','text','units','normalized','string','1','FontSize',14,'Position',[0.52 0.26 0.45 0.16],'backgroundcolor',[0.85 0.85 0.85]);
f2reset = uicontrol('Parent',f2manpanel,'style','pushbutton','units','normalized','string','��һȺ����','FontSize',14,'Position',[0.02 0.02 0.96 0.2]);
f2autoconti = uicontrol('Parent',f2autopanel,'style','pushbutton','units','normalized','string','��ʼ/����','FontSize',14,'Position',[0.2 0.75 0.6 0.2]);
f2autopause = uicontrol('Parent',f2autopanel,'style','pushbutton','units','normalized','string','��ͣ','FontSize',14,'Position',[0.2 0.5 0.6 0.2]);
f2autocurrtext = uicontrol('Parent',f2autopanel,'style','text','units','normalized','string','��ǰ����','FontSize',14,'Position',[0.02 0.26 0.45 0.16]);
f2autocurr = uicontrol('Parent',f2autopanel,'style','text','units','normalized','string','1','FontSize',14,'Position',[0.52 0.26 0.45 0.16],'backgroundcolor',[0.85 0.85 0.85]);
f2autoreset = uicontrol('Parent',f2autopanel,'style','pushbutton','units','normalized','string','��һȺ����','FontSize',14,'Position',[0.02 0.02 0.96 0.2]);

global xtotal ptotal pgtotal pntotal;
[xtotal,ptotal,pgtotal,pntotal] = function2(20,0.01,0.01,0.01,200);
a = str2double(f2curr.String);
f2swarm = plot(conshow,xtotal(a,:),exp(-(xtotal(a,:).*xtotal(a,:))/200).*cos(xtotal(a,:)),'ro');
f2pg = plot(conshow,pgtotal(a),exp(-(pgtotal(a)*pgtotal(a))/200)*cos(pgtotal(a)),'go');

conres = axes('Parent',conrespanel,'Units','normalized','position',[0.15 0.5 0.8 0.47],'nextplot','add');
xlabel(conres,'��������');
ylabel(conres,'�����Ӧֵ');
connumtext = uicontrol('Parent',conrespanel,'style','text','units','normalized','string','ʵ�����','FontSize',14,'Position',[0.2 0.35 0.3 0.05]);
connum = uicontrol('Parent',conrespanel,'style','text','units','normalized','string','0','FontSize',14,'Position',[0.2 0.3 0.3 0.05],'backgroundcolor',[0.85 0.85 0.85]);
conevtext = uicontrol('Parent',conrespanel,'style','text','units','normalized','string','ƽ�����ֵ','FontSize',14,'Position',[0.5 0.35 0.3 0.05]);
conev = uicontrol('Parent',conrespanel,'style','text','units','normalized','string','0','FontSize',14,'Position',[0.5 0.3 0.3 0.05],'backgroundcolor',[0.85 0.85 0.85]);
conthistext = uicontrol('Parent',conrespanel,'style','text','units','normalized','string','����ʵ�����ֵ','FontSize',14,'Position',[0.1 0.2 0.4 0.05],'backgroundcolor',[0.85 0.85 0.85]);
conthis = uicontrol('Parent',conrespanel,'style','text','units','normalized','string','0','FontSize',14,'Position',[0.5 0.2 0.4 0.05],'backgroundcolor',[0.85 0.85 0.85]);
conclear = uicontrol('Parent',conrespanel,'style','pushbutton','units','normalized','string','���ͳ��','FontSize',14,'Position',[0.4 0.05 0.2 0.1]);

%conpanel��ť����
f2manual.Callback = {@f2manualFun,f2manpanel,f2autopanel,f2manual,f2auto};
f2auto.Callback = {@f2autoFun,f2manpanel,f2autopanel,f2manual,f2auto};
f2conti1.Callback = {@f2conFun,f2curr,f2autocurr,f2M,f2swarm,f2pg};   %����Ϊf2����ֵ���Լ�����
f2back1.Callback = {@f2backFun,f2curr,f2autocurr,f2swarm,f2pg};
f2reset.Callback = {@f2resFun,@function2,f2swarm,f2pg,f2curr,f2autocurr,f2N,f2a,f2b,f2c,f2M,conres,connum,conev,conthis};  %�������˴������Ƚ�stringת��Ϊnum���룬�������Ÿ���
f2autoreset.Callback = {@f2resFun,@function2,f2swarm,f2pg,f2curr,f2autocurr,f2N,f2a,f2b,f2c,f2M,conres,connum,conev,conthis};
f2conti5.Callback = {@f2con10Fun,f2curr,f2autocurr,f2M,f2swarm,f2pg};
f2back5.Callback = {@f2back5Fun,f2curr,f2autocurr,f2swarm,f2pg};
f2autoconti.Callback = {@f2autoconFun,f2curr,f2autocurr,f2M,f2swarm,f2pg};
f2autopause.Callback = {@f2autopauFun};
conclear.Callback = {@conclearFun,connum,conev,conthis,conres};

%apppanel��ʾ
combentry = uicontrol('Parent',apppanel,'style','pushbutton','units','normalized','string','����Ż�Ӧ��','FontSize',17,'Position',[0 0.92 1 0.08]);
numentry = uicontrol('Parent',apppanel,'style','pushbutton','units','normalized','string','��ֵ�Ż�Ӧ��','FontSize',17,'Position',[0 0.84 1 0.08]);

%combpanel��ʾ
introbtn = uicontrol('Parent',combpanel,'style','pushbutton','units','normalized','string','���','FontSize',12,'FontWeight','bold','BackgroundColor',[0.8 0.8 0.8],'Position',[0 0.94 0.25 0.06]);
setbtn = uicontrol('Parent',combpanel,'style','pushbutton','units','normalized','string','��������','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.25 0.94 0.25 0.06]);
showbtn = uicontrol('Parent',combpanel,'style','pushbutton','units','normalized','string','����չʾ','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.5 0.94 0.25 0.06]);
resbtn = uicontrol('Parent',combpanel,'style','pushbutton','units','normalized','string','���չʾ','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.75 0.94 0.25 0.06]);
intropanel = uipanel('Parent',combpanel,'Visible','on','Units','normalized','Position',[0 0 1 0.95]);
setpanel = uipanel('Parent',combpanel,'Visible','off','Units','normalized','Position',[0 0 1 0.95]);
showpanel = uipanel('Parent',combpanel,'Visible','off','Units','normalized','Position',[0 0 1 0.95]);
respanel = uipanel('Parent',combpanel,'Visible','off','Units','normalized','Position',[0 0 1 0.95]);

%intropanel��ʾ
introtext = axes('Parent',intropanel,'Units','normalized','position',[0 0.5 1 0.5],'nextplot','add');
set(introtext,'visible','off');
introtext1 = text('Parent',introtext,'string','\diamondsuit��PSO�㷨����k��ֵ����','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.92]);
introtext2 = text('Parent',introtext,'string',{'    k��ֵ����������һ������Ż����⣬��������PSO��';
                                                '������������ʵ��������ǽ�25����ά�����Ϊ3�顣';
                                                'ÿ�����鶼��һ�����ģ����ĵ�λ�ÿ����ö�ά�ĵ��ʾ��';
                                                '����������������㿴��һ���⣬ÿһ�����ӦPSO�㷨';
                                                '�е�һ�����ӣ��������������Ⱥ�㷨�ƶ���Щ���ӣ���';
                                                'ѰĿ�꺯�������Ž⡣'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 0.6]);
introtext3 = text('Parent',introtext,'string','\diamondsuit��Ӧֵ����','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.3]);
introtext4 = text('Parent',introtext,'string',{'    ��Ӧֵ�����������������ÿһ����ά���嵽��������';
                                                '�ĵľ���ĺ;�����ŷʽ����Ŀ������㣬��ʽ���£�'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 0.15]);
intropicaxes = axes('Parent',intropanel,'Units','normalized','position',[0.2 0.45 0.6 0.1],'nextplot','add');
intropic = imread('combintro.png');
imshow(intropic,'parent',intropicaxes);
introtext5 = text('Parent',introtext,'string',{'����'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 -0.13]);
intropicaxes2 = axes('Parent',intropanel,'Units','normalized','position',[0.2 0.3 0.6 0.13],'nextplot','add');
intropic2 = imread('pic2.png');
imshow(intropic2,'parent',intropicaxes2);
introtext6 = text('Parent',introtext,'string',{'K������Ǿ���������������Ϊ3��N�������������������';
                                                '������Ϊ25��XΪ����λ�ã�CΪ�������ĵ�λ�ã�nΪÿ';
                                                '���������'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 -0.51]);
introtext7 = text('Parent',introtext,'string','\diamondsuit����','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 -0.7]);
introtext8 = text('Parent',introtext,'string',{'    �ڴ˴�ʵ���У��ɵ��Ĳ���������Ⱥ��������������';
                                                '��������ѧϰ���ӣ�ȫ��ѧϰ���ӡ�'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 -0.84]);

%setpanel��ʾ
setsstext = uicontrol('Parent',setpanel,'style','text','units','normalized','string','��Ⱥ����','FontSize',16,'Position',[0.05 0.8 0.4 0.06]);
setc1text = uicontrol('Parent',setpanel,'style','text','units','normalized','string','����ѧϰ����','FontSize',16,'Position',[0.05 0.7 0.4 0.06]);
setc2text = uicontrol('Parent',setpanel,'style','text','units','normalized','string','ȫ��ѧϰ����','FontSize',16,'Position',[0.05 0.6 0.4 0.06]);
sets1text = uicontrol('Parent',setpanel,'style','text','units','normalized','string','��������','FontSize',16,'Position',[0.05 0.5 0.4 0.06]);
setss = uicontrol('Parent',setpanel,'style','edit','units','normalized','string','5','FontSize',17,'Position',[0.6 0.8 0.3 0.06]);
setc1 = uicontrol('Parent',setpanel,'style','edit','units','normalized','string','2','FontSize',17,'Position',[0.6 0.7 0.3 0.06]);
setc2 = uicontrol('Parent',setpanel,'style','edit','units','normalized','string','2','FontSize',17,'Position',[0.6 0.6 0.3 0.06]);
sets1= uicontrol('Parent',setpanel,'style','edit','units','normalized','string','50','FontSize',17,'Position',[0.6 0.5 0.3 0.06]);
setenter = uicontrol('Parent',setpanel,'style','pushbutton','units','normalized','string','ȷ��','FontSize',17,'Position',[0.25 0.2 0.5 0.1]);

global data center gbestraw1 gbestraw2 gbestraw3 fitnessbest;
[data,center,gbestraw1,gbestraw2,gbestraw3,fitnessbest]=kmeansPSO(5,3,50,2,2);    %��Ⱥ��ģ��������������������ѧϰ����1��2

%showpanel��ʾ
combstart = uicontrol('Parent',showpanel,'style','pushbutton','units','normalized','string','��ʼ����','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0 0.94 0.166 0.06]);
combpause = uicontrol('Parent',showpanel,'style','pushbutton','units','normalized','string','��ͣ','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.166 0.94 0.166 0.06]);
combback = uicontrol('Parent',showpanel,'style','pushbutton','units','normalized','string','����һ��','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.333 0.94 0.166 0.06]);
combconti = uicontrol('Parent',showpanel,'style','pushbutton','units','normalized','string','����һ��','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.5 0.94 0.166 0.06]);
combfirst = uicontrol('Parent',showpanel,'style','pushbutton','units','normalized','string','��һ��','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.666 0.94 0.166 0.06]);
comblast = uicontrol('Parent',showpanel,'style','pushbutton','units','normalized','string','���һ��','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.833 0.94 0.166 0.06]);
combcurrtext = uicontrol('Parent',showpanel,'style','text','units','normalized','string','��ǰ����','FontSize',11,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.333 0.9 0.166 0.03]);
combcurr = uicontrol('Parent',showpanel,'style','text','units','normalized','string','1','FontSize',11,'BackgroundColor',[0.85 0.85 0.85],'Position',[0.5 0.9 0.166 0.03]);

showtext = axes('Parent',showpanel,'Units','normalized','position',[0 0.5 1 0.5]);
set(showtext,'visible','off');
showtext1 = text('Parent',showtext,'string','\diamondsuit��������λ�ú;�������λ��','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.7]);
showtext2 = text('Parent',showtext,'string','\diamondsuitxά������Ⱥ��λ��','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 -0.3]);
showtext3 = text('Parent',showtext,'string','\diamondsuityά������Ⱥ��λ��','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 -1.3]);

dotshow = axes('Parent',showpanel,'Units','normalized','position',[0.2 0.5 0.7 0.32],'nextplot','add');
xlabel(dotshow,'xά��');
ylabel(dotshow,'yά��');
plot(dotshow,data(:,1),data(:,2),'ro');
center1 = plot(dotshow,gbestraw1(1,1),gbestraw1(1,2),'bo');
center2 = plot(dotshow,gbestraw2(1,1),gbestraw2(1,2),'bo');
center3 = plot(dotshow,gbestraw3(1,1),gbestraw3(1,2),'bo');

centershowx = axes('Parent',showpanel,'Units','normalized','position',[0.2 0 0.7 0.32]);
x1 = center(1,1,:,1);
x2 = center(2,1,:,1);
x3 = center(3,1,:,1);
x1 = x1(:);
x2 = x2(:);
x3 = x3(:);
xshow = plot3(centershowx,x1,x2,x3,'mo');
grid(centershowx,'on');
xlabeltext = xlabel(centershowx,'��һ��');
ylabeltext = ylabel(centershowx,'�ڶ���');
zlabel(centershowx,'������');
set(xlabeltext,'Rotation',20);
set(ylabeltext,'Rotation',-26);

centershowy = axes('Parent',showpanel,'Units','normalized','position',[0.2 -0.5 0.7 0.32]);
y1 = center(1,2,:,1);
y2 = center(2,2,:,1);
y3 = center(3,2,:,1);
y1 = y1(:);
y2 = y2(:);
y3 = y3(:);
yshow = plot3(centershowy,y1,y2,y3,'mo');
grid(centershowy,'on');
xlabeltexty = xlabel(centershowy,'��һ��');
ylabeltexty = ylabel(centershowy,'�ڶ���');
zlabel(centershowy,'������');
set(xlabeltexty,'Rotation',20);
set(ylabeltexty,'Rotation',-26);

%respanel��ʾ
restext = axes('Parent',respanel,'Units','normalized','position',[0 0.5 1 0.5]);
set(restext,'visible','off');
restext1 = text('Parent',restext,'string','\diamondsuitÿ�ε������ֵ��λ��','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.92]);
restext2 = text('Parent',restext,'string','\diamondsuitÿ�ε��������Ӧֵ','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.03]);

resshow = axes('Parent',respanel,'Units','normalized','position',[0.15 0.58 0.75 0.35]);
g1show = plot3(resshow,gbestraw1(:,1),gbestraw1(:,2),gbestraw1(:,3),'bo');
hold(resshow,'on');
g2show = plot3(resshow,gbestraw2(:,1),gbestraw2(:,2),gbestraw2(:,3),'ro');
g3show = plot3(resshow,gbestraw3(:,1),gbestraw3(:,2),gbestraw3(:,3),'go');
grid(resshow,'on');
xlabelres = xlabel(resshow,'xά��');
ylabelres = ylabel(resshow,'yά��');
zlabel(resshow,'��������');
set(xlabelres,'Rotation',20);
set(ylabelres,'Rotation',-26);
fitbestshow = axes('Parent',respanel,'Units','normalized','position',[0.15 0.17 0.75 0.3],'nextplot','add');
xlabel(fitbestshow,'��������');
ylabel(fitbestshow,'��Ӧֵ');
fitshow = plot(fitbestshow,fitnessbest);
combclear = uicontrol('Parent',respanel,'style','pushbutton','units','normalized','string','���ͳ��','FontSize',10,'Position',[0.4 0.01 0.2 0.06]);
combstatext = uicontrol('Parent',respanel,'style','text','units','normalized','string','��ʷ��ֵ','FontSize',12,'Position',[0.2 0.08 0.3 0.03],'BackgroundColor',[0.85 0.85 0.85]);
combsta = uicontrol('Parent',respanel,'style','text','units','normalized','string',num2str(fitnessbest(str2double(sets1.String))),'FontSize',12,'Position',[0.5 0.08 0.3 0.03],'BackgroundColor',[0.85 0.85 0.85]);

%exerpanel��ʾ
exertext = axes('Parent',exerpanel,'Units','normalized','position',[0 0.5 1 0.5]);
set(exertext,'visible','off');
exertext1 = text('Parent',exertext,'string','\diamondsuit��Ŀһ','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.92]);
exertext2 = text('Parent',exertext,'string',{'    �ڸ�����뾭��Ӧ�ò����У�����㷨�ڲ�ͬ����ʱ';
                                             '���õ������ֵ��ƽ��ֵ�뷽�������ÿ������ʵ���';
                                             '����С��10�Σ�'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 0.78]);
exertext3 = text('Parent',exertext,'string','\diamondsuit��Ŀ��','horizontalalignment','left','fontsize',15,'Units','normalized','position',[0.03 0.6]);
exertext4 = text('Parent',exertext,'string',{'    ��PSO�㷨�������������������Աȣ����ҵ�PSO��';
                                             '������Ѳ����Դﵽ����Ч�ʡ�'},'horizontalalignment','left','fontsize',12,'Units','normalized','position',[0.03 0.48]);

%combpanel��ť����
introbtn.Callback = {@introFun,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel};
setbtn.Callback = {@setFun,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel};
resbtn.Callback = {@resFun,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel};

%apppanel��ť����
combentry.Callback = {@combenFun,combpanel,intropanel,setpanel,showpanel,respanel,introbtn,setbtn,showbtn,resbtn};
numentry.Callback = {@numenFun,numpanel};

%setpanel��ť����
setenter.Callback = {@combsetFun,@kmeansPSO,setss,setc1,setc2,sets1,resshow,fitbestshow,combsta};

%showpanel��ť����
showbtn.Callback = {@showFun,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel,dotshow,centershowx,centershowy,combcurr,center1,center2,center3,xshow,yshow,showtext};
combstart.Callback = {@combstartFun,combcurr,center1,center2,center3,xshow,yshow,sets1};
combpause.Callback = {@combpauseFun};
combback.Callback = {@combbackFun,combcurr,center1,center2,center3,xshow,yshow};
combconti.Callback = {@combcontiFun,combcurr,center1,center2,center3,xshow,yshow,sets1};
combfirst.Callback = {@combfirstFun,combcurr,center1,center2,center3,xshow,yshow};
comblast.Callback = {@comblastFun,combcurr,center1,center2,center3,xshow,yshow,sets1};

%respanel��ť����
combclear.Callback = {@combclearFun,fitbestshow,combsta};

%numpanel��ʾ
funtext = axes('Parent',numpanel,'Units','normalized','position',[0 0.925 1 0.075]);
set(funtext,'visible','off');
testtext = text('Parent',funtext,'string',{'��PSOѰ�����к�������Сֵ��','F = \Sigma_{i=1}^{30} x_i^2+x_i-6 (iΪά��)'},'Interpreter','tex','horizontalalignment','center','fontsize',13,'Units','normalized','position',[0.5 0.3]);
h = axes('Parent',numpanel,'Units','normalized','position',[0.1 0.5 0.8 0.4],'nextplot','add');
Ntext = uicontrol('Parent',numpanel,'style','text','units','normalized','string','��Ⱥ����','FontSize',16,'Position',[0 0.36 0.4 0.04]);
c1text = uicontrol('Parent',numpanel,'style','text','units','normalized','string','����ѧϰ����','FontSize',16,'Position',[0 0.32 0.4 0.04]);
c2text = uicontrol('Parent',numpanel,'style','text','units','normalized','string','ȫ��ѧϰ����','FontSize',16,'Position',[0 0.28 0.4 0.04]);
wtext = uicontrol('Parent',numpanel,'style','text','units','normalized','string','��������','FontSize',16,'Position',[0 0.24 0.4 0.04]);
Mtext = uicontrol('Parent',numpanel,'style','text','units','normalized','string','��������','FontSize',16,'Position',[0 0.20 0.4 0.04]);
N = uicontrol('Parent',numpanel,'style','edit','units','normalized','string','50','FontSize',17,'Position',[0.4 0.36 0.15 0.04]);
c1 = uicontrol('Parent',numpanel,'style','edit','units','normalized','string','1.5','FontSize',17,'Position',[0.4 0.32 0.15 0.04]);
c2 = uicontrol('Parent',numpanel,'style','edit','units','normalized','string','2.5','FontSize',17,'Position',[0.4 0.28 0.15 0.04]);
w = uicontrol('Parent',numpanel,'style','edit','units','normalized','string','0.5','FontSize',17,'Position',[0.4 0.24 0.15 0.04]);
M = uicontrol('Parent',numpanel,'style','edit','units','normalized','string','300','FontSize',17,'Position',[0.4 0.20 0.15 0.04]);
enter = uicontrol('Parent',numpanel,'style','pushbutton','units','normalized','string','ȷ��','FontSize',17,'Position',[0.7 0.32 0.2 0.04]);
clearbutton = uicontrol('Parent',numpanel,'style','pushbutton','units','normalized','string','���','FontSize',17,'Position',[0.7 0.24 0.2 0.04]);
numtext1 = uicontrol('Parent',numpanel,'style','text','units','normalized','string','��Сֵ','FontSize',12,'Position',[0.2 0.42 0.3 0.03],'BackgroundColor',[0.85 0.85 0.85]);
numtext2 = uicontrol('Parent',numpanel,'style','text','units','normalized','string','0','FontSize',12,'Position',[0.5 0.42 0.3 0.03],'BackgroundColor',[0.85 0.85 0.85]);

%numpanel��ť����
enter.Callback = {@enterFun,N,c1,c2,w,M,h,numtext2};
clearbutton.Callback = {@clearFun,h,numtext2};

%������ť
function backF(~,~)
    global cpanel selfp parent parentpanel;
    set(selfp(cpanel),'Visible','off');
    set(parent(cpanel),'Visible','on');
    cpanel = parentpanel(cpanel);
end

function homeF(~,~)
    global cpanel selfp parent;
    set(selfp(cpanel),'Visible','off');
    set(parent(1),'Visible','on');
    cpanel = 1;
end

%���ⰴť
function conF(h,~,nextpanel,context,conshow,conrespanel)
    global cpanel;
    set(h.Parent,'Visible','off');
    set(nextpanel,'Visible','on');
    cpanel = 2; %��ǰΪconpanel
    set(context,'units','normalized','Position',[0 0.5 1 0.5]);
    set(conshow,'units','normalized','Position',[0 -0.8 1 0.7]);
    set(conrespanel,'units','normalized','Position',[0 -1.68 1 0.7]);
    set(gcf,'WindowScrollWheelFcn',{@conwheel,context,conshow,conrespanel});
end

function conwheel(~,event,context,conshow,conrespanel)
    a = context.Position(2);
    if event.VerticalScrollCount > 0
        a = a + 0.1;
    elseif event.VerticalScrollCount < 0 && a > 0.5
        a = a - 0.1;
    end
    set(context,'units','normalized','Position',[0 a 1 0.5]);
    set(conshow,'units','normalized','Position',[0 a-1.3 1 0.7]);
    set(conrespanel,'units','normalized','Position',[0 a-2.18 1 0.7]);
end

function conclearFun(~,~,connum,conev,conthis,conres)
    cla(conres);
    connum.String = '0';
    conev.String = '0';
    conthis.String = '0';
end

function appF(h,~,nextpanel)
    global cpanel;
    set(h.Parent,'Visible','off');
    set(nextpanel,'Visible','on');
    cpanel = 3; %��ǰΪapppanel
end

function combenFun(h,~,combpanel,intropanel,setpanel,showpanel,respanel,introbtn,setbtn,showbtn,resbtn)
    global cpanel;
    set(h.Parent,'Visible','off');
    set(combpanel,'Visible','on');
    set(intropanel,'Visible','on');
    set(setpanel,'Visible','off');
    set(showpanel,'Visible','off');
    set(respanel,'Visible','off');
    set(introbtn,'FontSize',12,'FontWeight','bold','BackgroundColor',[0.8 0.8 0.8]);
    set(setbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(showbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(resbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    cpanel = 5; %��ǰΪapppanel
end

function combsetFun(~,~,kmeansPSO,setss,setc1,setc2,sets1,resshow,fitbestshow,combsta)
    global data center gbestraw1 gbestraw2 gbestraw3 fitnessbest;
    [data,center,gbestraw1,gbestraw2,gbestraw3,fitnessbest]=kmeansPSO(str2double(setss.String),3,str2double(sets1.String),str2double(setc1.String),str2double(setc2.String));    %��Ⱥ��ģ��������������������ѧϰ����1��2
    hold(resshow,'off');
    plot3(resshow,gbestraw1(:,1),gbestraw1(:,2),gbestraw1(:,3),'bo');
    hold(resshow,'on');
    plot3(resshow,gbestraw2(:,1),gbestraw2(:,2),gbestraw2(:,3),'ro');
    plot3(resshow,gbestraw3(:,1),gbestraw3(:,2),gbestraw3(:,3),'go');
    grid(resshow,'on');
    plot(fitbestshow,fitnessbest);
    xlabelres = xlabel(resshow,'xά��');
    ylabelres = ylabel(resshow,'yά��');
    zlabel(resshow,'��������');
    set(xlabelres,'Rotation',20);
    set(ylabelres,'Rotation',-26);
    a = str2double(combsta.String);
    if a
        a = (a+fitnessbest(str2double(sets1.String)))/2;
    else
        a = fitnessbest(str2double(sets1.String));
    end
    combsta.String = num2str(a);
end

function combstartFun(~,~,combcurr,center1,center2,center3,xshow,yshow,sets1)
    global center gbestraw1 gbestraw2 gbestraw3 combpauseflag;
    combpauseflag = 0;
    a = str2double(combcurr.String);      %����������String��д
    while a<str2double(sets1.String)
        if combpauseflag
            break;
        else
            a = a+1;
            combcurr.String = num2str(a);
            set(center1,'XData',gbestraw1(a,1),'YData',gbestraw1(a,2));
            set(center2,'XData',gbestraw2(a,1),'YData',gbestraw2(a,2));
            set(center3,'XData',gbestraw3(a,1),'YData',gbestraw3(a,2));
            x1 = center(1,1,:,a);
            x2 = center(2,1,:,a);
            x3 = center(3,1,:,a);
            x1 = x1(:);
            x2 = x2(:);
            x3 = x3(:);
            set(xshow,'XData',x1,'YData',x2,'ZData',x3);
            y1 = center(1,2,:,a);
            y2 = center(2,2,:,a);
            y3 = center(3,2,:,a);
            y1 = y1(:);
            y2 = y2(:);
            y3 = y3(:);
            set(yshow,'XData',y1,'YData',y2,'ZData',y3);
            pause(0.05);
        end
    end
end

function combpauseFun(~,~)
    global combpauseflag;
    combpauseflag = 1;
end

function combbackFun(~,~,combcurr,center1,center2,center3,xshow,yshow)
    global center gbestraw1 gbestraw2 gbestraw3;
    a = str2double(combcurr.String);      %����������String��д
    if a>1
        a = a-1;
        combcurr.String = num2str(a);
        set(center1,'XData',gbestraw1(a,1),'YData',gbestraw1(a,2));
        set(center2,'XData',gbestraw2(a,1),'YData',gbestraw2(a,2));
        set(center3,'XData',gbestraw3(a,1),'YData',gbestraw3(a,2));
        x1 = center(1,1,:,a);
        x2 = center(2,1,:,a);
        x3 = center(3,1,:,a);
        x1 = x1(:);
        x2 = x2(:);
        x3 = x3(:);
        set(xshow,'XData',x1,'YData',x2,'ZData',x3);
        y1 = center(1,2,:,a);
        y2 = center(2,2,:,a);
        y3 = center(3,2,:,a);
        y1 = y1(:);
        y2 = y2(:);
        y3 = y3(:);
        set(yshow,'XData',y1,'YData',y2,'ZData',y3);
    end
end

function combcontiFun(~,~,combcurr,center1,center2,center3,xshow,yshow,sets1)
    global center gbestraw1 gbestraw2 gbestraw3;
    a = str2double(combcurr.String);      %����������String��д
    if a<str2double(sets1.String)
        a = a+1;
        combcurr.String = num2str(a);
        set(center1,'XData',gbestraw1(a,1),'YData',gbestraw1(a,2));
        set(center2,'XData',gbestraw2(a,1),'YData',gbestraw2(a,2));
        set(center3,'XData',gbestraw3(a,1),'YData',gbestraw3(a,2));
        x1 = center(1,1,:,a);
        x2 = center(2,1,:,a);
        x3 = center(3,1,:,a);
        x1 = x1(:);
        x2 = x2(:);
        x3 = x3(:);
        set(xshow,'XData',x1,'YData',x2,'ZData',x3);
        y1 = center(1,2,:,a);
        y2 = center(2,2,:,a);
        y3 = center(3,2,:,a);
        y1 = y1(:);
        y2 = y2(:);
        y3 = y3(:);
        set(yshow,'XData',y1,'YData',y2,'ZData',y3);
    end
end

function combfirstFun(~,~,combcurr,center1,center2,center3,xshow,yshow)
    global center gbestraw1 gbestraw2 gbestraw3;
    a = 1;
    combcurr.String = num2str(a);
    set(center1,'XData',gbestraw1(a,1),'YData',gbestraw1(a,2));
    set(center2,'XData',gbestraw2(a,1),'YData',gbestraw2(a,2));
    set(center3,'XData',gbestraw3(a,1),'YData',gbestraw3(a,2));
    x1 = center(1,1,:,a);
    x2 = center(2,1,:,a);
    x3 = center(3,1,:,a);
    x1 = x1(:);
    x2 = x2(:);
    x3 = x3(:);
    set(xshow,'XData',x1,'YData',x2,'ZData',x3);
    y1 = center(1,2,:,a);
    y2 = center(2,2,:,a);
    y3 = center(3,2,:,a);
    y1 = y1(:);
    y2 = y2(:);
    y3 = y3(:);
    set(yshow,'XData',y1,'YData',y2,'ZData',y3);
end

function comblastFun(~,~,combcurr,center1,center2,center3,xshow,yshow,sets1)
    global center gbestraw1 gbestraw2 gbestraw3;
    a = str2double(sets1.String);
    combcurr.String = num2str(a);
    set(center1,'XData',gbestraw1(a,1),'YData',gbestraw1(a,2));
    set(center2,'XData',gbestraw2(a,1),'YData',gbestraw2(a,2));
    set(center3,'XData',gbestraw3(a,1),'YData',gbestraw3(a,2));
    x1 = center(1,1,:,a);
    x2 = center(2,1,:,a);
    x3 = center(3,1,:,a);
    x1 = x1(:);
    x2 = x2(:);
    x3 = x3(:);
    set(xshow,'XData',x1,'YData',x2,'ZData',x3);
    y1 = center(1,2,:,a);
    y2 = center(2,2,:,a);
    y3 = center(3,2,:,a);
    y1 = y1(:);
    y2 = y2(:);
    y3 = y3(:);
    set(yshow,'XData',y1,'YData',y2,'ZData',y3);
end

function numenFun(h,~,numpanel)
    global cpanel;
    set(h.Parent,'Visible','off');
    set(numpanel,'Visible','on');
    cpanel = 6; %��ǰΪapppanel
end

function introFun(~,~,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel)
    set(introbtn,'FontSize',12,'FontWeight','bold','BackgroundColor',[0.8 0.8 0.8]);
    set(setbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(showbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(resbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(intropanel,'Visible','on');
    set(setpanel,'Visible','off');
    set(showpanel,'Visible','off');
    set(respanel,'Visible','off');
end

function setFun(~,~,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel)
    set(introbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(setbtn,'FontSize',12,'FontWeight','bold','BackgroundColor',[0.8 0.8 0.8]);
    set(showbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(resbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(intropanel,'Visible','off');
    set(setpanel,'Visible','on');
    set(showpanel,'Visible','off');
    set(respanel,'Visible','off');
end

function showFun(~,~,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel,dotshow,centershowx,centershowy,combcurr,center1,center2,center3,xshow,yshow,showtext)
    set(introbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(setbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(showbtn,'FontSize',12,'FontWeight','bold','BackgroundColor',[0.8 0.8 0.8]);
    set(resbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(intropanel,'Visible','off');
    set(setpanel,'Visible','off');
    set(showpanel,'Visible','on');
    set(respanel,'Visible','off');
    set(showtext,'units','normalized','Position',[0 0.5 1 0.5]);
    set(dotshow,'units','normalized','Position',[0.2 0.5 0.7 0.32]);
    set(centershowx,'units','normalized','Position',[0.2 0 0.7 0.32]);
    set(centershowy,'units','normalized','Position',[0.2 -0.5 0.7 0.32]);
    set(gcf,'WindowScrollWheelFcn',{@combshowwheel,dotshow,centershowx,centershowy,showtext});
    global center gbestraw1 gbestraw2 gbestraw3;
    a = 1;
    combcurr.String = num2str(a);
    set(center1,'XData',gbestraw1(a,1),'YData',gbestraw1(a,2));
    set(center2,'XData',gbestraw2(a,1),'YData',gbestraw2(a,2));
    set(center3,'XData',gbestraw3(a,1),'YData',gbestraw3(a,2));
    x1 = center(1,1,:,a);
    x2 = center(2,1,:,a);
    x3 = center(3,1,:,a);
    x1 = x1(:);
    x2 = x2(:);
    x3 = x3(:);
    set(xshow,'XData',x1,'YData',x2,'ZData',x3);
    y1 = center(1,2,:,a);
    y2 = center(2,2,:,a);
    y3 = center(3,2,:,a);
    y1 = y1(:);
    y2 = y2(:);
    y3 = y3(:);
    set(yshow,'XData',y1,'YData',y2,'ZData',y3);
end

function combshowwheel(~,event,dotshow,centershowx,centershowy,showtext)
    a = dotshow.Position(2);
    if event.VerticalScrollCount > 0
        a = a + 0.05;
    elseif event.VerticalScrollCount < 0 && a > 0.5
        a = a - 0.05;
    end
    set(showtext,'units','normalized','Position',[0 a 1 0.5]);
    set(dotshow,'units','normalized','Position',[0.2 a 0.7 0.32]);
    set(centershowx,'units','normalized','Position',[0.2 a-0.5 0.7 0.32]);
    set(centershowy,'units','normalized','Position',[0.2 a-1 0.7 0.32]);
end

function resFun(~,~,introbtn,setbtn,showbtn,resbtn,intropanel,setpanel,showpanel,respanel)
    set(introbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(setbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(showbtn,'FontSize',10,'FontWeight','normal','BackgroundColor',[0.85 0.85 0.85]);
    set(resbtn,'FontSize',12,'FontWeight','bold','BackgroundColor',[0.8 0.8 0.8]);
    set(intropanel,'Visible','off');
    set(setpanel,'Visible','off');
    set(showpanel,'Visible','off');
    set(respanel,'Visible','on');
end

function combclearFun(~,~,fitbestshow,combsta)
    cla(fitbestshow);
    combsta.String = '0';
end

function exerF(h,~,nextpanel)
    global cpanel;
    set(h.Parent,'Visible','off');
    set(nextpanel,'Visible','on');
    cpanel = 4; %��ǰΪexerpanel
end

function enterFun(~,~,N,c1,c2,w,M,h,numtext2)
    [~,~,Pbest] = function1(str2double(N.String),str2double(c1.String),str2double(c2.String),str2double(w.String),str2double(M.String));
    plot(h,Pbest);
    numtext2.String = num2str(Pbest(str2double(M.String)));
end

function clearFun(~,~,h,numtext2)
    cla(h);
    numtext2.String = '0';
end

function f2manualFun(~,~,f2manpanel,f2autopanel,f2manual,f2auto)
    set(f2manpanel,'visible','on');
    set(f2manual,'backgroundcolor',[0.8 0.8 0.8],'FontSize',15);
    set(f2autopanel,'visible','off');
    set(f2auto,'backgroundcolor',[1 1 1],'FontSize',10);
    global pauseflag;
    pauseflag = 1;
end

function f2autoFun(~,~,f2manpanel,f2autopanel,f2manual,f2auto)
    set(f2manpanel,'visible','off');
    set(f2manual,'backgroundcolor',[1 1 1],'FontSize',10);
    set(f2autopanel,'visible','on');
    set(f2auto,'backgroundcolor',[0.8 0.8 0.8],'FontSize',15);
end

function f2conFun(~,~,f2curr,f2autocurr,f2M,f2swarm,f2pg)     %��������ǰ����������
    global xtotal pgtotal;
    a = str2double(f2curr.String);      %����������String��д
    if a<str2double(f2M.String)
        a = a+1;
        f2curr.String = num2str(a);
        f2autocurr.String = num2str(a);
        set(f2swarm,'XData',xtotal(a,:),'YData',exp(-(xtotal(a,:).*xtotal(a,:))/200).*cos(xtotal(a,:)));
        set(f2pg,'XData',pgtotal(a),'YData',exp(-(pgtotal(a)*pgtotal(a))/200)*cos(pgtotal(a)));
    end
end

function f2con10Fun(~,~,f2curr,f2autocurr,f2M,f2swarm,f2pg)
    global xtotal pgtotal;
    a = str2double(f2curr.String);
    if a<str2double(f2M.String)
        if a>str2double(f2M.String)-10
            a = str2double(f2M.String);
        else
            a = a+10;
        end
        f2curr.String = num2str(a);
        f2autocurr.String = num2str(a);
        set(f2swarm,'XData',xtotal(a,:),'YData',exp(-(xtotal(a,:).*xtotal(a,:))/200).*cos(xtotal(a,:)));
        set(f2pg,'XData',pgtotal(a),'YData',exp(-(pgtotal(a)*pgtotal(a))/200)*cos(pgtotal(a)));
    end
end

function f2backFun(~,~,f2curr,f2autocurr,f2swarm,f2pg)
    global xtotal pgtotal ;
    a = str2double(f2curr.String);
    if a>1
        a = a-1;
        f2curr.String = num2str(a);
        f2autocurr.String = num2str(a);
        set(f2swarm,'XData',xtotal(a,:),'YData',exp(-(xtotal(a,:).*xtotal(a,:))/200).*cos(xtotal(a,:)));
        set(f2pg,'XData',pgtotal(a),'YData',exp(-(pgtotal(a)*pgtotal(a))/200)*cos(pgtotal(a)));
    end
end

function f2back5Fun(~,~,f2curr,f2autocurr,f2swarm,f2pg)
    global xtotal pgtotal ;
    a = str2double(f2curr.String);
    if a>1
        if a>10
            a = a-10;
        else
            a = 1;
        end
        f2curr.String = num2str(a);
        f2autocurr.String = num2str(a);
        set(f2swarm,'XData',xtotal(a,:),'YData',exp(-(xtotal(a,:).*xtotal(a,:))/200).*cos(xtotal(a,:)));
        set(f2pg,'XData',pgtotal(a),'YData',exp(-(pgtotal(a)*pgtotal(a))/200)*cos(pgtotal(a)));
    end
end

function f2resFun(~,~,function2,f2swarm,f2pg,f2curr,f2autocurr,f2n,f2a,f2b,f2c,f2m,conres,connum,conev,conthis)
    global xtotal ptotal pgtotal pntotal pauseflag;
    pauseflag = 1;
    [xtotal,ptotal,pgtotal,pntotal] = function2(str2double(f2n.String),str2double(f2a.String),str2double(f2b.String),str2double(f2c.String),str2double(f2m.String));
    f2curr.String = '1';
    f2autocurr.String = '1';
    set(f2swarm,'XData',xtotal(1,:),'YData',exp(-(xtotal(1,:).*xtotal(1,:))/200).*cos(xtotal(1,:)));
    set(f2pg,'XData',pgtotal(1),'YData',exp(-(pgtotal(1)*pgtotal(1))/200)*cos(pgtotal(1)));
    plot(conres,exp(-(pgtotal.*pgtotal)/200).*cos(pgtotal));
    a = str2double(connum.String);
    a = a+1;
    connum.String = (num2str(a));
    b = str2double(conev.String);
    pglast = exp(-(pgtotal(str2double(f2m.String))*pgtotal(str2double(f2m.String)))/200)*cos(pgtotal(str2double(f2m.String)));
    b = ((a-1)*b+pglast)/a;
    conev.String = (num2str(b));
    conthis.String = num2str(pglast);
end

function f2autoconFun(~,~,f2curr,f2autocurr,f2M,f2swarm,f2pg)
    n = str2double(f2M.String);
    global xtotal pgtotal pauseflag;
    pauseflag = 0;
    a = str2double(f2curr.String);
    while a<n
        if pauseflag
            break;
        else
            a = a+1;
            f2curr.String = num2str(a);
            f2autocurr.String = num2str(a);
            set(f2swarm,'XData',xtotal(a,:),'YData',exp(-(xtotal(a,:).*xtotal(a,:))/200).*cos(xtotal(a,:)));
            set(f2pg,'XData',pgtotal(a),'YData',exp(-(pgtotal(a)*pgtotal(a))/200)*cos(pgtotal(a)));
            pause(0.05);
        end
    end
end

function f2autopauFun(~,~)
    global pauseflag;
    pauseflag = 1;
end