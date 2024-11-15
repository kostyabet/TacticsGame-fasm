proc Draw.Pages.DefaultLayout,\
     currentPage
     stdcall Graphics.Draw.Shapes, font_design, font_color
     cmp     [currentPage], MainPage
     je      .exit
     cmp     [currentPage], LoadingPage
     je      .exit     
     cmp     [currentPage], PausePage
     je      .exit
     cmp     [currentPage], SettingsPage
     je      .exit
     .button:
          stdcall   Graphics.Draw.Components.SettingsButton
          cmp       [isGameStart], GL_FALSE
          je        @F
               stdcall   Graphics.Draw.Components.RecoveryButton
               stdcall   Graphics.Draw.Components.PauseButton
               jmp       .exit
          @@:
          stdcall Graphics.Draw.Shapes, exitbtn_font_design, exit_button_color
          stdcall Graphics.Draw.Text.Write, txt_return, brown_text_color
     .exit:
          ret
endp