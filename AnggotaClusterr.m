function Anggota = AnggotaCluster(DataTrain,centroid,k,Length)


for (i=1 : Length)
            for(j=1:k)
                    
                    x=(DataTrain(i,1)-centroid(j,1)).^2;
                    y=(DataTrain(i,2)-centroid(j,2)).^2;
                    hasil(j,1) = sqrt(x+y);
            end  
    
            MIN = min(hasil);
            Anggota(i,1) = ClusterMember(MIN,hasil,k);
end