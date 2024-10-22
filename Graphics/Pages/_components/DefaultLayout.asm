proc Draw.Pages.DefaultLayout
     stdcall Graphics.Draw.Shapes, font_design, font_color
     cmp     [CurentPage], MainPage
     je      .exit
     cmp     [CurentPage], LoadingPage
     je      .exit     
     .button:
          stdcall Graphics.Draw.Shapes, exitbtn_font_design, exit_button_color
          stdcall Graphics.Draw.Text.Write, txt_return, brown_text_color
     .exit:
          ret
endp