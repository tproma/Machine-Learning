function [ a ] = tester( c12 , target )
      
     counter = 0; 
     
     
       
       for i=1:50
          
              if (c12(i,1)==target(i,1))
                  counter = counter +1;
              end    
           
       end
       
            for i=51:100
          
              if (c12(i,2)==target(i,2))
                  counter = counter +1;
              end    
           
            end
            
            
            for i=101:150
          
              if (c12(i,3)==target(i,3))
                  counter = counter +1;
              end    
           
            end
            
        
     a= counter/150;
end

