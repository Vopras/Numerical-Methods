function [centroids] = clustering_pc(points, NC)

[m n] = size(points);
C = zeros(NC,n);
H = C;
	for i = 1:NC
		for q = i:NC:m
			for o = 1:n;
				if (points(q,o) != 0)
					C(i,o) = C(i,o) + points(q,o);
					H(i,o)++;
				end
			end
		end
	end

	for i = 1:NC
		for o = 1:n;
			C(i,o) = C(i,o) / H(i,o);
		end
	end
C1 = C;
[mx nx] = size(C1);

	for q = 1:m
		for i = 1:NC
			D(q,i) = norm(points(q,:) - C(i,:));
		end
	end

	for q = 1:m
		[e(q) r(q)] = min(D(q,:));
	end
X01=zeros(1,NC);
C=zeros(NC,n);
	for i=1:m
    	for j=1:NC
      		if j==r(i)
        		X01(j)++;
        		C(j,:)=C(j,:)+points(i,:);
        		break;
      		end
    	end
  	end
  
    for j=1:NC
      C(j,:)=C(j,:)/X01(j);
    endfor

	while norm(C1 - C) > 1e-3
    C1=C;
 	for q = 1:m
		for i = 1:NC
			D(q,i) = norm(points(q,:) - C(i,:));
		end
	end

	for q = 1:m
		[e(q) r(q)] = min(D(q,:));
	end
	
X01=zeros(1,NC);
C=zeros(NC,n);
	for i=1:m
    	for j=1:NC
      		if j==r(i)
        		X01(j)++;
        		C(j,:)=C(j,:)+points(i,:);
        		break;
      		end
    	end
  	end
  
    for j=1:NC
      C(j,:)=C(j,:)/X01(j);
    endfor
	end

centroids = C;
endfunction