nxMax = 4;
nyMax = 6;



nxny = [0,0];
	  n = 1;
	  for nx = [1:nxMax]
	  
	      %{
	      for ny = [1:nyMax]
		  nxny( n , 1) = nx ;
		  nxny( n , 2) = ny ;
		  n++;
	      end
	      %}
	      
	      addHere(:,1) = nx*ones(nyMax,1)';
	      addHere(:,2) = [1:1:nyMax];
	      nxny = [nxny; addHere];
	     
	  end