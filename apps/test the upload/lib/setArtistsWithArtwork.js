const withArtwork = []
for(let key in artistsMap.value){
  const artist = artists.value.find(artist=>
   artist.ConstituentID===key
  )

  if(artist){
  withArtwork.push({name:artist.DisplayName, id :artist.ConstituentID})
  }
}

artistsWithArtwork.setValue(withArtwork)