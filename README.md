
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ouch

The goal of `{ouch}` is to (try) to provide advices on obscure R error
messages.

## Disclaimer

The messages returned by `{ouch}` try to explain what the error is.
There is no guarantee they succeed.

So far, there are 10 errors analysed.

Also, please note that this package will override any other error
handler running, until you call `stop_ouch()` (but I’m working on that).

## Installation

You can install the dev version of {ouch} with:

``` r
remotes::install_github("ColinFay/ouch")
```

## Launch {ouch}

``` r
library(ouch)
init_ouch()
```

Wait for an error to occure:

``` r
> iri
Error: object 'iri' not found
ouch...
The object you are looking for might not exist. 
> library(dpylr)
Error in library(dpylr) : there is no package called ‘dpylr’
ouch...
You might have forgotten to install a package or have mispelled the package name 
> "a" + "b"
Error in "a" + "b" : non-numeric argument to binary operator
ouch...
You might have tried to use a character vector where a numeric is needed. 
> mean$Sepal.Length
Error in mean$Sepal.Length : object of type 'closure' is not subsettable
ouch...
You might have called `$` on a function.
...
```

## Stop `{ouch}`

``` r
stop_ouch()
```

## Contribute

You can contribute by:

  - adding examples into the [inst/en\_errors.csv](inst/en_errors.csv)
    csv of errors. On each line, the first element is a regex that
    catches the error, the other is a message (trying) to explain the
    error.

## CoC

Please note that the ‘ouch’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.
