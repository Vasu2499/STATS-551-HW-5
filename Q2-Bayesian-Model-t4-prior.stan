data {
  int<lower=0> N;
  int<lower=0> K;
  matrix[N, K] X;
  vector[N] y;
}
parameters {
  real beta_0;
  vector[K] beta_raw;  // Raw coefficients
  real<lower=0> sigma; // standard dev
}
transformed parameters {
  vector[K] beta = beta_raw * 1;  // Adjust scale if needed
}
model {
  beta_0 ~ uniform(-10, 10);
  beta_raw ~ student_t(4, 0, 1);
  y ~ normal(beta_0 + X * beta, sigma);
}
