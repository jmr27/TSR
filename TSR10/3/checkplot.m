figure
h1 = histogram(X(1,:),'Normalization','cdf','Edgealpha',0.3,'Facealpha',0.3);
hold on
plot(sort(X(1,:)),y1)

figure
h2 = histogram(X(2,:),'Normalization','cdf','Edgealpha',0.3,'Facealpha',0.3);
hold on 
plot(sort(X(2,:)),y2)

