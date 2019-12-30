#' numeric to Chinese
#'
#' @param number integer
#' @param type upper or lower chinese number
#'
#' @return character
#' @export
#'
#' @examples numeric2Chinese(123)
numeric2Chinese <- function(number, type = "upper") {
  stopifnot(is.numeric(number) && length(number) == 1)
  stopifnot(type %in% c("upper", "lower"))

  if (nchar(number) > 16)
    stop("The length of number MUST less than 16!", call. = FALSE)

  if (type == "upper") {
    .chnUnitChar <- .chnUnitCharUpper
  } else {
    .chnUnitChar <- .chnUnitCharLower
  }

  if (nchar(as.character(number)) == 1)
    return(chnNumChar(number, type = type))

  strNum <- ""
  while (number > 0) {
    for (section in unname(.chnUnitSection)) {
      if (number >= section) {
        secNum <- number %/% section
        for (unit in unname(.chnUnitChar)) {
          if (secNum >= unit) {
            uniNum <- secNum %/% unit
            strNum <- paste0(strNum,
              ifelse(secNum == 0, "", chnNumChar(uniNum, type = type)),
              names(.chnUnitChar[.chnUnitChar == unit]))
            secNum <- secNum %% unit
          }
        }
        strNum <- paste0(strNum,
          ifelse(secNum == 0, "", chnNumChar(secNum, type = type)),
          names(.chnUnitSection[.chnUnitSection == section]))
      }
      number <- number %% section
    }

    for (unit in unname(.chnUnitChar)) {
      if (number >= unit) {
        uniNum <- number %/% unit
        strNum <- paste0(strNum,
          ifelse(uniNum == 0, "", chnNumChar(uniNum, type = type)),
          names(.chnUnitChar[.chnUnitChar == unit]))
        number <- number %% unit
      }
    }
    strNum <- paste0(strNum, ifelse(number == 0, "", chnNumChar(number, type = type)))
    number <- 0
  }
  strNum
}

chnNumChar <- function(num, type = "upper") {
  stopifnot(nchar(num) == 1 && is.numeric(num))

  switch(type,
    lower = {chnNums <- .chnLowNums},
    upper = {chnNums <- .chnUppNums},
    stop(paste0(type, " is not valid argument!"), call. = FALSE)
  )

  ind <- which(unname(chnNums) == num)
  names(chnNums[ind])
}

.chnLowNums <- c(
  "\u96f6" = 0, "\u4e00" = 1,
  "\u4e8c" = 2, "\u4e09" = 3,
  "\u56db" = 4, "\u4e94" = 5,
  "\u516d" = 6, "\u4e03" = 7,
  "\u516b" = 8, "\u4e5d" = 9
)

.chnUppNums <- c(
  "\u96f6" = 0, "\u58f9" = 1,
  "\u8cb3" = 2, "\u53c3" = 3,
  "\u8086" = 4, "\u4f0d" = 5,
  "\u9678" = 6, "\u67d2" = 7,
  "\u634c" = 8, "\u7396" = 9
)

.chnUnitSection <- c(
  "\u5146" = 1000000000000,
  "\u5104" = 100000000,
  "\u842c" = 10000
)

.chnUnitCharUpper <- c(
  "\u4edf" = 1000,
  "\u4f70" = 100,
  "\u62fe" = 10
)

.chnUnitCharLower <- c(
  "\u5343" = 1000,
  "\u767e" = 100,
  "\u5341" = 10
)
