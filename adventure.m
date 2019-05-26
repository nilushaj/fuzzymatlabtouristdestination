fis=readfis('adventure.fis');

a=input('Climate    :');
b=input('Hiking  :');
c=input('Rowing   :');
d=input('Camping :');
e=input(' River :');
f=input('Waterfall :');




x=evalfis([a b c d e f],fis);

 [val, idx] = max(x);
 x(idx)      = -Inf;
 [val2, idx2] = max(x);
  x(idx2)      = -Inf;
 [val3, idx3] = max(x);

disp(['Output val     ', num2str(x)]);
disp(['Output val     ', num2str(val)]);
disp(['Output idx     ', num2str(idx)]);
disp(['Output val     ', num2str(val2)]);
disp(['Output idx     ', num2str(idx2)]);
disp(['Output val     ', num2str(val3)]);
disp(['Output idx     ', num2str(idx3)]);
range1 =getfis(fis,'output',idx,'Name');
range1
range2 =getfis(fis,'output',idx2,'Name');
range2
range3 =getfis(fis,'output',idx3,'Name');
range3
