data {
  int<lower=0> N;       // number of observations
  int<lower=0> K;       // number of predictors
  matrix[N, K] X;       // design matrix
  vector[N] y;          // outcome variable
}

parameters {
  real beta_0;          // intercept
  vector[K] beta;       // coefficients for predictors
  real<lower=0> sigma;  // standard deviation
}

model {
  beta_0 ~ normal(0, 5);      // prior for intercept
  beta ~ normal(0, 5);        // priors for coefficients
  sigma ~ cauchy(0, 2.5);       // prior for standard deviation
  y ~ normal(beta_0 + X * beta, sigma); // likelihood
}
