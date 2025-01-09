console.log("hello")
console.log(selectArtists.query.servedFromCache)

const obj =  {message: "true",
        boolean: selectArtists.servedFromCache,
             lastReceived: selectArtists.lastReceivedFromResourceAt,
             TTL: selectArtists.cacheKeyTtl}
return obj;