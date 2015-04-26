for k=1:8
    im=ones(32,32);
    Him = 32;
    Wim = 32;
    for i=2:31
        for j=2:31
            T((k-1)*(Him-2)*(Wim-2)+((i-2)*(Wim-2)+(j-1)),1)=im(i,j);
        end;
    end;
end;