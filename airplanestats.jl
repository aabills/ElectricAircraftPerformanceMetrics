using SpecialFunctions
function mygamma(x,alpha,mu,k)
    probability=((k*gamma(alpha))^-1)*(Complex((x-mu)/k)^(alpha-1))*exp(-(x-mu)/k);
    if(!isreal(probability))
        probability=0;
    end
    return probability
end

function mybeta(x, alpha, beta_in, mu, k)
    probability=(1/(k*beta(alpha,beta_in)))*(Complex((x-mu)/k)^(alpha-1))*(Complex(1-((x-mu)/k)^(beta_in-1)));
        if(!isreal(probability))
        probability=0;
    end
    return probability
end

function mynormal(x,mu,sigma)
    probability=(1/sqrt(2*sigma*sigma*pi))*exp(-((x-mu)^2)/(2*sigma*sigma));
    if(!isreal(probability))
        probability=0;
    end
    return probability
end

pdf_out=ones(10000,1);

for n=1:10000
    pdf_out[n]=mygamma(n,1,1,576,);
end

using Plots
plot(pdf_out);

