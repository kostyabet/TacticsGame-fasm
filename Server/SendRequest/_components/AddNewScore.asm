proc Server.SendRequest.AddNewScore
    stdcall Server.SendRequest.POST, apiHOST, [apiPORT], requestTpPOST, requestScoresURL, postScoresData, [postScoresDataLength]
    ret
endp