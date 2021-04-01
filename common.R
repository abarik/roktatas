library(htmltools)

options(encoding="UTF-8")

thumbnail <- function(title, img, href, caption = TRUE) {
  div(class = "col-sm-4",
      a(class = "thumbnail", title = title, href = href,
        img(src = img),
        div(class = ifelse(caption, "caption", ""),
            ifelse(caption, title, "")
        )
      )
  )
}

card <- function(title, img, text) {
  div(class = "card", style="width:300px",
      img(class="card-img-top", style="width:100%", src = img),
      div(class="card-body", 
          h4(class="card-title", title),
          p(class="card-text", text))
  )
}

# egyetlen kurzuskártya
kurzus <- function(img, tanfolyam, kod, nap.1, nap.2, ora, dij, hatarido, link) {
  
  div(class="card border-primary", style="width: 18rem;",
      img(class="card-img-top", src=img),
      div(class="card-body",
          h5(class="card-title", tanfolyam),
          h6(class="card-subtitle mb-2 text-muted", "Kurzuskód: ", kod)),
      htmltools::tags$ul(class="list-group list-group-flush",
        htmltools::tags$li(class="list-group-item", "Díj: ", dij, " Ft / ", ora, " óra"),
        htmltools::tags$li(class="list-group-item", "1. nap: ", nap.1, 
                           htmltools::tags$br(), "2. nap: ", nap.2),
        htmltools::tags$li(class="list-group-item", "Jelentkezés ", hatarido)),
      div(class="card-body",
          a(href=link, class="card-link", "Részletek")))
          # ,
          # a(href="#", class="card-link", "Jelentkezés")))
                  
}
  
## kurzusok összes kiírása
kurzusok <- function(tbl) {
  ret <- ""
  for (i in 1:nrow(tbl)) {
    ret <- paste(sep="\n", ret, 
                  kurzus(img = "image/rkep.jpg", tanfolyam = tbl$tanfolyam[i], kod = tbl$kod[i], 
                         nap.1 = tbl$nap.1[i], nap.2 = tbl$nap.2[i], ora = tbl$ora[i], dij = tbl$dij[i], 
                         hatarido = tbl$hatarido[i], link = tbl$link[i])
    )
  }
  return(ret)
}
