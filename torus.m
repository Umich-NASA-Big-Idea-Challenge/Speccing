%% Initialize the solver
clear all;
clc;
close all;

tic
% create an instance of the solver class
ori=OrigamiSolver;



% define the Geometry
ori.node0=[3.00 0.00 0.00;
      2.30 1.93 0.00;
      0.52 2.95 0.00;
      -1.50 2.60 0.00;
      -2.82 1.03 0.00;
      -2.82 -1.03 0.00;
      -1.50 -2.60 0.00;
      0.52 -2.95 0.00;
      2.30 -1.93 0.00;
      3.00 -0.00 0.00;
      2.77 0.00 0.64;
      2.12 1.78 0.64;
      0.48 2.72 0.64;
      -1.38 2.40 0.64;
      -2.60 0.95 0.64;
      -2.60 -0.95 0.64;
      -1.38 -2.40 0.64;
      0.48 -2.72 0.64;
      2.12 -1.78 0.64;
      2.77 -0.00 0.64;
      2.17 0.00 0.98;
      1.67 1.40 0.98;
      0.38 2.14 0.98;
      -1.09 1.88 0.98;
      -2.04 0.74 0.98;
      -2.04 -0.74 0.98;
      -1.09 -1.88 0.98;
      0.38 -2.14 0.98;
      1.67 -1.40 0.98;
      2.17 -0.00 0.98;
      1.50 0.00 0.87;
      1.15 0.96 0.87;
      0.26 1.48 0.87;
      -0.75 1.30 0.87;
      -1.41 0.51 0.87;
      -1.41 -0.51 0.87;
      -0.75 -1.30 0.87;
      0.26 -1.48 0.87;
      1.15 -0.96 0.87;
      1.50 -0.00 0.87;
      1.06 0.00 0.34;
      0.81 0.68 0.34;
      0.18 1.04 0.34;
      -0.53 0.92 0.34;
      -1.00 0.36 0.34;
      -1.00 -0.36 0.34;
      -0.53 -0.92 0.34;
      0.18 -1.04 0.34;
      0.81 -0.68 0.34;
      1.06 -0.00 0.34;
      1.06 0.00 -0.34;
      0.81 0.68 -0.34;
      0.18 1.04 -0.34;
      -0.53 0.92 -0.34;
      -1.00 0.36 -0.34;
      -1.00 -0.36 -0.34;
      -0.53 -0.92 -0.34;
      0.18 -1.04 -0.34;
      0.81 -0.68 -0.34;
      1.06 -0.00 -0.34;
      1.50 0.00 -0.87;
      1.15 0.96 -0.87;
      0.26 1.48 -0.87;
      -0.75 1.30 -0.87;
      -1.41 0.51 -0.87;
      -1.41 -0.51 -0.87;
      -0.75 -1.30 -0.87;
      0.26 -1.48 -0.87;
      1.15 -0.96 -0.87;
      1.50 -0.00 -0.87;
      2.17 0.00 -0.98;
      1.67 1.40 -0.98;
      0.38 2.14 -0.98;
      -1.09 1.88 -0.98;
      -2.04 0.74 -0.98;
      -2.04 -0.74 -0.98;
      -1.09 -1.88 -0.98;
      0.38 -2.14 -0.98;
      1.67 -1.40 -0.98;
      2.17 -0.00 -0.98;
      2.77 0.00 -0.64;
      2.12 1.78 -0.64;
      0.48 2.72 -0.64;
      -1.38 2.40 -0.64;
      -2.60 0.95 -0.64;
      -2.60 -0.95 -0.64;
      -1.38 -2.40 -0.64;
      0.48 -2.72 -0.64;
      2.12 -1.78 -0.64;
      2.77 -0.00 -0.64;
      3.00 0.00 -0.00;
      2.30 1.93 -0.00;
      0.52 2.95 -0.00;
      -1.50 2.60 -0.00;
      -2.82 1.03 -0.00;
      -2.82 -1.03 -0.00;
      -1.50 -2.60 -0.00;
      0.52 -2.95 -0.00;
      2.30 -1.93 -0.00;
      3.00 -0.00 -0.00;];

