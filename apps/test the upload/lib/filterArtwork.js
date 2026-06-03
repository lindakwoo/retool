//  This function filters out all artwork with no Constituent ids and then removes duplicate columns (columns that already exist in the artists table)

const hasId = artwork.value.filter(artwork=>artwork.ConstituentID!=="")

const artistsColumns = Object.keys(artists.value[0]);
const artColumns = Object.keys(artwork.value[0]);
//  find duplicate columns
//  add "Artist" because the instructions say also to remove the "Artist" column form the artwork table:
const duplicateColumns = [..._.intersection(artistsColumns, artColumns), "Artist"];

const filtered = hasId.map(artwork=>{
  return {
    ConstituentID: artwork.ConstituentID,
    ..._.omit(artwork, duplicateColumns),
  };
})

filteredArtwork.setValue(filtered)