#' @include all-classes.R
#' @include init-methods.R
#' @include all-generics.R
#' @include all-coercions.R
#' @include GaVar.R
#' @include GaOperator.R
#' @include GaOperand.R
NULL

setMethod(
  f = "GaExpr",
  signature = c("character", "character", "ANY"),
  definition = function(.Object, gaOperator, gaOperand) {
    gaVar <- GaVar(.Object)
    if (class(gaVar) == "gaDimVar") {
      gaOperator <- GaDimOperator(gaOperator)
      gaOperand <- GaOperand(as.character(gaOperand))
      gaExprClass <- "gaDimExpr"
    } else if (class(gaVar) == "gaMetVar") {
      gaOperator <- GaMetOperator(gaOperator)
      gaOperand <- GaOperand(as.numeric(gaOperand))
      gaExprClass <- "gaMetExpr"
    } else {
      stop(
        paste("Unsupported .gaVar class", class(gaVar), sep=": ")
      )
    }
    new(
      Class = gaExprClass,
      gaVar = gaVar,
      gaOperator = gaOperator,
      gaOperand = gaOperand
    )
  }
)

