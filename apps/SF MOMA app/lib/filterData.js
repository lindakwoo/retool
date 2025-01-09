//  Filter out all artwork with no Constituent ids and then removes duplicate columns (columns that already exist in the artists table)

if (!artists.value.length) {
  attemptToLoadArt.setValue(true)
  return;
}
const hasId = artwork.value.filter(artwork=>artwork.ConstituentID!=="")
const artistsColumns = Object.keys(artists.value[0]);
const artColumns = Object.keys(artwork.value[0]);
//  find duplicate columns
//  add "Artist" because the instructions say also to remove the "Artist" column from the artwork table:
const duplicateColumns = [..._.intersection(artistsColumns, artColumns), "Artist"];

const filtered = hasId.map(artwork=>{
  return {
    ConstituentID: artwork.ConstituentID,
    ..._.omit(artwork, duplicateColumns),
  };
})

attemptToLoadArt.setValue(false)
filteredArtwork.setValue(filtered)


//  Create a mapping of artists (by constituentID) to their artworks (an array of art ObjectIDs): {constituentId: [...ObjectIDs]}
const artistToArtworkMap = {}
artists.value.forEach(artist => {
  artistToArtworkMap[artist.ConstituentID] = [];
});
filtered.forEach(art => {
  const constituentIds = art.ConstituentID.split(',').map(id => id.trim());
  constituentIds.forEach(id => {
    artistToArtworkMap[id].push(art.ObjectID);
  });
});

artistsMap.setValue(artistToArtworkMap)

//  create the array of artists with artwork for the dropdown menu
const withArtwork = []
for(let key in artistToArtworkMap){
  const artist = artists.value.find(artist=>
   artist.ConstituentID===key
  )
  if(artist && artistToArtworkMap[key].length>0){
  withArtwork.push({name:artist.DisplayName, id :artist.ConstituentID})
  }
}

artistsWithArtwork.setValue(withArtwork)

const values = withArtwork.map(artist => `(${artist.id}, '${artist.name.replace("'", "''")}')`).join(", ");
console.log("with artwork", withArtwork)
artistValues.setValue(values);
console.log("values", values)
console.log("values2", artistValues.value)