%%

%json2data=loadjson('sub-pd11_ses-off_task-rest_beh.json');
clc;
clear;
close all;
str ='D:\Project\paper4\0_raw_data';
name = foreachDir(str);

meds=[];Becks=[];UPDRSs=[]; 
for i=2:16  %hc(缺少第一个)
a=name{1, i}{1, 1}{1, 1}{1, 1};
json2data=loadjson(a);
med = cat(1,json2data.meds);meds=[meds;med];
Beck = cat(1,json2data.questionairres.Beck);Becks=[Becks;Beck];
UPDRS = cat(1,json2data.questionairres.UPDRS);UPDRSs=[UPDRSs;UPDRS];
end
%%
clc;
clear;
close all;
str ='D:\Project\paper4\0_raw_data';
name = foreachDir(str);

Becks=[]; Bradykinesias=[];  HYs=[];  LeftUPDRSs=[];  RestTremors=[];  RightUPDRSs=[];  Rigiditys=[];  TotalUPDRSs=[];  UPDRS1826s=[]; 
for i=18:46  %pd(缺少第一个)
a=name{1, i}{1, 1}{1, 1}{1, 1};
json2data=loadjson(a);

Beck = cat(1,json2data.questionairres.Beck);Becks=[Becks;Beck];
Bradykinesia = cat(1,json2data.questionairres.Brady_0x20_kinesia_0x20_UPDRS);Bradykinesias=[Bradykinesias;Bradykinesia];
HY = cat(1,json2data.questionairres.H_0x26_Y);HYs=[HYs;HY];
LeftUPDRS = cat(1,json2data.questionairres.Left_0x20_UPDRS);LeftUPDRSs=[LeftUPDRSs;LeftUPDRS];
RestTremor = cat(1,json2data.questionairres.Rest_0x20_Tremor_0x20_UPDRS);RestTremors=[RestTremors;RestTremor];
RightUPDRS = cat(1,json2data.questionairres.Right_0x20_UPDRS);RightUPDRSs=[RightUPDRSs;RightUPDRS];
Rigidity = cat(1,json2data.questionairres.Rigidity_0x20_UPDRS);Rigiditys=[Rigiditys;Rigidity];
TotalUPDRS = cat(1,json2data.questionairres.Total_0x20_UPDRS);TotalUPDRSs=[TotalUPDRSs;TotalUPDRS];
UPDRS1826 =cat(1,json2data.questionairres.UPDRS_0x20_18_0x2D_26);UPDRS1826s=[UPDRS1826s;UPDRS1826]

clear Beck Bradykinesia HY LeftUPDRS RestTremor RightUPDRS Rigidity TotalUPDRS UPDRS1826
end
