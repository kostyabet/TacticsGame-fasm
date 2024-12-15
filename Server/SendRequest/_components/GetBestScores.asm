proc Server.SendRequest.GetBestScores
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestBestScoresURL, 0, 0
    ret
endp