module.exports = {
  cosmosDb: {
    endpoint: process.env.COSMOS_DB_ENDPOINT,
    key: process.env.COSMOS_DB_KEY,
    databaseId: 'billingdb',
    containerId: 'records',
  },
  blob: {
    connectionString: process.env.BLOB_CONN_STRING,
    containerName: 'billing-archive',
  },
};
