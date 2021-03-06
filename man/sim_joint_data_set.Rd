% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim.R
\name{sim_joint_data_set}
\alias{sim_joint_data_set}
\title{Simulate Individuals from a Joint Survival and Marker Model}
\usage{
sim_joint_data_set(
  n_obs,
  B,
  Psi,
  omega,
  delta,
  alpha,
  sigma,
  gamma,
  b_func,
  m_func,
  g_func,
  r_z,
  r_left_trunc,
  r_right_cens,
  r_n_marker,
  r_x,
  r_obs_time,
  y_max,
  use_fixed_latent = TRUE,
  m_func_surv = m_func,
  g_func_surv = g_func,
  gl_dat = get_gl_rule(30L),
  tol = .Machine$double.eps^(1/4)
)
}
\arguments{
\item{n_obs}{integer with the number of individuals to draw.}

\item{B}{coefficient matrix for time-varying fixed effects.
Use \code{NULL} if there is no effect.}

\item{Psi}{the random effects' covariance matrix.}

\item{omega}{numeric vector with coefficients for the baseline hazard.}

\item{delta}{coefficients for fixed effects in the log hazard.}

\item{alpha}{numeric vector with association parameters.}

\item{sigma}{the noise's covariance matrix.}

\item{gamma}{coefficient matrix for the non-time-varying fixed effects.
Use \code{NULL} if there is no effect.}

\item{b_func}{basis function for the baseline hazard like \code{\link{poly}}.}

\item{m_func}{basis function for \code{U} like \code{\link{poly}}.}

\item{g_func}{basis function for \code{B} like \code{\link{poly}}.}

\item{r_z}{generator for the covariates in the log hazard. Takes an
integer for the individual's id.}

\item{r_left_trunc}{generator for the left-truncation time.
Takes an integer for the individual's id.}

\item{r_right_cens}{generator for the right-censoring time. Takes an
integer for the individual's id.}

\item{r_n_marker}{function to generate the number of observed markers.
Takes an integer for the individual's id.}

\item{r_x}{generator for the covariates in for the markers. Takes an
integer for the individual's id.}

\item{r_obs_time}{function to generate the observations times given the
number of observed markers. Takes an
integer for the number of markers and an integer
for the individual's id.}

\item{y_max}{maximum survival time before administrative censoring.}

\item{use_fixed_latent}{logical for whether to include the
\eqn{\vec 1^\top(diag(\vec \alpha) \otimes \vec x_i^\top)vec(\Gamma)}
term in the log hazard. Useful if derivatives of
the latent mean should be used.}

\item{m_func_surv}{basis function for \code{U} like \code{\link{poly}}
in the log hazard. Can be different from
\code{m_func}. Useful if derivatives of the latent
mean should be used.}

\item{g_func_surv}{basis function for \code{B} like \code{\link{poly}}
in the log hazard. Can be different from
\code{g_func}. Useful if derivatives of the latent
mean should be used.}

\item{gl_dat}{Gauss–Legendre quadrature data.
See \code{\link{get_gl_rule}}.}

\item{tol}{convergence tolerance passed to \code{\link{uniroot}}.}
}
\description{
Simulates individuals from the following model

\deqn{\vec U_i \sim N^{(K)}(\vec 0, \Psi)}
\deqn{\vec Y_{ij} \mid \vec U_i = \vec u_i \sim N^{(r)}(\vec \mu_i(s_{ij}, \vec u_i), \Sigma)}
\deqn{h(t \mid \vec u) = \exp(\vec\omega^\top\vec b(t) + \vec\delta^\top\vec z_i +
  \vec 1^\top(diag(\vec \alpha) \otimes \vec x_i^\top)vec(\Gamma) +
  \vec 1^\top(diag(\vec \alpha) \otimes \vec g(t)^\top)vec(B) +
  \vec 1^\top(diag(\vec \alpha) \otimes \vec m(t)^\top)\vec u)}

with

\deqn{\vec\mu_i(s, \vec u) = (I \otimes \vec x_i^\top)vec(\Gamma) + \left(I \otimes \vec g(s)^\top\right)vec(B) + \left(I \otimes \vec m(s)^\top\right) \vec u}

where \eqn{h(t \mid \vec u)} is the conditional hazard function.
}
\examples{
#####
# example with polynomial basis functions
b_func <- function(x){
  x <- x - 1
  cbind(x^3, x^2, x)
}
g_func <- function(x){
  x <- x - 1
  cbind(x^3, x^2, x)
}
m_func <- function(x){
  x <- x - 1
  cbind(x^2, x, 1)
}

# parameters
delta <- c(-.5, -.5, .5)
gamma <- matrix(c(.25, .5, 0, -.4, 0, .3), 3, 2)
omega <- c(1.4, -1.2, -2.1)
Psi <- structure(c(0.18, 0.05, -0.05, 0.1, -0.02, 0.06, 0.05, 0.34, -0.25,
                   -0.06, -0.03, 0.29, -0.05, -0.25, 0.24, 0.04, 0.04,
                   -0.12, 0.1, -0.06, 0.04, 0.34, 0, -0.04, -0.02, -0.03,
                   0.04, 0, 0.1, -0.08, 0.06, 0.29, -0.12, -0.04, -0.08,
                   0.51), .Dim = c(6L, 6L))
B <- structure(c(-0.57, 0.17, -0.48, 0.58, 1, 0.86), .Dim = 3:2)
sig <- diag(c(.6, .3)^2)
alpha <- c(.5, .9)

# generator functions
r_n_marker <- function(id)
  # the number of markers is Poisson distributed
  rpois(1, 10) + 1L
r_obs_time <- function(id, n_markes)
  # the observations times are uniform distributed
  sort(runif(n_markes, 0, 2))
r_z <- function(id)
  # return a design matrix for a dummy setup
  cbind(1, (id \%\% 3) == 1, (id \%\% 3) == 2)
r_x <- r_z # same covariates for the fixed effects
r_left_trunc <- function(id)
  # no left-truncation
  0
r_right_cens <- function(id)
  # right-censoring time is exponentially distributed
  rexp(1, rate = .5)

# simulate
gl_dat <- get_gl_rule(30L)
y_max <- 2
n_obs <- 100L
set.seed(1)
dat <- sim_joint_data_set(
  n_obs = n_obs, B = B, Psi = Psi, omega = omega, delta = delta,
  alpha = alpha, sigma = sig, gamma = gamma, b_func = b_func,
  m_func = m_func, g_func = g_func, r_z = r_z, r_left_trunc = r_left_trunc,
  r_right_cens = r_right_cens, r_n_marker = r_n_marker, r_x = r_x,
  r_obs_time = r_obs_time, y_max = y_max)

# checks
stopifnot(
  NROW(dat$survival_data) == n_obs,
  NROW(dat$marker_data) >= n_obs,
  all(dat$survival_data$y <= y_max))

}
\seealso{
See the examples on Github at
\url{https://github.com/boennecd/SimSurvNMarker/tree/master/inst/test-data}
or this vignette
\code{vignette("SimSurvNMarker", package = "SimSurvNMarker")}.

\code{\link{sim_marker}} and \code{\link{surv_func_joint}}
}
