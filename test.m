fis=readfis('nature.fis');


a=input('wildlife  :');
b=input('Bird Watching   :');
c=input('Camping :');
d=input('Waterfall :');
e=input('Garden :');
f=input('Climate :');
g=input('Accomadation :');



x=evalfis([a b c d e f g],fis);
disp(['Output values for answers     ', num2str(x)]);
for c=1:length(x)
	range1 =getfis(fis,'output',c,'Name');
	disp(['location    :', range1]);
	disp(['crisp  :', num2str(x(1,c))]);

end


 %[val, idx] = max(x);
 %x(idx)      = -Inf;
 %[val2, idx2] = max(x);
 % x(idx2)      = -Inf;
 %[val3, idx3] = max(x);
 
 %A=[idx2,idx3];
 %if val2==val3
  %   pos =randi(length(A));
  %   idx2 = A(pos);
  %   disp(['Output val11     ', num2str(idx2)]);
     
 %end    

%disp(['Output maxval   ', num2str(val)]);
%disp(['Output idx     ', num2str(idx)]);
%disp(['Output 2maxval     ', num2str(val2)]);
%disp(['Output idx     ', num2str(idx2)]);
%disp(['Output 3maxval     ', num2str(val3)]);
%disp(['Output idx     ', num2str(idx3)]);
%range1 =getfis(fis,'output',idx,'Name');
%range1
%range2 =getfis(fis,'output',idx2,'Name');
%range2
%range3 =getfis(fis,'output',idx3,'Name');
%range3
