function odd(X)
idx = X%2<1
X = floor(X)
if idx
        X=X+1
end
return X
end