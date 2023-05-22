   
 % Tenfold Cross validation 
 
 
    a; k=1;  c=5;j=1; p=20;
    c1 = zeros (150,1);
 
for i=1 :10 

   s = [a(k:c,1);a(k:c,2);a(k:c,3);a(k:c,4)];
   k= k+5;
   c= c+5;
   c1(j:p,1) = s(1:20,1);
   j= j +20;
   p = p +20;
end 

 l = 51; 
 e = 55;
 c2 = zeros(200,1);
 u = 1; 
 y = 20;
 
for i=1 :10 

   s = [a(l:e,1);a(l:e,2);a(l:e,3);a(l:e,4)];
   l= l+5;
   e= e+5; 
   c2(u:y,1) = s(1:20,1);
   u= u +20;
   y = y +20;
  
end 


 q = 101; 
 z = 105;
 c3 = zeros(200,1);
 r = 1; 
 t= 20;
 
for i=1 :10 
   s = [a(q:z,1);a(q:z,2);a(q:z,3);a(q:z,4)];
   q= q+5;
   z= z+5;
   c3(r:t,1) = s(1:20,1);
   r= r +20;
   t = t +20;
  
end 

    ten_fold = [c1 c2 c3];
    test_result = zeros(10,1);
   
    
g=5;
v=1; 
for i=1:10
    test = ten_fold(v:g,:);
    bb = v-1;
    v=g+1;   
    g= g+5;
   if (i<=9)
       
        dd= vertcat(ten_fold(g+1:200,:),ten_fold(1:bb,:));
        training = dd;
        test_result(i,1)= performance_tester( training, test);
   else
        test = ten_fold(196:200,:);
        training = ten_fold(1:195,:);
        test_result(i,1)= performance_tester( training, test);
       
   end 
   
         test_result; 
        
end


 va =var(test_result)

     