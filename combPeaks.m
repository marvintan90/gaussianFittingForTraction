function ImList = combPeaks(ImList, d)
      for n=1:size(ImList,1)
              xn = ImList(n,1); % my cooridnates
              yn = ImList(n,2); % my coordinates
              if abs(ImList(n,3)) > 1  % if my intensity is not zero
                      dist = sqrt(...
                                  ((xn-ImList(:,1)).^2)...
                                  +...
                                  ((yn-ImList(:,2)).^2)...
                                  );    % my distance to all other points
                       p=1; 
                       neigh=[0,0,0];           
                       for m=1:size(dist,1)  % check each point
                          if dist(m) < d
                              neigh(p,1) = ImList(m,1) ; % copy self & neighbour
                              neigh(p,2) = ImList(m,2) ; % copy self & neighbour
                              neigh(p,3) = ImList(m,3) ; % copy self & neighbour
                              ImList(m,1) = 0; % remove self & neighbour
                              ImList(m,2) = 0; % remove self & neighbour
                              ImList(m,3) = 0; % remove self & neighbour
                              p++;
                          endif
                       endfor   % now neighbours are known
                       
                           peakNeigh = max( neigh(:,3) );
                           for q=1:size(neigh,1)
                                if abs( abs(neigh(q,3))-abs(peakNeigh) )<0.01                                                          
                                       ImList(n,1) = neigh(q,1);  % restore self
                                       ImList(n,2) = neigh(q,2);  % restore self
                                       ImList(n,3) = neigh(q,3);  % restore self
                                endif
                           endfor
                                     
                endif
       endfor
          
                  
end