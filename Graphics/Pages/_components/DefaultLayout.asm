proc Draw.Pages.DefaultLayout
     stdcall Graphics.Draw.Shapes, font_design, font_color
     cmp     [CurentPage], MainPage
     je      .exit
     .button:
          stdcall Graphics.Draw.Shapes, exitbtn_font_design, milk_color
          stdcall Graphics.Draw.Text.Write, txt_return, brown_text_color
     .exit:
          ret
endp