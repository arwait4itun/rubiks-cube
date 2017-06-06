class Cube
	
	@cube = Array.new
	
	#all the variables below are 2d arrays represending the faces 
	
	@b=Array.new 
	@o=Array.new
	@w=Array.new
	@r=Array.new
	@g=Array.new
	@y=Array.new
	
	def initialize(white,yellow,blue,green,red,orange,move)
		@cube = [blue,orange,white,red,green,yellow]
		@b=blue
		@o=orange
		@w=white
		@r=red
		@g=green
		@y=yellow
	end
	
	
	def reverse(arr) #arr=2d arr
		   
		new_arr=Array.new
		(0..arr.length-1).each do |i|
			(0..arr[0].length-1).each do |j|
				new_arr[i][j]=arr[i][arr.length-1-j]
			end
		end

        return new_arr
    end

    def face(face, let) # face=face of cube; let =["1","2","!"]
						#this rotates a face of the cube 1,2 or prime
        arr=Array.new

        if(let=='1')
			(0..face.length-1).each do |i|
				(0..face[0].length-1).each do |j|
					arr[j][i]=face[i][j]
				end
			end
            return reverse(arr)
		
        elsif (let =='2')
            return (face(face(f,'1'),'1'))
        else
            return face(face(f,'2'),'1')
		end
    end

	
	def move(mv)
		#mv is string like eg, "r1","r2","r!"
        
		if(mv[0] == 'r')
            
            f=face(r,mv[1])
            @r[0]=f[0]
			@r[1]=f[1]
			@r[2]=f[2]

            temp = Array.new
    
            if(mv[1]=='1')
                temp[0]=@w[0][2]; temp[1]=@w[1][2]; temp[2]=@w[2][2];
                @w[0][2]=@g[0][2]; @w[1][2]=@g[1][2]; @w[2][2]=@g[2][2];
                @g[0][2]=@y[0][2]; @g[1][2]=@y[1][2]; @g[2][2]=@y[2][2];
                @y[0][2]=@b[0][2]; @y[1][2]=@b[1][2]; @y[2][2]=@b[2][2];
                @b[0][2]=temp[0]; @b[1][2]=temp[1]; @b[2][2]=temp[2];
            
            elsif(mv[1]=='2')
                temp[0]=@w[0][2]; temp[1]=@w[1][2]; temp[2]=@w[2][2];
                @w[0][2]=@g[0][2]; @w[1][2]=@g[1][2]; @w[2][2]=@g[2][2];
                @g[0][2]=@b[0][2]; @g[1][2]=@b[1][2]; @g[2][2]=@b[2][2];
                @b[0][2]=@w[0][2]; @b[1][2]=@w[1][2]; @b[2][2]=@w[2][2];
                @w[0][2]=@y[0][2]; @w[1][2]=@y[1][2]; @w[2][2]=@y[2][2];
                @y[0][2]=temp[0]; @y[1][2]=temp[1]; @y[2][2]=temp[2];
				
            else
                temp[0]=@w[0][2]; temp[1]=@w[1][2]; temp[2]=@w[2][2];
                @w[0][2]=@b[0][2]; @w[1][2]=@b[1][2]; @w[2][2]=@b[2][2];
                @b[0][2]=@y[0][2]; @b[1][2]=@y[1][2]; @b[2][2]=@y[2][2];
                @y[0][2]=@g[0][2]; @y[1][2]=@g[1][2]; @y[2][2]=@g[2][2];
                @g[0][2]=temp[0]; @g[1][2]=temp[1]; @g[2][2]=temp[2];
            end
        
        
        elsif(mv[0]=='l')
            f=face(o,mv[1]);
            @o[0]=f[0];@o[1]=f[1];@o[2]=f[2];

            temp = Array.new
    
            if(mv[1]=='1')
                temp[0]=@w[0][0]; temp[1]=@w[1][0]; temp[2]=@w[2][0];
                @w[0][0]=@g[0][0]; @w[1][0]=@g[1][0]; @w[2][0]=@g[2][0];
                @g[0][0]=@y[0][0]; @g[1][0]=@y[1][0]; @g[2][0]=@y[2][0];
                @y[0][0]=@b[0][0]; @y[1][0]=@b[1][0]; @y[2][0]=@b[2][0];
                @b[0][0]=temp[0]; @b[1][0]=temp[1]; @b[2][0]=temp[2];

            
            elsif(mv[1]=='2')
                temp[0]=@w[0][0]; temp[1]=@w[1][0]; temp[2]=@w[2][0];
                @w[0][0]=@g[0][0]; @w[1][0]=@g[1][0]; @w[2][0]=@g[2][0];
                @g[0][0]=@b[0][0]; @g[1][0]=@b[1][0]; @g[2][0]=@b[2][0];
                @b[0][0]=@w[0][0]; @b[1][0]=@w[1][0]; @b[2][0]=@w[2][0];
                @w[0][0]=@y[0][0]; @w[1][0]=@y[1][0]; @w[2][0]=@y[2][0];
                @y[0][0]=temp[0]; @y[1][0]=temp[1]; @y[2][0]=temp[2];
            
            else
				temp[0]=@w[0][0]; temp[1]=@w[1][0]; temp[2]=@w[2][0];
                @w[0][0]=@g[0][0]; @w[1][0]=@g[1][0]; @w[2][0]=@g[2][0];
                @g[0][0]=@y[0][0]; @g[1][0]=@y[1][0]; @g[2][0]=@y[2][0];
                @y[0][0]=@b[0][0]; @y[1][0]=@b[1][0]; @y[2][0]=@b[2][0];
                @b[0][0]=temp[0]; @b[1][0]=temp[1]; @b[2][0]=temp[2];
            end
        
        elsif(mv[0]=='f')

            if(mv[1]=='1')
                
                f=face(w,'1');
                @w[0]=f[0];@w[1]=f[1];@w[2]=f[2];
				temp = Array.new

                temp[0]=@o[0][2]; temp[1]=@o[1][2]; temp[2]=@o[2][2];
                @o[0][2]=@g[0][0]; @o[1][2]=@g[0][1]; @o[2][2]=@g[0][2];
                @g[0][0]=@r[2][0]; @g[0][1]=@r[1][0]; @g[0][2]=@r[0][0];
                @r[0][0]=@b[2][0]; @r[1][0]=@b[2][1]; @r[2][0]=@b[2][2];
                @b[2][0]=temp[0]; @b[2][1]=temp[1]; @b[2][2]=temp[2];
            
            elsif(mv[1]=='2')
                move("f1")
				move("f1")
            
            else
                move("f1")
				move("f1")
				move("f1")
            end
      

       elsif(mv[0]=='b')

           if(mv[1]=='1')
                
				f=face(y,'1');

                @y[0]=f[0];@y[1]=f[1];@y[2]=f[2];
                temp = Array.new

                temp[0]=@o[0][0]; temp[1]=@o[1][0]; temp[2]=@o[2][0];
                @o[0][0]=@b[0][2]; @o[1][0]=@b[0][1]; @o[2][0]=@b[0][0];
                @b[0][2]=@r[2][2]; @b[0][1]=@r[1][2]; @b[0][0]=@r[0][2];
                @r[2][2]=@g[2][0]; @r[1][2]=@g[2][1]; @r[0][2]=@g[2][2];
                @g[2][0]=temp[0]; @g[2][1]=temp[1]; @g[2][2]=temp[2];
            
            elsif(mv[1]=='2')
                move("b1"); move("b1");
            
            else
                move("b1");move("b1");move("b1");
            end

       elsif(mv[0]=='u')


           if(mv[1]=='1')
				f=face(b,'1');

			   @b[0]=f[0];@b[1]=f[1];@b[2]=f[2];

			   temp = Array.new

					temp=@w[0];
					@w[0]=@r[0];
					@r[0]=@y[0];
					@y[0]=@o[0];
					@o[0]=temp;
           
           elsif(mv[1]=='2')
                move("u1");move("u1");
           
           else
                move("u1");move("u1");move("u1");
           end
       

		elsif(mv[0]=='d')

			if(mv[1]=='1')
				f=face(g,'1');

			   @g[0]=f[0];@g[1]=f[1];@g[2]=f[2];

			   temp = Array.new

					temp=@w[2];
					@w[2]=@o[2];
					@o[2]=@y[2];
					@y[2]=@r[2];
					@r[2]=temp;
			
			elsif(mv[1]=='2')
                move("d1");move("d1");
           
			else
                move("d1");move("d1");move("d1");
			end
		end

    end
	
	def display 
		@cube.each do |i|
			i.each do |j|
				p j
			end
		end
	end
	
end


