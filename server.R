
library(shiny)

shinyServer(function(input, output, session) {
  
  xymax <- 100

  output$text <- renderUI({
    withMathJax(helpText(h4(paste0("The distance is defined on \\( \\mathbb{R}_+^2 \\) by \\( d_p(x, y) = \\| x - y \\|_p\\).")))) 
  })
  output$text0 <- renderUI({
    withMathJax(helpText(h4(paste0("The distance is defined \\( \\mathbb{R}_+^2 \\) by \\( d_{0,p}(x, y) = \\| \\sup(x, y) \\|_p - \\min(\\| x \\|_p, \\| y \\|_p)\\)."))))
  })
  output$text1 <- renderUI({
    withMathJax(helpText(h4(paste0("The distance is defined \\( \\mathbb{R}_+^2 \\) by \\(d_{1,p}(x, y) = 2 \\| \\sup(x, y) \\|_p - \\| x \\|_p - \\| y \\|_p\\)."))))
  })
  output$text2 <- renderUI({
    withMathJax(helpText(h4(paste0("The distance is defined \\( \\mathbb{R}_+^2 \\) by \\(d_{2,p}(x, y) = \\sqrt{\\| \\sup(x, y) \\|^2_p - \\| x \\|_p \\| y \\|_p}\\)."))))
  })

  pl <- reactive({ plot_ball(input$x + 1i*input$y, 
                             input$radius, 
                             d = input$tabs, 
                             p = input$p,
                             #n = input$resolution, 
                             lty = 1, 
                             method = "minkowski", 
                             xlim = c(0, xymax),
                             ylim = c(0, xymax), 
                             col = "orange", 
                             plot.it = FALSE)
  })
  
  df <- reactive({ data.frame(x = pl()$x, y = pl()$y) })

  gg <- df %>% 
        ggvis(~x, ~y) %>% 
        layer_paths(fill := "darkblue") %>% 
        scale_numeric("x", domain = c(0, xymax), nice = FALSE, clamp = TRUE) %>%
        scale_numeric("y", domain = c(0, xymax), nice = FALSE, clamp = TRUE) %>%
        set_options(width = 500, height = 500)
  gg %>% bind_shiny("ggvis", "ggvis_ui")
  gg %>% bind_shiny("ggvis0", "ggvis0_ui")
  gg %>% bind_shiny("ggvis1", "ggvis1_ui")
  gg %>% bind_shiny("ggvis2", "ggvis2_ui")

  #output$ballPlot2 <- renderPlot({
  #  plot_ball(input$x + 1i*input$y, 
  #            input$radius, 
  #            d = "d2", 
  #            p = input$p,
  #            n = input$resolution, 
  #            lty = 1, 
  #            method = "minkowski", 
  #            xlim = c(0, xymax),
  #            ylim = c(0, xymax), 
  #            col = "orange")
  #}, width=400, height=400)

})
