function y=lineY(x , x1,x2,y1,y2)

    
    
    m = (y2-y1)/(x2-x1);
    y = (m*(x-x1)) + y1;
    y = round(y);
end