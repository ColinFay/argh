ouch <- new.env(parent = emptyenv())

#' Initialize ouch
#'
#' @param lang Language of the error to parse. Default
#'     is english.
#' @return an initialized session with ouch
#' @export
#' @rdname init
#'
#' @examples
#' init_ouch()

init_ouch <- function(
  lang = c("en")
){
  lang <- match.arg(lang)
  ouch$ouch <-   read.csv(
    stringsAsFactor = FALSE,
    system.file(
      paste0(lang, "_errors.csv"),
      package = "ouch"
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
stop_ouch <- function(){
  options("error" = getOption("old_error"))
}

friendly_error <- function(err, lang = "en"){
  w <- which(
    vapply(
      ouch$ouch$error,
      function(x) grepl(x, err),
      logical(1))
  )
  if (length(w) != 0){
    cat("ouch...\n")
    cat(ouch$ouch[w, 2], "\n")
  }
}


