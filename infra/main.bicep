param cosmosDbName string = 'billingdb'
param blobContainer string = 'billing-archive'

resource cosmos 'Microsoft.DocumentDB/databaseAccounts@2023-03-15' = {
  name: cosmosDbName
  location: resourceGroup().location
  kind: 'GlobalDocumentDB'
  properties: {
    consistencyPolicy: { defaultConsistencyLevel: 'Session' }
    databaseAccountOfferType: 'Standard'
  }
}

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'billingstorage'
  location: resourceGroup().location
  sku: { name: 'Standard_GRS' }
  kind: 'StorageV2'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  parent: storage::blobServices::default
  name: blobContainer
  properties: { publicAccess: 'None' }
}
