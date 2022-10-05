function[P,alpha,ud,xd,beta,step,erf1,erf2] = iHLRF(y,g,Dg,M,D,R,delta,type,ftype)
%Set convergence criteria and step/ Set starting point 
%and get choleskydecomposition of R and R'(R' is nR in this code)
i = 1;
eps1 = 10^-5; eps2 = 10^-5;
iG = double(subs(g,y,M));
L = chol(R).';
nR = T(R,type,delta);
Lr = chol(nR).';
x = M;

%ftype 0 meaning Jointly normal, ftype 1 meaning Nataf or SI

if ftype==0
    u = normTransform(x,M,D,L);
    while 1
        
        %Computation
        x = invnormTransform(u,M,D,L);
        J = D*L;
        G = double(subs(g,y,x));
        DG = double(subs(Dg,y,x)).'*J;
        NegD = -DG.'/norm(DG);
        d = (NegD.'*u+G/norm(DG))*NegD-u;
        
        % Convergence check
        % erf 1, erf2 meaning 
        % abs(G/iG) and norm(u-NegD.'*u*NegD) at final step
        
        if (abs(G/iG)<eps1 && norm(u-NegD.'*u*NegD)<eps2)
            alpha = NegD;
            ud = u;
            xd = x;
            beta = NegD.'*u;
            step = i;
            P = normcdf(-beta);
            erf1 = abs(G/iG);
            erf2 = norm(u-NegD.'*u*NegD);
            break
            
        %Setting c for each step and compute merit function
        %Get lambda which gives merit function decrease and update u
        
        else
            if abs(G)>= 10^-3*abs(iG)
                c = 2*max(norm(u)/norm(DG), (u+d).'*(u+d)/abs(G)/2);
            else
                c = 2*norm(u)/norm(DG);
            end
            m = u.'*u/2+c*abs(G);
            lambda = 1;
            while 1
                u2 = u + lambda*d;
                x2 = invnormTransform(u2,M,D,L);
                G2 = double(subs(g,y,x2));
                m2 = u2.'*u2/2+c*abs(G2);
                if m2 < m
                    u = u2;
                    break
                else
                    lambda = lambda/2;
                end
            end
            
            % update step
            
            i = i+1;
        end
    end
elseif ftype==1
    u = Lr^-1*cdfTransform(x,type,M,D,delta);
    while 1
        
        %Computation
        
        x = invcdfTransform(Lr*u,type,M,D,delta);
        J = Jacob(Lr*u,type,M,D,delta)*Lr;
        G = double(subs(g,y,x));
        DG = double(subs(Dg,y,x)).'*J;
        NegD = -DG.'/norm(DG);
        d = (NegD.'*u+G/norm(DG))*NegD-u;
        
        % Convergence check
        % erf 1, erf2 meaning 
        % abs(G/iG) and norm(u-NegD.'*u*NegD) at final step
        
        if (abs(G/iG)<eps1 && norm(u-NegD.'*u*NegD)<eps2)
            alpha = NegD;
            ud = u;
            xd = x;
            beta = NegD.'*u;
            step = i;
            P = normcdf(-beta);
            erf1 = abs(G/iG);
            erf2 = norm(u-NegD.'*u*NegD);
            break
            
        %Setting c for each step and compute merit function
        %Get lambda which gives merit function decrease and update u
            
        else
            if abs(G)>= 10^-3*abs(iG)
                c = 2*max(norm(u)/norm(DG), (u+d).'*(u+d)/abs(G)/2);
            else
                c = 2*norm(u)/norm(DG);
            end
            m = u.'*u/2+c*abs(G);
            lambda = 1;
            while 1
                u2 = u + lambda*d;
                x2 = invcdfTransform(Lr*u2,type,M,D,delta);
                G2 = double(subs(g,y,x2));
                m2 = u2.'*u2/2+c*abs(G2);
                if m2 < m
                    u = u2;
                    break
                else
                    lambda = lambda/2;
                end
            end
            
            % update step
            
            i = i+1;
        end
    end
end