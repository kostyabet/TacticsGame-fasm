struct Id
    id  dd  ?
ends

struct Score
    score_id    dd  ?
    points      dd  ?
ends

struct BestScore
    score_id    dd  ?
    points      dd  ?
    login       dd  ?
ends

PlayerId        Id      ?
PlayerScores    dd      ? ; Score -s 
BestScores      dd      ? ; BestScore
