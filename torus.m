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

ori.showNumber = 1;

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
ori.panelThickVec=zeros(162,1) + 0.5;
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
dc.supp=[1,1,1,1;
2,1,1,1;
3,1,1,1;
4,1,1,1;
5,1,1,1;
6,1,1,1;
7,1,1,1;
8,1,1,1;
9,1,1,1;
10,1,1,1;
11,1,1,1;
12,1,1,1;
13,1,1,1;
14,1,1,1;
15,1,1,1;
16,1,1,1;
17,1,1,1;
18,1,1,1;
19,1,1,1;
20,1,1,1;
21,1,1,1;
22,1,1,1;
23,1,1,1;
24,1,1,1;
25,1,1,1;
26,1,1,1;
27,1,1,1;
28,1,1,1;
29,1,1,1;
30,1,1,1;
31,1,1,1;
32,1,1,1;
33,1,1,1;
34,1,1,1;
35,1,1,1;
36,1,1,1;
37,1,1,1;
38,1,1,1;
39,1,1,1;
40,1,1,1;
41,1,1,1;
42,1,1,1;
43,1,1,1;
44,1,1,1;
45,1,1,1;
46,1,1,1;
47,1,1,1;
48,1,1,1;
49,1,1,1;
50,1,1,1;
51,1,1,1;
52,1,1,1;
53,1,1,1;
54,1,1,1;
55,1,1,1;
56,1,1,1;
57,1,1,1;
58,1,1,1;
59,1,1,1;
60,1,1,1;
61,1,1,1;
62,1,1,1;
63,1,1,1;
64,1,1,1;
65,1,1,1;
66,1,1,1;
67,1,1,1;
68,1,1,1;
69,1,1,1;
70,1,1,1;
71,1,1,1;
72,1,1,1;
73,1,1,1;
74,1,1,1;
75,1,1,1;
76,1,1,1;
77,1,1,1;
78,1,1,1;
79,1,1,1;
80,1,1,1;
81,1,1,1;
82,1,1,1;
83,1,1,1;
84,1,1,1;
85,1,1,1;
86,1,1,1;
87,1,1,1;
88,1,1,1;
89,1,1,1;
90,1,1,1;
91,1,1,1;
92,1,1,1;
93,1,1,1;
94,1,1,1;
95,1,1,1;
96,1,1,1;
97,1,1,1;
98,1,1,1;
99,1,1,1;
100,1,1,1;
101,1,1,1;
102,1,1,1;
103,1,1,1;
104,1,1,1;
105,1,1,1;
106,1,1,1;
107,1,1,1;
108,1,1,1;
109,1,1,1;
110,1,1,1;
111,1,1,1;
112,1,1,1;
113,1,1,1;
114,1,1,1;
115,1,1,1;
116,1,1,1;
117,1,1,1;
118,1,1,1;
119,1,1,1;
120,1,1,1;
121,1,1,1;
122,1,1,1;
123,1,1,1;
124,1,1,1;
125,1,1,1;
126,1,1,1;
127,1,1,1;
128,1,1,1;
129,1,1,1;
130,1,1,1;
131,1,1,1;
132,1,1,1;
133,1,1,1;
134,1,1,1;
135,1,1,1;
136,1,1,1;
137,1,1,1;
138,1,1,1;
139,1,1,1;
140,1,1,1;
141,1,1,1;
142,1,1,1;
143,1,1,1;
144,1,1,1;
145,1,1,1;
146,1,1,1;
147,1,1,1;
148,1,1,1;
149,1,1,1;
150,1,1,1;
151,1,1,1;
152,1,1,1;
153,1,1,1;
154,1,1,1;
155,1,1,1;
156,1,1,1;
157,1,1,1;
158,1,1,1;
159,1,1,1;
160,1,1,1;
161,1,1,1;
162,1,1,1;
163,1,1,1;
164,1,1,1;
165,1,1,1;
166,1,1,1;
167,1,1,1;
168,1,1,1;
169,1,1,1;
170,1,1,1;
171,1,1,1;
172,1,1,1;
173,1,1,1;
174,1,1,1;
175,1,1,1;
176,1,1,1;
177,1,1,1;
178,1,1,1;
179,1,1,1;
180,1,1,1;
181,1,1,1;
182,1,1,1;
183,1,1,1;
184,1,1,1;
185,1,1,1;
186,1,1,1;
187,1,1,1;
188,1,1,1;
189,1,1,1;
190,1,1,1;
191,1,1,1;
192,1,1,1;
193,1,1,1;
194,1,1,1;
195,1,1,1;
196,1,1,1;
197,1,1,1;
198,1,1,1;
199,1,1,1;
200,1,1,1;
201,1,1,1;
202,1,1,1;
203,1,1,1;
204,1,1,1;
205,1,1,1;
206,1,1,1;
207,1,1,1;
208,1,1,1;
209,1,1,1;
210,1,1,1;
211,1,1,1;
212,1,1,1;
213,1,1,1;
214,1,1,1;
215,1,1,1;
216,1,1,1;
217,1,1,1;
218,1,1,1;
219,1,1,1;
220,1,1,1;
221,1,1,1;
222,1,1,1;
223,1,1,1;
224,1,1,1;
225,1,1,1;
226,1,1,1;
227,1,1,1;
228,1,1,1;
229,1,1,1;
230,1,1,1;
231,1,1,1;
232,1,1,1;
233,1,1,1;
234,1,1,1;
235,1,1,1;
236,1,1,1;
237,1,1,1;
238,1,1,1;
239,1,1,1;
240,1,1,1;
241,1,1,1;
242,1,1,1;
243,1,1,1;
244,1,1,1;
245,1,1,1;
246,1,1,1;
247,1,1,1;
248,1,1,1;
249,1,1,1;
250,1,1,1;
251,1,1,1;
252,1,1,1;
253,1,1,1;
254,1,1,1;
255,1,1,1;
256,1,1,1;
257,1,1,1;
258,1,1,1;
259,1,1,1;
260,1,1,1;
261,1,1,1;
262,1,1,1;
263,1,1,1;
264,1,1,1;
265,1,1,1;
266,1,1,1;
267,1,1,1;
268,1,1,1;
269,1,1,1;
270,1,1,1;
271,1,1,1;
272,1,1,1;];     
loadForce=50;
dc.load=[3,0,0,-loadForce;
27,0,0,loadForce;
5,0,0,-loadForce;
29,0,0,loadForce;
6,0,0,-loadForce;
30,0,0,loadForce;
9,0,0,-loadForce;
44,0,0,loadForce;
11,0,0,-loadForce;
45,0,0,loadForce;
12,0,0,-loadForce;
48,0,0,loadForce;
14,0,0,-loadForce;
51,0,0,loadForce;
15,0,0,-loadForce;
53,0,0,loadForce;
18,0,0,-loadForce;
54,0,0,loadForce;
20,0,0,-loadForce;
68,0,0,loadForce;
21,0,0,-loadForce;
69,0,0,loadForce;
24,0,0,-loadForce;
72,0,0,loadForce;
31,0,0,-loadForce;
74,0,0,loadForce;
32,0,0,-loadForce;
75,0,0,loadForce;
34,0,0,-loadForce;
78,0,0,loadForce;
37,0,0,-loadForce;
80,0,0,loadForce;
38,0,0,-loadForce;
81,0,0,loadForce;
40,0,0,-loadForce;
84,0,0,loadForce;
55,0,0,-loadForce;
86,0,0,loadForce;
58,0,0,-loadForce;
87,0,0,loadForce;
59,0,0,-loadForce;
90,0,0,loadForce;
61,0,0,-loadForce;
92,0,0,loadForce;
62,0,0,-loadForce;
93,0,0,loadForce;
64,0,0,-loadForce;
96,0,0,loadForce;
98,0,0,-loadForce;
146,0,0,loadForce;
104,0,0,-loadForce;
149,0,0,loadForce;
107,0,0,-loadForce;
152,0,0,loadForce;
109,0,0,-loadForce;
154,0,0,loadForce;
110,0,0,-loadForce;
155,0,0,loadForce;
111,0,0,-loadForce;
156,0,0,loadForce;
116,0,0,-loadForce;
179,0,0,loadForce;
119,0,0,-loadForce;
182,0,0,loadForce;
121,0,0,-loadForce;
185,0,0,loadForce;
122,0,0,-loadForce;
188,0,0,loadForce;
123,0,0,-loadForce;
191,0,0,loadForce;
125,0,0,-loadForce;
193,0,0,loadForce;
127,0,0,-loadForce;
194,0,0,loadForce;
128,0,0,-loadForce;
195,0,0,loadForce;
129,0,0,-loadForce;
212,0,0,loadForce;
134,0,0,-loadForce;
215,0,0,loadForce;
137,0,0,-loadForce;
218,0,0,loadForce;
139,0,0,-loadForce;
220,0,0,loadForce;
140,0,0,-loadForce;
221,0,0,loadForce;
141,0,0,-loadForce;
222,0,0,loadForce;
157,0,0,-loadForce;
224,0,0,loadForce;
160,0,0,-loadForce;
227,0,0,loadForce;
163,0,0,-loadForce;
229,0,0,loadForce;
169,0,0,-loadForce;
230,0,0,loadForce;
172,0,0,-loadForce;
231,0,0,loadForce;
196,0,0,-loadForce;
233,0,0,loadForce;
202,0,0,-loadForce;
236,0,0,loadForce;
205,0,0,-loadForce;
239,0,0,loadForce;];

dc.increStep=10; 
dc.tol=10^-6; 
dc.selectedRefDisp=[1,3]; % use node 1 in z direction as reference
dc.videoOpen=0;
ori.loadingController{1}={"DC",dc};


%% Solving the origami
ori.Solver_Solve();

Uhistotal=cat(1,dc.Uhis,dc.Uhis);
ori.Plot_DeformedHis(ori.newNode,Uhistotal);


toc