ori.panel0{1}=[16 15  6];
ori.panel0{2}=[ 6 15  5];
ori.panel0{3}=[ 1  2 11];
ori.panel0{4}=[11  2 12];
ori.panel0{5}=[22 31 21];
ori.panel0{6}=[32 31 22];
ori.panel0{7}=[22 11 12];
ori.panel0{8}=[21 11 22];
ori.panel0{9}=[41 31 42];
ori.panel0{10}=[42 31 32];
ori.panel0{11}=[42 51 41];
ori.panel0{12}=[52 51 42];
ori.panel0{13}=[61 51 62];
ori.panel0{14}=[62 51 52];
ori.panel0{15}=[ 5 15  4];
ori.panel0{16}=[15 14  4];
ori.panel0{17}=[13 22 12];
ori.panel0{18}=[23 22 13];
ori.panel0{19}=[12  2 13];
ori.panel0{20}=[13  2  3];
ori.panel0{21}=[13  4 14];
ori.panel0{22}=[ 3  4 13];
ori.panel0{23}=[17 28 27];
ori.panel0{24}=[18 28 17];
ori.panel0{25}=[16  6 17];
ori.panel0{26}=[ 6  7 17];
ori.panel0{27}=[17  7  8];
ori.panel0{28}=[17  8 18];
ori.panel0{29}=[67 78 77];
ori.panel0{30}=[68 78 67];
ori.panel0{31}=[26 17 27];
ori.panel0{32}=[16 17 26];
ori.panel0{33}=[48 47 37];
ori.panel0{34}=[38 48 37];
ori.panel0{35}=[37 28 38];
ori.panel0{36}=[27 28 37];
ori.panel0{37}=[37 47 46];
ori.panel0{38}=[46 36 37];
ori.panel0{39}=[37 26 27];
ori.panel0{40}=[36 26 37];
ori.panel0{41}=[32 22 33];
ori.panel0{42}=[33 22 23];
ori.panel0{43}=[23 13 24];
ori.panel0{44}=[24 13 14];
ori.panel0{45}=[24 33 23];
ori.panel0{46}=[34 33 24];
ori.panel0{47}=[35 36 46];
ori.panel0{48}=[46 45 35];
ori.panel0{49}=[95 85 96];
ori.panel0{50}=[85 86 96];
ori.panel0{51}=[96 87 97];
ori.panel0{52}=[86 87 96];
ori.panel0{53}=[76 65 66];
ori.panel0{54}=[75 65 76];
ori.panel0{55}=[76 67 77];
ori.panel0{56}=[66 67 76];
ori.panel0{57}=[76 86 85];
ori.panel0{58}=[76 85 75];
ori.panel0{59}=[76 87 86];
ori.panel0{60}=[77 87 76];
ori.panel0{61}=[75 85 84];
ori.panel0{62}=[84 74 75];
ori.panel0{63}=[83 73 84];
ori.panel0{64}=[84 73 74];
ori.panel0{65}=[95 94 84];
ori.panel0{66}=[84 85 95];
ori.panel0{67}=[84 94 93];
ori.panel0{68}=[84 93 83];
ori.panel0{69}=[74 73 64];
ori.panel0{70}=[64 73 63];
ori.panel0{71}=[64 65 75];
ori.panel0{72}=[75 74 64];
ori.panel0{73}=[55 45 46];
ori.panel0{74}=[46 56 55];
ori.panel0{75}=[66 65 55];
ori.panel0{76}=[55 56 66];
ori.panel0{77}=[ 8  9 19];
ori.panel0{78}=[18  8 19];
ori.panel0{79}=[10 20 19];
ori.panel0{80}=[19  9 10];
ori.panel0{81}=[29 28 18];
ori.panel0{82}=[18 19 29];
ori.panel0{83}=[20 30 29];
ori.panel0{84}=[29 19 20];
ori.panel0{85}=[59 50 60];
ori.panel0{86}=[49 50 59];
ori.panel0{87}=[48 49 59];
ori.panel0{88}=[59 58 48];
ori.panel0{89}=[66 56 57];
ori.panel0{90}=[57 67 66];
ori.panel0{91}=[46 47 57];
ori.panel0{92}=[57 56 46];
ori.panel0{93}=[68 67 57];
ori.panel0{94}=[57 58 68];
ori.panel0{95}=[57 47 48];
ori.panel0{96}=[48 58 57];
ori.panel0{97}=[25 14 15];
ori.panel0{98}=[25 24 14];
ori.panel0{99}=[25 15 16];
ori.panel0{100}=[16 26 25];
ori.panel0{101}=[34 24 25];
ori.panel0{102}=[25 35 34];
ori.panel0{103}=[25 26 36];
ori.panel0{104}=[36 35 25];
ori.panel0{105}=[93 92 82];
ori.panel0{106}=[83 93 82];
ori.panel0{107}=[82 92 91];
ori.panel0{108}=[91 81 82];
ori.panel0{109}=[80 90 89];
ori.panel0{110}=[79 80 89];
ori.panel0{111}=[ 89  90 100];
ori.panel0{112}=[100  99  89];
ori.panel0{113}=[34 35 44];
ori.panel0{114}=[44 35 45];
ori.panel0{115}=[40 50 39];
ori.panel0{116}=[39 50 49];
ori.panel0{117}=[39 48 38];
ori.panel0{118}=[39 49 48];
ori.panel0{119}=[39 30 40];
ori.panel0{120}=[39 29 30];
ori.panel0{121}=[38 28 39];
ori.panel0{122}=[28 29 39];
ori.panel0{123}=[69 70 80];
ori.panel0{124}=[69 80 79];
ori.panel0{125}=[69 78 68];
ori.panel0{126}=[79 78 69];
ori.panel0{127}=[60 70 69];
ori.panel0{128}=[69 59 60];
ori.panel0{129}=[68 58 69];
ori.panel0{130}=[58 59 69];
ori.panel0{131}=[63 73 72];
ori.panel0{132}=[72 62 63];
ori.panel0{133}=[72 71 61];
ori.panel0{134}=[61 62 72];
ori.panel0{135}=[72 73 83];
ori.panel0{136}=[83 82 72];
ori.panel0{137}=[72 81 71];
ori.panel0{138}=[72 82 81];
ori.panel0{139}=[77 78 88];
ori.panel0{140}=[88 87 77];
ori.panel0{141}=[88 98 97];
ori.panel0{142}=[97 87 88];
ori.panel0{143}=[79 89 88];
ori.panel0{144}=[88 78 79];
ori.panel0{145}=[88 99 98];
ori.panel0{146}=[88 89 99];
ori.panel0{147}=[53 62 52];
ori.panel0{148}=[63 62 53];
ori.panel0{149}=[45 55 54];
ori.panel0{150}=[54 44 45];
ori.panel0{151}=[65 64 54];
ori.panel0{152}=[54 55 65];
ori.panel0{153}=[54 64 63];
ori.panel0{154}=[63 53 54];
ori.panel0{155}=[43 54 53];
ori.panel0{156}=[44 54 43];
ori.panel0{157}=[43 42 32];
ori.panel0{158}=[32 33 43];
ori.panel0{159}=[43 33 34];
ori.panel0{160}=[34 44 43];
ori.panel0{161}=[52 42 43];
ori.panel0{162}=[43 53 52];

