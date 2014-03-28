
function result = ConceptCall()

%   function result = AsapCall() calls the necessary programs of the
%   concept software package to perform the current calculation. There are
%   no input parameters and the only output parameter is result which holds
%   a value that indicates whether the calculation was successful. Since
%   the program concept.fe.exe needs some input to be executed, an
%   indirection file is created and used instead of the manual input via
%   keyboard.
 
  
  fprintf('Calling Concept front end... ');
  
  % create indirection file
  
  %fd=fopen('input.dat','w+');
  %fprintf(fd,'\n\n14\n');
  %fclose(fd);
  
  %[Status,Result]=dos('concept.fe < input.dat');
  [Status,Result]=dos('concept.fe concept.in');
  if Status ~=0
      fprintf('failed\n');
  else
      fprintf('done\n');
  end
  
  fprintf('Calling buildgeo... ');
  [Status,Result]=dos('buildgeo');
  if Status ~=0
      fprintf('failed\n');
      error('Computation failed');
  else
      fprintf('done\n');
  end
  
   fprintf('Calling Concept back end... ');
  [Status,Result]=dos('concept.be');
  if Status ~=0
      error('failed\n');
      error('Computation failed');
  else
      fprintf('done\n');
  end
 
  result=Status;
 
  
