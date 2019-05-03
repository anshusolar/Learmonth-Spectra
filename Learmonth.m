%%%%%%%%%%%%%%%%%%%%

%% By CRAZY SOUL%%%%

%%%%%%%%%%%%%%%%%%%

%% Download data ftp://ftp-out.sws.bom.gov.au/wdc/wdc_spec/data/learmonth/raw/

clear all;
clc;
close all;
fclose all;

[file,path,indx] = uigetfile('*.srs');
%uiimport(file);
fid=fopen(file);
data=fread(fid);

data2=reshape(data,[826 length(data)/826]);

%% 826 size of each spectra : 24 header + 401 (25-75 MHz) + 401 (75-180 MHz)

%fr=linspace(25,75-50/401,401);
fr1=linspace(25,75,401);
fr2=linspace(75,180,401);
fr=horzcat(fr1,fr2);

t=linspace(1,length(data2),length(data2));
time=data2(4,:)+data2(5,:)/60+data2(6,:)/3600;

imagesc(time(1723:end),fr,data2(25:end,1723:end));
set(gca,'YDir','Normal')
xlabel('Time (UT (hh))','FontSize',14)
ylabel('Frequency (MHz)','FontSize',14)
saveas(gcf,strcat(file,'.png'))
saveas(gcf,[file '.fig'])
