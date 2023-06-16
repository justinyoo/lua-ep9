// add parameters for name and location that defaults to the resource group's location
param name string
param location string = resourceGroup().location

resource asplan 'Microsoft.Web/serverfarms@2021-02-01' = {
  // add a name with the prefix of 'asplan-'
  name: 'asplan-${name}'
  location: location
  kind: 'app'
  // add the sku with standard 1
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
}

resource appsvc 'Microsoft.Web/sites@2021-02-01' = {
  // add a name with prefix of 'appsvc-'
  name: 'appsvc-${name}'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: asplan.id
  }
}
