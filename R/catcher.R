argh <- new.env(parent = emptyenv())

#' Initialize argh
#'
#' @param lang Language of the error to parse. Default
#'     is english.
#' @return an initialized session with argh
#' @export
#' @rdname init
#'
#' @examples
#' init_argh()

init_argh <- function(
  lang = c("en")
){
  lang <- match.arg(lang)
  argh$argh <-   read.csv(
    stringsAsFactor = FALSE,
    system.file(
      paste0(lang, "_errors.csv"),
      package = "argh"
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
stop_argh <- function(){
  options("error" = getOption("old_error"))
}

friendly_error <- function(err, lang = "en"){
  w <- which(
    vapply(
      argh$argh$error,
      function(x) grepl(x, err),
      logical(1))
  )
  if (length(w) != 0){
    cat("argh...\n")
    cat(argh$argh[w, 2], "\n")
  }
}


