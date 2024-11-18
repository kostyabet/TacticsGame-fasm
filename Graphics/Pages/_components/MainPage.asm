proc Draw.Pages.MainPage
	.book:
		stdcall Graphics.Draw.Shapes, book_root_design,      book_root_color
		stdcall Graphics.Draw.Shapes.Rect, book_strk_design, book_strk_color
		stdcall Graphics.Draw.Shapes, book_corner_design,    book_endg_color
		stdcall Graphics.Draw.Shapes, book_brdcrn_design,    book_ebrd_color
		stdcall Graphics.Draw.Shapes, book_brdfnt_design,    book_endg_color
		stdcall Graphics.Draw.Shapes, book_endg_design,    	 book_endg_color
		stdcall Graphics.Draw.Shapes, book_brd_design,   	 book_ebrd_color
		stdcall Graphics.Draw.Shapes, book_flgpl_design,  	 book_flgpl_color
	.buttons:
		stdcall Graphics.Draw.Shapes, button_play_design,  play_button_color
		stdcall Graphics.Draw.Shapes, button_about_design, about_button_color
		stdcall Graphics.Draw.Shapes, button_stngs_design, settings_button_color
		stdcall Graphics.Draw.Shapes, button_exit_design, exit_button_color
	.headline:
		stdcall Graphics.Draw.Text.Write, txt_headline_bc, headline_bc_color
		stdcall Graphics.Draw.Text.Write, txt_headline, headline_color
	.buttonText:
		stdcall Graphics.Draw.Text.Write, txt_play, btn_text_color
		stdcall Graphics.Draw.Text.Write, txt_about, btn_text_color
		stdcall Graphics.Draw.Text.Write, txt_settings, btn_text_color
		stdcall Graphics.Draw.Text.Write, txt_Mexit, btn_text_color
	.bookText:
		stdcall Graphics.Draw.Text.Write, txt_title, book_title_color
	.boat: 
        stdcall Graphics.Draw.Sprite, [boatbook_texture], mp_boatsprite_design
    ret
endp