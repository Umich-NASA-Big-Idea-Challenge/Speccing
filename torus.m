%% Initialize the solver
clear all;
clc;
close all;

tic
% create an instance of the solver class
ori=OrigamiSolver;



% define the Geometry
ori.node0=[3.00 0.00 0.00;
      0.00 3.00 0.00;
      -3.00 0.00 0.00;
      0.00 -3.00 0.00;
      2.00 0.00 1.00;
      0.00 2.00 1.00;
      -2.00 0.00 1.00;
      0.00 -2.00 1.00;
      1.00 0.00 0.00;
      0.00 1.00 0.00;
      -1.00 0.00 0.00;
      0.00 -1.00 0.00;
      2.00 0.00 -1.00;
      0.00 2.00 -1.00;
      -2.00 0.00 -1.00;
      0.00 -2.00 -1.00;];

ori.panel0{1}=[1 2 5];
ori.panel0{2}=[2 5 6];
ori.panel0{3}=[1 4 5];
ori.panel0{4}=[4 5 8];
ori.panel0{5}=[2 6 7];
ori.panel0{6}=[2 3 7];
ori.panel0{7}=[4 7 8];
ori.panel0{8}=[3 4 7];
ori.panel0{9}=[ 1  2 13];
ori.panel0{10}=[ 2 13 14];
ori.panel0{11}=[ 6  7 10];
ori.panel0{12}=[ 7 10 11];
ori.panel0{13}=[ 5  6 10];
ori.panel0{14}=[ 5  9 10];
ori.panel0{15}=[10 13 14];
ori.panel0{16}=[ 9 10 13];
ori.panel0{17}=[ 1  4 13];
ori.panel0{18}=[ 4 13 16];
ori.panel0{19}=[ 7 11 12];
ori.panel0{20}=[ 7  8 12];
ori.panel0{21}=[ 5  8 12];
ori.panel0{22}=[ 5  9 12];
ori.panel0{23}=[12 13 16];
ori.panel0{24}=[ 9 12 13];
ori.panel0{25}=[10 14 15];
ori.panel0{26}=[10 11 15];
ori.panel0{27}=[12 15 16];
ori.panel0{28}=[11 12 15];
ori.panel0{29}=[ 2 14 15];
ori.panel0{30}=[ 2  3 15];
ori.panel0{31}=[ 4 15 16];
ori.panel0{32}=[ 3  4 15];

% Analyze the original pattern before proceeding to the next step
ori.Mesh_AnalyzeOriginalPattern();

%define crease width
ori.creaseWidthVec=zeros(ori.oldCreaseNum) + 6*10^(-3);

% Compute the meshed geometry
ori.Mesh_Mesh()

% Plot the results for inspection
ori.displayRange=3; % plotting range
ori.displayRangeRatio=1; % plotting range in the negative axis

ori.showNumber = 0;

ori.Plot_UnmeshedOrigami(); % Plot the unmeshed origami for inspection;
ori.Plot_MeshedOrigami(); % Plot the meshed origami for inspection;

%ok now we've plotted it... what's next?? 

%thickness of gold and su-8
tg=0.2*10^-6;
ts=0.80*10^-6;


ori.panelE=2*10^9; 
ori.creaseE=2*10^9; 
ori.panelPoisson=0.3;
ori.creasePoisson=0.3; 
ori.panelThickVec=zeros(162,1) + 1;
ori.panelW=400*10^-6;

%set up the diagonal rate to be large to suppress crease torsion
ori.diagonalRate=1000;

ori.creaseThickVec=zeros(ori.oldCreaseNum,1) + 100*10^(-6);


%% setup panel contact information

ori.contactOpen=0;
ori.ke=0.0001;
ori.d0edge=40*(10^(-6));
ori.d0center=40*(10^(-6));

%% Assign Thermal Properties

ori.panelThermalConductVec = [1.3;0.3;1.3]; 
ori.creaseThermalConduct=0.3;
ori.envThermalConduct=0.026;

%forces
dc=ControllerDCLoading;
dc.supp=[2,1,1,1;
         5,1,1,1;
         11,1,1,1;
         16,1,1,1;];     
loadForce=3;
dc.load=[29,0,0,loadForce;
      30,0,0,loadForce;
      31,0,0,loadForce;
      32,0,0,loadForce;];  
dc.increStep=3; 
dc.tol=10^-6; 
dc.selectedRefDisp=[19,3]; % use node 29 in z direction as reference
dc.videoOpen=0;

ori.loadingController{1}={"DC",dc};

% Solve the solution
ori.loadingController{1}={"DC",dc};
ori.Solver_Solve()

Uhistotal=cat(1,dc.Uhis,dc.Uhis);
ori.Plot_DeformedHis(ori.newNode,Uhistotal);


toc

