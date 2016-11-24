w80dni <- readLines("http://www.gutenberg.org/cache/epub/103/pg103.txt")
slowa <- strsplit(w80dni,"[^A-Za-z]+")
slowa <- unlist(slowa)
fogg <- grep("Fogg", slowa, value = FALSE)
slowa_z_fogg <- c(slowa[fogg - 2], slowa[fogg-1], slowa[fogg], slowa[fogg+1])
wordcloud(slowa_z_fogg)
czestosc <- sort(table(unlist(slowa)), decreasing = TRUE)
html_text(html_nodes(read_html("http://www.filmweb.pl/premiere#d-4"), ".gwt-filmPage"))
html_text(html_nodes(read_html("http://www.pracuj.pl/praca/nauczyciel;kw"), ".o-list_item_link_name"))
html_attrs(html_nodes(read_html("http://www.pracuj.pl/praca/nauczyciel;kw"), ".o-list_item_link_name"))
tablice <- html_table(html_nodes(read_html("https://pl.wikipedia.org/wiki/Reprezentacja_Polski_w_piłce_nożnej_mężczyzn"), 
                     ".wikitable"), fill = TRUE)
fifa <- tablice[(sapply(tablice, ncol) == 14)]
fifa <- matrix(fifa)

stat <- search_eurostat("transport")
labell <- label_eurostat(get_eurostat("road_go_ta_rl"))

spread(labell, time)
