;
; Win1251 -> OEM866 cyrillic encoding macros for FASM
;
; Usage:
;
;   myString    ds      'Текст на русском языке'
;   myString    ds-     'Текст на русском языке'
;
; Win1251 characters that don't have equivalents in OEM866 are replaced with "?".
;
; There are a few characters in OEM866 that look similar to those in Win1251 but
; are not equivalent semantically. Default behaviour is to ignore the semantics
; and match them to each other. Using "-" modifier ensures proper semantics by
; causing such characters to be replaced with "?" as well.
;
; © Dmitry Onoshko, 2024
;

match , { local OEM866
virtual
OEM866::
  db $FF, $F6, $F7, 'J', $FD, '?', '|', '?', $F0, '?', $F2, '?', '?', '?', '?', $F4
  db $F8, '?', 'I', 'i', '?', '?', '?', $FA, $F1, $FC, $F3, '?', 'j', 'S', 's', $F5
  times $20 db $80 + % - 1
  times $10 db $A0 + % - 1
  times $10 db $E0 + % - 1
end virtual

virtual
OEM866S::
  db $FF, $F6, $F7, '?', $FD, '?', '?', '?', $F0, '?', $F2, '?', '?', '?', '?', $F4
  db $F8, '?', '?', '?', '?', '?', '?', $FA, $F1, $FC, $F3, '?', '?', '?', '?', $F5
  times $20 db $80 + % - 1
  times $10 db $A0 + % - 1
  times $10 db $E0 + % - 1
end virtual

struc ds Params&
\{ \local c, p, t
  define p 0
  match =0 -d , p Params \\{ restore p
    . db d
    define t OEM866S \\}
  match =0 d , p Params \\{ restore p
    . db d
    define t OEM866 \\}
  match =0 , p \\{ 'Syntax error.' \\}
  repeat $ - .
    load c byte from . + % - 1
    if c > $9F
      load c byte from t:c - $A0
      store byte c at . + % - 1
    end if
  end repeat
\}

macro ds Params&
\{ \local ..a
  ..a ds Params
\}
}