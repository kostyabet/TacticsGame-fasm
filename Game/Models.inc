struct Ticks 
    counter     dd          0
    t1          Circle      ?
    t2          Circle      ?
    t3          Circle      ?
    t4          Circle      ?
    t5          Circle      ?
    t6          Circle      ?
    t7          Circle      ?
    t9          Circle      ?
    t8          Circle      ?
    t10         Circle      ?
    t11         Circle      ?
    t12         Circle      ?
    t13         Circle      ?
    t14         Circle      ?
    t15         Circle      ?
    t16         Circle      ?
    t17         Circle      ?
    t18         Circle      ?
    t19         Circle      ?
    t20         Circle      ?
    t21         Circle      ?
    t22         Circle      ?
    t23         Circle      ?
    t24         Circle      ?
    t25         Circle      ?
    t26         Circle      ?
    t27         Circle      ?
    t28         Circle      ?
    t29         Circle      ?
    t30         Circle      ?
    t31         Circle      ?
    t32         Circle      ? 
ends
struct TicksFont
    counter     dd          0
    t1          Circle      ?
    t2          Circle      ?
    t3          Circle      ?
    t4          Circle      ?
    t5          Circle      ?
    t6          Circle      ?
    t7          Circle      ?
    t9          Circle      ?
    t8          Circle      ?
    t10         Circle      ?
    t11         Circle      ?
    t12         Circle      ?
    t13         Circle      ?
    t14         Circle      ?
    t15         Circle      ?
    t16         Circle      ?
    t17         Circle      ?
    t18         Circle      ?
    t19         Circle      ?
    t20         Circle      ?
    t21         Circle      ?
    t22         Circle      ?
    t23         Circle      ?
    t24         Circle      ?
    t25         Circle      ?
    t26         Circle      ?
    t27         Circle      ?
    t28         Circle      ?
    t29         Circle      ?
    t30         Circle      ?
    t31         Circle      ?
    t32         Circle      ?
    t33         Circle      ?
ends
                     
TicksGameMap    dd   882, 219,\ ; main - center 1
                     960, 219,\ ; center 2
                    1038, 219,\ ; center 3
                     882, 297,\ ; center 4
                     960, 297,\ ; center 5
                    1038, 297,\ ; center 6
                     726, 375,\ ; center 7
                     804, 375,\ ; center 8
                     882, 375,\ ; center 9
                     960, 375,\ ; center 10
                    1038, 375,\ ; center 11
                    1116, 375,\ ; center 12
                    1194, 375,\ ; center 13
                     726, 453,\ ; center 14
                     804, 453,\ ; center 15
                     882, 453,\ ; center 16
                     960, 453,\ ; center 17
                    1038, 453,\ ; center 18
                    1116, 453,\ ; center 19
                    1194, 453,\ ; center 20
                     726, 531,\ ; center 21
                     804, 531,\ ; center 22
                     882, 531,\ ; center 23
                     960, 531,\ ; center 24
                    1038, 531,\ ; center 25
                    1116, 531,\ ; center 26
                    1194, 531,\ ; center 27
                     882, 609,\ ; center 28
                     960, 609,\ ; center 29
                    1038, 609,\ ; center 30
                     882, 687,\ ; center 31
                     960, 687,\ ; center 32
                    1038, 687,\ ; center 33
                     717, 757,\ ; garbage - center 1
                     765, 757,\ ; center 2
                     814, 757,\ ; center 3
                     862, 757,\ ; center 4
                     911, 757,\ ; center 5
                     959, 757,\ ; center 6
                    1008, 757,\ ; center 7
                    1056, 757,\ ; center 8
                    1105, 757,\ ; center 9
                    1153, 757,\ ; center 10
                    1202, 757,\ ; center 11
                     717, 805,\ ; center 12
                     765, 805,\ ; center 13
                     814, 805,\ ; center 14
                     862, 805,\ ; center 15
                     911, 805,\ ; center 16
                     959, 805,\ ; center 17
                    1008, 805,\ ; center 18
                    1056, 805,\ ; center 19
                    1105, 805,\ ; center 20
                    1153, 805,\ ; center 21
                    1202, 805,\ ; center 22
                     717, 853,\ ; center 23
                     765, 853,\ ; center 24
                     814, 853,\ ; center 25
                     862, 853,\ ; center 26
                     911, 853,\ ; center 27
                     959, 853,\ ; center 28
                    1008, 853,\ ; center 29
                    1056, 853,\ ; center 30
                    1105, 853  ; center 31

