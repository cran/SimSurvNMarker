// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include "SimSurvNMarker_types.h"
#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// eval_marker
void eval_marker(SEXP B, SEXP m, SEXP Sout);
RcppExport SEXP _SimSurvNMarker_eval_marker(SEXP BSEXP, SEXP mSEXP, SEXP SoutSEXP) {
BEGIN_RCPP
    Rcpp::traits::input_parameter< SEXP >::type B(BSEXP);
    Rcpp::traits::input_parameter< SEXP >::type m(mSEXP);
    Rcpp::traits::input_parameter< SEXP >::type Sout(SoutSEXP);
    eval_marker(B, m, Sout);
    return R_NilValue;
END_RCPP
}
// get_commutation
Rcpp::NumericMatrix get_commutation(unsigned const n, unsigned const m);
RcppExport SEXP _SimSurvNMarker_get_commutation(SEXP nSEXP, SEXP mSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< unsigned const >::type n(nSEXP);
    Rcpp::traits::input_parameter< unsigned const >::type m(mSEXP);
    rcpp_result_gen = Rcpp::wrap(get_commutation(n, m));
    return rcpp_result_gen;
END_RCPP
}
// get_gl_rule
Rcpp::List get_gl_rule(unsigned const n);
RcppExport SEXP _SimSurvNMarker_get_gl_rule(SEXP nSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< unsigned const >::type n(nSEXP);
    rcpp_result_gen = Rcpp::wrap(get_gl_rule(n));
    return rcpp_result_gen;
END_RCPP
}
// glq
SEXP glq(SEXP lb, SEXP ub, SEXP nodes, SEXP weights, SEXP f, SEXP rho);
RcppExport SEXP _SimSurvNMarker_glq(SEXP lbSEXP, SEXP ubSEXP, SEXP nodesSEXP, SEXP weightsSEXP, SEXP fSEXP, SEXP rhoSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< SEXP >::type lb(lbSEXP);
    Rcpp::traits::input_parameter< SEXP >::type ub(ubSEXP);
    Rcpp::traits::input_parameter< SEXP >::type nodes(nodesSEXP);
    Rcpp::traits::input_parameter< SEXP >::type weights(weightsSEXP);
    Rcpp::traits::input_parameter< SEXP >::type f(fSEXP);
    Rcpp::traits::input_parameter< SEXP >::type rho(rhoSEXP);
    rcpp_result_gen = Rcpp::wrap(glq(lb, ub, nodes, weights, f, rho));
    return rcpp_result_gen;
END_RCPP
}
// get_ns_ptr
Rcpp::XPtr<splines::ns> get_ns_ptr(const arma::vec& knots, arma::vec const& boundary_knots, bool const intercept);
RcppExport SEXP _SimSurvNMarker_get_ns_ptr(SEXP knotsSEXP, SEXP boundary_knotsSEXP, SEXP interceptSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< const arma::vec& >::type knots(knotsSEXP);
    Rcpp::traits::input_parameter< arma::vec const& >::type boundary_knots(boundary_knotsSEXP);
    Rcpp::traits::input_parameter< bool const >::type intercept(interceptSEXP);
    rcpp_result_gen = Rcpp::wrap(get_ns_ptr(knots, boundary_knots, intercept));
    return rcpp_result_gen;
END_RCPP
}
// ns_cpp
arma::mat ns_cpp(arma::vec const& x, SEXP ns_ptr);
RcppExport SEXP _SimSurvNMarker_ns_cpp(SEXP xSEXP, SEXP ns_ptrSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< arma::vec const& >::type x(xSEXP);
    Rcpp::traits::input_parameter< SEXP >::type ns_ptr(ns_ptrSEXP);
    rcpp_result_gen = Rcpp::wrap(ns_cpp(x, ns_ptr));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_SimSurvNMarker_eval_marker", (DL_FUNC) &_SimSurvNMarker_eval_marker, 3},
    {"_SimSurvNMarker_get_commutation", (DL_FUNC) &_SimSurvNMarker_get_commutation, 2},
    {"_SimSurvNMarker_get_gl_rule", (DL_FUNC) &_SimSurvNMarker_get_gl_rule, 1},
    {"_SimSurvNMarker_glq", (DL_FUNC) &_SimSurvNMarker_glq, 6},
    {"_SimSurvNMarker_get_ns_ptr", (DL_FUNC) &_SimSurvNMarker_get_ns_ptr, 3},
    {"_SimSurvNMarker_ns_cpp", (DL_FUNC) &_SimSurvNMarker_ns_cpp, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_SimSurvNMarker(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
