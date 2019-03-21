
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hemm

The goal of `{hemm}` is to (try) to provide advices on obscure R error
messages.

## Disclaimer

The messages returned by `{hemm}` try to explain what the error is.
There is no guarantee they succeed.

So far, there are 9 errors analysed.

## Installation

You can install the dev version of {hemm} with:

``` r
remotes::install_github("ColinFay/hemm")
```

## Launch {hemm}

``` r
library(hemm)
init_hemm()
```

Wait for an error to occure:

``` r
iri
Error: object 'iri' not found
hemm...
The object you are looking for might not exist. 

iri()
Error in iri() : could not find function "iri"
hemm...
You might have forgotten to load a package or have mispelled the function name.

mean$plop
Error in mean$plop : object of type 'closure' is not subsettable
hemm...
You might have tried to use a function where another kind of object is needed.
 
"a" + "b"
Error in "a" + "b" : non-numeric argument to binary operator
hemm...
 You might have tried to pass a character where a numeric is needed.
```

## Stop `{hemm}`

``` r
stop_hemm()
```

## Contribute

You can contribute by:

  - adding examples into the [inst/en\_errors.csv](inst/en_errors.csv)
    csv of errors. On each line, the first element is a regex that
    catches the error, the other is a message (trying) to explain the
    error.

## CoC

Please note that the ‘hemm’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.
