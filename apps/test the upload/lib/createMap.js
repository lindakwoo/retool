//  This script creates a mapping of artists (by constituentID) to their artworks (an array of art ObjectIds);
const artistToArtworkMap = {}

artists.value.forEach(artist => {
  const artistId = artist.ConstituentID;
  const artistArtworks = filteredArtwork.value.filter(art => {
    const artworkConstituents = art.ConstituentID.split(',').map(id => id.trim());
    return artworkConstituents.includes(artistId);
  });
  if(artistArtworks.length>0){
  artistToArtworkMap[artistId]=artistArtworks.map(art => art.ObjectID)
  }
});


artistsMap.setValue(artistToArtworkMap)