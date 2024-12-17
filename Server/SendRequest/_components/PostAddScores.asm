proc Server.SendRequest.PostAddScores,\
    data, length, buffer, buflen
    stdcall Server.SendRequest.POST, apiHOST, [apiPORT], requestTpPOST, requestScoresURL,  [data], [length], [buffer], [buflen]
    ret
endp