% Analyze the original pattern before proceeding to the next step
ori.Mesh_AnalyzeOriginalPattern();

%define crease width
ori.creaseWidthVec=zeros(ori.oldCreaseNum,1);
ori.creaseWidthVec(3)=400*10^-6;

% Compute the meshed geometry
ori.Mesh_Mesh()

% Plot the results for inspection
ori.displayRange=3; % plotting range
ori.displayRangeRatio=1; % plotting range in the negative axis

ori.showNumber = 0;

ori.Plot_UnmeshedOrigami(); % Plot the unmeshed origami for inspection;
ori.Plot_MeshedOrigami(); % Plot the meshed origami for inspection;

%ok now we've plotted it... what's next?? 

% thickness of gold and su-8
tg=0.2*10^-6;
ts=0.80*10^-6;


ori.panelE=2*10^9; 
ori.creaseE=2*10^9; 
ori.panelPoisson=0.3;
ori.creasePoisson=0.3; 
ori.panelThickVec=[500*10^(-6);21*10^-6;500*10^(-6)]; 
ori.panelW=400*10^-6;

% set up the diagonal rate to be large to suppress crease torsion
ori.diagonalRate=1000;

ori.creaseThickVec=zeros(ori.oldCreaseNum,1);
ori.creaseThickVec(3)=(tg+ts);


%% setup panel contact information

ori.contactOpen=0;
ori.ke=0.0001;
ori.d0edge=40*(10^(-6));
ori.d0center=40*(10^(-6));

%% Assign Thermal Properties

ori.panelThermalConductVec = [1.3;0.3;1.3]; 
ori.creaseThermalConduct=0.3;
ori.envThermalConduct=0.026;

% thickness of the submerged environment at RT
ori.t2RT=1500*10^(-6); 
%% Apply sine wave loading
% density of SU-8
rhoSU8=1200;
ori.densityCrease=rhoSU8;
ori.densityPanel=rhoSU8;

dynamics=ControllerDynamics();
dynamics.supp=[1,1,1,1;
          4,1,1,1;
          16,1,1,1;
          9,1,1,1;
          10,1,1,1;
          11,1,1,1;
          12,1,1,1;];   
      
dynamics.dt=10^-5;

step=10000;
TimeVec=(1:step)*10^-5;
dynamics.Fext=zeros(step,18,3);
dynamics.rotTargetAngle=pi*ones(step,11);
% Apply a step force
dynamics.Fext(:,6,3)=0.0000001;
dynamics.Fext(:,7,3)=0.0000001;
% Apply a step change in stress free folding angle
dynamics.rotTargetAngle(:,3)=pi+pi/4;


% ploting option
dynamics.plotOpen=0;
dynamics.videoOpen=1;
dynamics.videoCropRate=100;

% Solve the solution
ori.loadingController{1}={"Dynamics",dynamics};
ori.Solver_Solve()


% tip displacement curve
Uhis=dynamics.Uhis;
dispHis1=squeeze(Uhis(:,6,3));
figure
plot(dispHis1)


toc

