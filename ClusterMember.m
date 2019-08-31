function ClstrNmbr = ClusterMember(MIN,hasil,k)

ClstrNmbr=[];

for (i=1:k) 
    if (MIN==hasil(i,1));
        ClstrNmbr=i;
    end;
end;
