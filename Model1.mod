// CALIBRATION

// Endogenous and exogenous variables 
var    dc dd dy f CE ce m pd rd rf u x dcf ddf dyf ff CEf cef mf pdf rdf rff uf xf de EC rdex s swc ;
varexo    eps_c eps_x eps_cf eps_xf ;

// Parameters
parameters   gamma psi delta mu rho rho_vecm alpha kappa theta lever ;

gamma = 8.000000e+00; 
psi = 1.500000e+00; 
delta = 9.825000e-01; 
mu = 2.000000e-02; 
rho = 9.850000e-01; 
rho_vecm = 5.000000e-04; 
alpha = 9.700000e-01; 
kappa = 3.233333e+01; 
theta = -4.761905e-02; 
lever = 1.010000e+00; 

// Model
model; 
dy=mu+x(-1)+eps_c+rho_vecm*EC; 
dyf=mu+xf(-1)+eps_cf-rho_vecm*EC; 
x=rho*x(-1)+eps_x; 
xf=rho*xf(-1)+eps_xf; 
EC=(1-2*rho_vecm)*EC(-1)+xf(-1)+eps_cf-(x(-1)+eps_c); 
dd=mu+lever*(dc-mu); 
ddf=mu+lever*(dcf-mu); 
f=log(1+1/(kappa*exp(s)))*(-alpha)+log(1+kappa/exp(s))*(alpha-1); 
ff=(alpha-1)*log(1+kappa*exp(s))-alpha*log(1+exp(s)/kappa); 
dc=f-f(-1)+alpha*dy+(1-alpha)*dyf; 
dcf=ff-ff(-1)+(1-alpha)*dy+alpha*dyf; 
exp((1-1/psi)*u)=(1-delta)+delta*(CE^theta); 
exp((1-1/psi)*uf)=(1-delta)+delta*(CEf^theta); 
CE=exp((u(+1)+dc(+1))*(1-gamma)); 
ce=log(CE); 
CEf=exp((uf(+1)+dcf(+1))*(1-gamma)); 
cef=log(CEf); 
s=s(-1)+m-mf+dc-dcf; 
swc=exp(s)/(1+exp(s)); 
de=mf-m; 
exp(m)=delta*exp(-dc/psi)*exp((u+dc)*(1/psi-gamma))/exp(ce(-1)*(1-theta)); 
exp(mf)=delta*exp(-dcf/psi)*exp((uf+dcf)*(1/psi-gamma))/exp(cef(-1)*(1-theta)); 
1/exp(rf)=exp(m(+1)); 
1/exp(rff)=exp(mf(+1)); 
1=exp(m(+1)+rd(+1)); 
exp(rd)=(1+exp(pd))/exp(pd(-1))*exp(dd); 
rdex=rd-rf; 
1=exp(mf(+1)+rdf(+1)); 
exp(rdf)=(1+exp(pdf))/exp(pdf(-1))*exp(ddf); 

end;

// Initial Values
initval; 
dc = 2.000000e-02; 
dd = 2.000000e-02; 
dy = 0.000000e+00; 
f = -1.347422e-01; 
CE = 4.414207e-05; 
ce = -1.002810e+01; 
m = -3.098827e-02; 
pd = 4.505428e+00; 
rd = 3.098827e-02; 
rf = 3.098827e-02; 
u = 1.412585e+00; 
x = 0.000000e+00; 
dcf = 2.000000e-02; 
ddf = 2.000000e-02; 
dyf = 0.000000e+00; 
ff = -1.347422e-01; 
CEf = 4.414207e-05; 
cef = -1.002810e+01; 
mf = -3.098827e-02; 
pdf = 4.505428e+00; 
rdf = 3.098827e-02; 
rff = 3.098827e-02; 
uf = 1.412585e+00; 
xf = 0.000000e+00; 
de = 0.000000e+00; 
EC = 0.000000e+00; 
rdex = 0.000000e+00; 
s = 0.000000e+00; 
swc = 5.000000e-01; 

end;

vcov = [3.499200e-04 1.749600e-05 0 0
1.749600e-05 3.499200e-04 0 0
0 0 6.718464e-06 6.046618e-06
0 0 6.046618e-06 6.718464e-06];  
order   = 3;  
