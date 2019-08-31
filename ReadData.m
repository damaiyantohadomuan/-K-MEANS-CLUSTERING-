%INPUT DATA TRAINING DAN DATA TESTING 

tdfread ('TrainsetTugas2.txt');
%figure;
%scatter(X,Y);
DataTrain = [X,Y];

tdfread('TestsetTugas2.txt');
%figure;
%scatter(XTest,YTest);
DataTest = [XTest,YTest];

%=================================================

%Membuat Model Data Train 

k =4; %Inputan bebas 12

%=================================================

% Menentukkan anggota cluster awal


centroidupdate(1:k,1) = [0 0 0 0 ]; % *
centroidupdate (1:k,2)=[0 0 0 0 ];  % *
centroid(1:k,1) = [15 5 30  35]; % * //INPUT SEMBARANG
centroid(1:k,2) = [5 30 32  7] ; % * //INPUT SEMBARANG

%=================================================

TrainLength=688; % *
TestLength=100;


while (CekStatus(centroidupdate,centroid)==0)
    centroidupdate=centroid;

    %menentukkan anggota cluster
    Anggota=AnggotaClusterr(DataTrain,centroidupdate,k,TrainLength); %2

    %Menentukkan centroid baru dengan cara rata2 anggota centroid 
            Combine = [DataTrain Anggota]; %*
            counter1=0; counter2=0;  counter3=0;  counter4=0; %*
            x1=0; x2=0; x3=0; x4=0;  %*
            y1=0; y2=0; y3=0; y4=0;  %*
            for(i=1:TrainLength) %*
                if(Combine(i,3)==1)
                    x1 = x1+Combine(i,1);
                    y1 = y1+Combine(i,2);
                    counter1=counter1+1;
                elseif(Combine(i,3)==2)
                    x2=  x2+Combine(i,1);
                    y2=  y2+Combine(i,2);
                    counter2=counter2+1;
                elseif(Combine(i,3)==3) 
                    x3 = x3+Combine(i,1);
                    y3= y3+Combine(i,2);
                    counter3=counter3+1;
                elseif(Combine(i,3)==4) 
                    x4 = x4+Combine(i,1);
                    y4= y4+Combine(i,2);
                    counter4=counter4+1; 
                end
            end
                
                if(counter1==0) %*
                    counter1=1;
                end
                if (counter2==0)
                    counter2=1;
                end
                if (counter3==0) 
                    counter3=1;
                end
                if (counter4==0) 
                    counter4=1;
                end
             
           x1=x1/counter1; y1=y1/counter1; %*      
           x2=x2/counter2; y2=y2/counter2; 
           x3=x3/counter3; y3=y3/counter3; 
           x4=x4/counter4; y4=y4/counter4;
                  
    
    centroid(1:k,1) = [x1 x2 x3 x4 ];%*
    centroid(1:k,2) = [y1 y2 y3 y4 ];   
 
end

figure
scatter(Combine(1:TrainLength,1),Combine(1:TrainLength,2),20,Combine(1:TrainLength,3))

%DATA TESTING
for(i=1:100)
      X=AnggotaClusterr(DataTest,centroid,k,TestLength);
end

HASILTEST = [DataTest X];
figure
scatter(HASILTEST(1:100,1),HASILTEST(1:100,2),20,HASILTEST(1:100,3));
x = HASILTEST(1:100,1);
y = HASILTEST(1:100,2);
Centroid = HASILTEST(1:100,3);

%MEMBUAT TEXT FILE 
prediksi = table(x,y,Centroid);
writetable(prediksi,'HASILTESTING.txt','Delimiter','\t','WriteRowNames',true);
type  'HASILTESTING.txt' ;

%POSISI CENTROID FINAL
disp('=====================================');
disp('POSISI CENTROID FINAL');
disp(centroid);

fprintf('centroid 1 : %d %d \n ' ,centroid(1,1) , centroid(1,2))
fprintf('centroid 2 : %d %d \n ' ,centroid(2,1) , centroid(2,2))
fprintf('centroid 3 : %d %d \n ' ,centroid(3,1) , centroid(3,2))
fprintf('centroid 4 : %d %d \n ' ,centroid(4,1) , centroid(4,2))

        
        