TicksList_Radiuses          dd          17, 15, 12, 7, 2         
TicksList_Float_c1          Ticks       ?
TicksList_Float_c2          Ticks       ?
TicksList_Float_c3          Ticks       ?
TicksList_Float_c4          Ticks       ?
TicksList_Float_c5          Ticks       ?
TicksList_Float             dd          5,\
                                        TicksList_Float_c1, TicksList_Float_c2, TicksList_Float_c3, TicksList_Float_c4, TicksList_Float_c5  
TicksList_Centers           dd          32,\
                                        64 dup(?)
TicksFontDecorate_Radiuses  dd          15, 5
TicksFontDecorate_Float_c1  TicksFont   ?
TicksFontDecorate_Float_c2  TicksFont   ?
TicksFontDecorate_Float     dd          2,\
                                        TicksFontDecorate_Float_c1, TicksFontDecorate_Float_c2
TicksFontDecorate_Centers   dd          4,\ ; 33
                                         805, 298,\ ; center 1
                                         805, 610,\ ; center 2
                                        1117, 298,\ ; center 3
                                        1117, 610   ; center 4

TicksFontList_Radiuses      dd          17, 13
TicksFontList_Float_c1      TicksFont   ?
TicksFontList_Float_c2      TicksFont   ?
TicksFontList_Float         dd          2,\
                                        TicksFontList_Float_c1, TicksFontList_Float_c2
TicksFontList_Centers       dd          33,\ ; 33
                                 882, 219,\ ; center 1
                                 960, 219,\ ; center 2
                                1038, 219,\ ; center 3
                                 882, 297,\ ; center 4
                                 960, 297,\ ; center 5
                                1038, 297,\ ; center 6
                                 726, 375,\ ; center 7
                                 804, 375,\ ; center 8
                                 882, 375,\ ; center 9
                                 960, 375,\ ; center 10
                                1038, 375,\ ; center 11
                                1116, 375,\ ; center 12
                                1194, 375,\ ; center 13
                                 726, 453,\ ; center 14
                                 804, 453,\ ; center 15
                                 882, 453,\ ; center 16
                                 960, 453,\ ; center 17
                                1038, 453,\ ; center 18
                                1116, 453,\ ; center 19
                                1194, 453,\ ; center 20
                                 726, 531,\ ; center 21
                                 804, 531,\ ; center 22
                                 882, 531,\ ; center 23
                                 960, 531,\ ; center 24
                                1038, 531,\ ; center 25
                                1116, 531,\ ; center 26
                                1194, 531,\ ; center 27
                                 882, 609,\ ; center 28
                                 960, 609,\ ; center 29
                                1038, 609,\ ; center 30
                                 882, 687,\ ; center 31
                                 960, 687,\ ; center 32
                                1038, 687   ; center 33

TicksFontMltDrList_Float_c1 TicksFont   ?
TicksFontMltDrList_Float_c2 TicksFont   ?
TicksFontMltDrList_Float    dd          2,\
                                        TicksFontMltDrList_Float_c1, TicksFontMltDrList_Float_c2
TicksFontMltDrList_Centers  dd          0,\ ; 33
                                        ?, ?,\ ; center 1
                                        ?, ?,\ ; center 2
                                        ?, ?,\ ; center 3
                                        ?, ?   ; center 4
