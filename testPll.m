1; # this is kept to Prevent Octave from thinking that this is a function file:

close all;
clear all;

function y=test(a,b)


    y( int64((a*1000)+b) , 1 )  =sin(a)+cos(b) ;
    y( int64((a*1000)+b) , 2 )  =sin(a)+2*cos(b) ;



endfunction

num_process=8

a_test_inputs=[0:3.14/20:3.14];
b_test_inputs=[0:3.14/20:3.14]*2;

tic ();
tt_par= pararrayfun(num_process,@test,(a_test_inputs),(b_test_inputs));
parallel_elapsed_time = toc ()

tic ();
tt_ser= test((a_test_inputs),(b_test_inputs));
serial_elapsed_time = toc ()

%{

plot(a_test_inputs,tt_par,'-o',a_test_inputs,tt_ser,'-s');
legend('Parallel result','Serial result');

 disp(sprintf('Elapsed time during serial computation is %e',serial_elapsed_time))
 disp(sprintf('Elapsed time during parallel computation is %e',parallel_elapsed_time))
 
 %}