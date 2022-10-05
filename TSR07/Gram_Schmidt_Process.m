function V = Gram_Schmidt_Process(alpha)
n = size(alpha,1);
V = eye(n);
V(n,:) = alpha;

for i = n-1:-1:1
    for j = i+1:n
        V(i,:) = V(i,:) - (V(j,:)*V(i,:)')/(V(j,:)*V(j,:)')*V(j,:);
    end
end

for k = 1:n
    V(k,:) = V(k,:)/norm(V(k,:));
end
end
