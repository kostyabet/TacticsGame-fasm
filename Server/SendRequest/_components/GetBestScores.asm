proc Server.SendRequest.GetBestScores,\
    data, length, buffer, buflen
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestBestScoresURL, [data], [length], [buffer], [buflen]
    ret
endp