proc Server.SendRequest.GetAllUserScores
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestScoresURL, getUserIdData, [getUserIdDataLength]
    ret
endp