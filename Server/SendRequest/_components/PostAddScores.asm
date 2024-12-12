proc Server.SendRequest.PostAddScores
    stdcall Server.SendRequest.POST, apiHOST, [apiPORT], requestTpPOST, requestScoresURL, postScoresData, [postScoresDataLength]
    ret
endp