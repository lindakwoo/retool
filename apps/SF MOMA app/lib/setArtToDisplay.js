//  upon selection of artist, set art to display
const selectedArtist = select1.value;
const artObjectIds = artistsMap.value[selectedArtist]||[];
const displayed = 
artObjectIds.length>0?
filteredArtwork.value.filter(art=>artObjectIds.includes(art.ObjectID)):[]
  
artToDisplay.setValue(displayed)