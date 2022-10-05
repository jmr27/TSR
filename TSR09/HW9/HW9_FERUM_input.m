clear probdata femodel analysisopt gfundata randomfield systems results output_filename

output_filename = 'Component Reliability.txt';

probdata.marg(1,:) =  [ 2 150 30 150 0 0 0 0 0]; 																			  
probdata.marg(2,:) =  [ 2 150 30 150 0 0 0 0 0]; 	
probdata.marg(3,:) =  [ 2 150 30 150 0 0 0 0 0];
probdata.marg(4,:) =  [ 2 150 30 150 0 0 0 0 0]; 	
probdata.marg(5,:) =  [ 2 150 30 150 0 0 0 0 0];

probdata.correlation=[1.0  0.3  0.3 0.3 0.3;
                      0.3 1.0  0.3 0.3 0.3;
                      0.3  0.3  1.0 0.3 0.3;
                      0.3 0.3 0.3 1.0 0.3;
                      0.3 0.3 0.3 0.3 1.0];

probdata.parameter = distribution_parameter(probdata.marg);

analysisopt.ig_max = 100;       % Maximum number of global iterations allowed in the search algorithm
analysisopt.il_max = 5;         % Maximum number of line iterations allowed in the search algorithm
analysisopt.e1 = 0.001;         % Tolerance on how close design point is to limit-state surface
analysisopt.e2 = 0.001;         % Tolerance on how accurately the gradient points towards the origin
analysisopt.step_code = 0;      % 0: step size by Armijo rule, otherwise: given value (0 < s <= 1) is the step size.
analysisopt.grad_flag = 'DDM';  % 'DDM': direct differentiation, 'FFD': forward finite difference

% Simulation analysis
analysisopt.sim_point = 'dspt'; % 'dspt': design point, 'origin': origin in standard normal space
analysisopt.stdv_sim  = 1;      % Standard deviation of sampling distribution
analysisopt.num_sim   = 1000;   % Number of simulations
analysisopt.target_cov = 0.0125;  % Target coefficient of variation of failure prob

gfundata(1).evaluator = 'basic';
gfundata(1).type = 'expression';
gfundata(1).parameter = 'no';
gfundata(1).expression = 'x(1)+x(2)+x(4)+x(5)-250';
gfundata(1).dgdq = { '1' ;
                             '1' ;
                             '0';
                             '1';
                             '1'};


gfundata(2).evaluator = 'basic';
gfundata(2).type = 'expression';
gfundata(2).parameter = 'no';
gfundata(2).expression = 'x(2)+2*x(3)+x(4)-300';
gfundata(2).dgdq = { '0' ;
                             '1' ;
                             '2';
                             '1';
                             '0'};
                         
gfundata(3).evaluator = 'basic';
gfundata(3).type = 'expression';
gfundata(3).parameter = 'no';
gfundata(3).expression = 'x(1)+2*x(3)+2*x(4)+x(5)-550';
gfundata(3).dgdq = { '1' ;
                             '0' ;
                             '2';
                             '2';
                             '1'};
                         
femodel = 0;
randomfield.mesh = 0;

system.system = [-3];
system.scis_max = 20000;  % maximum no. of simulation for each scis (Default : 20000)
system.scis_min = 1000;   % minimum no. of simulation for each scis (Default : 1000)
system.cov_max  = 0.05;   % target c.o.v. of each scis (Default : 0.05)