hemm <- new.env(parent = emptyenv())

#' Initialize hemm
#'
#' @param lang Language of the error to parse. Default
#'     is english.
#' @return an initialized session with hemm
#' @export
#' @rdname init
#'
#' @examples
#' init_hemm()

init_hemm <- function(
  lang = c("en")
){
  lang <- match.arg(lang)
  hemm$hemm <-   read.csv(
    stringsAsFactor = FALSE,
    system.file(
      paste0(lang, "_errors.csv"),
      package = "hemm"
    )
  )
  options("old_error" = getOption("error"))
  options( error = function(...){
    err <- geterrmessage()
    friendly_error(err)
  })

}

#' @export
#' @rdname init
stop_hemm <- function(){
  options("error" = getOption("old_error"))
}

friendly_error <- function(err, lang = "en"){
  w <- which(
    vapply(
      hemm$hemm$error,
      function(x) grepl(x, err),
      logical(1))
  )
  if (length(w) != 0){
    cat("hemm...\n")
    cat(hemm$hemm[w, 2], "\n")
  }
}


