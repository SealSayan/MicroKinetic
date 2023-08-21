% Do NOT run this script , this script only contains the function
% RUN the other script , that script will call this function
% Do NOT change the name of this script,it is the same name as the function

function dC = equations_1(t, C)

% define variables for the various species
CH4 = C(1);      CH3 = C(2);        H = C(3);
ZnCl2 = C(4);    ZnCl = C(5);       Cl = C(6);
CH3ZnCl = C(7);  HCl = C(8);        H2 = C(9);
CH3Cl = C(10);   C2H6 = C(11);      HZnCl = C(12);
ZnCH3 = C(13);   CH2ZnCl = C(14);   Cl2 = C(15);

% n is the Avogadro number divided with 10^6 because the cm3 in rate
% constant needs to be converted to SI units

n = 6.022e+17;

% The rate constants given
% The forward rate constant is given by Kf and the backward Kb

Kf1  = 1.5e-3;            Kb1  = n*(1.1e-9);
Kf2  = 9.8e-4;            Kb2  = n*(5e-11);
Kf3  = n*(4e-20);         Kb3  = n*(5.2e-15);
Kf4  = n*(4.2e-13);       Kb4  = n*(2.6e-14);
Kf5  = n*(6.4e-18);       Kb5  = n*(3.6e-14);
Kf6  = n*(3e-11);         Kb6  = n*(6.1e-13);
Kf7  = n*(9.5e-23);       Kb7  = n*(3.2e-17);
Kf8  = n*(7.5e-17);       Kb8  = n*(2.9e-13);
Kf9  = n*(1.1e-19);       Kb9  = n*(3.5e-13);
Kf10 = n*(2.3e-20);       Kb10 = n*(4.4e-14);
Kf11 = n*(9.3e-12);       Kb11 = n*(3.9e-13);
Kf12 = n*(4.2e-19);       Kb12 = n*(2.4e-14);
Kf13 = n*(3.9e-14);       Kb13 = n*(1.2e-17);
Kf14 = n*(5.7e-11);       Kb14 = n*(5e-13);
Kf15 = n*(2.2e-10);       Kb15 = n*(2.5e-14);
Kf16 = n*(4.5e-10);       Kb16 = 1.4e-4;
Kf17 = n*(6.5e-10);       Kb17 = 1.4e-4;
Kf18 = n*(2.1e-10);       Kb18 = 12;
Kf19 = n*(7.8e-11);       Kb19 = 9.5e+3;
Kf20 = n*(2.8e-11);       Kb20 = 3e-5;
Kf21 = n*(2e-10);         Kb21 = 80;
Kf22 = n*(3.8e-11);       Kb22 = 1.5e+3;

% Rate laws of each intermediate step 

r1  = (Kf1*CH4)-(Kb1*CH3*H);
r2  = (Kf2*ZnCl2)-(Kb2*ZnCl*Cl);
r3  = (Kf3*ZnCl2*CH4)-(Kb3*CH3ZnCl*HCl);
r4  = (Kf4*CH4*H)-(Kb4*CH3*H2);
r5  = (Kf5*CH4*Cl)-(Kb5*CH3Cl*H);
r6  = (Kf6*CH4*Cl)-(Kb6*CH3*HCl);
r7  = (Kf7*CH4*CH3)-(Kb7*C2H6*H);
r8  = (Kf8*ZnCl*CH4)-(Kb8*HZnCl*CH3);
r9  = (Kf9*ZnCl*CH4)-(Kb9*CH3ZnCl*H);
r10 = (Kf10*ZnCl*CH4)-(Kb10*ZnCH3*HCl);
r11 = (Kf11*ZnCl2*H)-(Kb11*ZnCl*HCl);
r12 = (Kf12*ZnCl2*CH3)-(Kb12*CH2ZnCl*HCl);
r13 = (Kf13*HZnCl*HCl)-(Kb13*ZnCl2*H2);
r14 = (Kf14*CH3ZnCl*Cl)-(Kb14*CH2ZnCl*HCl);
r15 = (Kf15*CH3ZnCl*H)-(Kb15*CH2ZnCl*H2);
r16 = (Kf16*H*H)-(Kb16*H2);
r17 = (Kf17*H*Cl)-(Kb17*HCl);
r18 = (Kf18*H*ZnCl)-(Kb18*HZnCl);
r19 = (Kf19*Cl*Cl)-(Kb19*Cl2);
r20 = (Kf20*Cl*ZnCH3)-(Kb20*CH3ZnCl);
r21 = (Kf21*CH3*CH3)-(Kb21*C2H6);
r22 = (Kf22*CH3*ZnCl)-(Kb22*CH3ZnCl);

% Derivative of each intermediate species in terms of rate
dCH4      = -r1-r3-r4-r5-r6-r7-r8-r9-r10;
dCH3      = r1+r4+r6+-r7+r8-r12-2*r21-r22;
dH        = r1-r4+r5+r7+r9-r11-r15-2*r16-r17-r18;
dZnCl2    = -r2-r3-r11-r12+r13;
dZnCl     = r2-r8-r9-r10+r11-r18-r22;
dCl       = r2-r5-r6-r14-r17-r19-r20;
dCH3ZnCl  = r3+r9-r14-r15+r20+r22;
dHCl      = r3+r6+r10+r11+r12-r13+r14+r17;
dH2       = r4+r13+r15+r16;
dCH3Cl    = r5;
dC2H6     = r7+r21;
dHZnCl    = r8-r13+r18;
dZnCH3    = r10-r20;
dCH2ZnCl  = r12+r14+r15;
dCl2      = r19;

% Output variables to be returned when the function gets called

dC(1,:)  = dCH4;
dC(2,:)  = dCH3;
dC(3,:)  = dH;
dC(4,:)  = dZnCl2;
dC(5,:)  = dZnCl;
dC(6,:)  = dCl;
dC(7,:)  = dCH3ZnCl;
dC(8,:)  = dHCl;
dC(9,:)  = dH2;
dC(10,:) = dCH3Cl;
dC(11,:)  = dC2H6;
dC(12,:)  = dHZnCl;
dC(13,:)  = dZnCH3;
dC(14,:)  = dCH2ZnCl;
dC(15,:)  = dCl2;