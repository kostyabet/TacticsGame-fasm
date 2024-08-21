struct Point   
    x   GLfloat     ?
    y   GLfloat     ?
ends

;====================== Rect ======================
struct RectDesign
    v1              Point   ?
    v2              Point   ?
    v3              Point   ?
    v4              Point   ?
    borderRadius    dd      ?
ends

MIN_X   dd  0
MIN_Y   dd  0
MAX_X   dd  1920
MAX_Y   dd  1080

; ============= Book ============= ;
    ; == Root == ;
Book_Root       dd  350, 300, 370, 968
    ; = Stroke = ;
Book_Strk       dd  353, 311, 367, 313
Book_strk_step  dd  6
Book_strk_cnt   dd  100