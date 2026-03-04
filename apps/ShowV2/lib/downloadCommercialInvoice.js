const regex = 'filename=(.*).pdf'
const result = queryCommercialInvoice.metadata.headers['content-disposition'][0].match(regex)
console.log(result[1])
utils.downloadFile({base64Binary: queryCommercialInvoice.data.base64Binary}, result[1]+'.pdf')