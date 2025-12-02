
var curDirectorIds = CurrentSelectedContact.value.miscellaneous.item.directorIds;

//  console.log(curDirectorIds);
//  console.log(directorsIdsFullData.value);
var ipSources = directorsIdsFullData.value.map((o) => o.entityIPSource );
//  console.log('ipSources' , ipSources);
var activeIPSources = directorsIdsFullData.value.filter(item => item.isActive === "Active").map((o) => o.entityIPSource );

//  console.log('activeIPSources' , activeIPSources);
const curDisplayDirectorIds = curDirectorIds.filter(item => {
    const prefix = item.split('_')[0];
    return activeIPSources.includes(prefix);
})
  
const dispIdObj = curDisplayDirectorIds.map((o)=> {
  return {
    source: o.split('_')[0],
    value: o.split('_')[1],
    id: o
  }
});

//  console.log(dispIdObj);

var nonIPDirectorIds = curDirectorIds.filter(item => {
    const prefix = item.split('_')[0];
    return !activeIPSources.includes(prefix);
});

//  console.log('Total Director Ids');
//  console.log(curDirectorIds);
//  console.log('IP Sources');
//  console.log(ipSources);
//  console.log('curDisplayDirectorIds');
//  console.log(curDisplayDirectorIds);

//  console.log('nonIPDirectorIds')
//  console.log(nonIPDirectorIds);

OriginalDisplayDirectorIds.setValue(curDisplayDirectorIds);
DisplayDirectorIds.setValue(dispIdObj);
NonDisplayDirectorIds.setValue(nonIPDirectorIds);

