function even(X)
    idx = X%2<1
    println(idx)
    X = floor(X)+1
    if(idx)
        X=X+1
    end
    
return X
end