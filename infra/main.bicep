// add target scope to subscription
targetScope = 'subscription'

// add parameters for name and location that defaults to korea central
param name string
param location string = 'koreacentral'


resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  // add a name with the prefix of 'rg-'
  name: 'rg-${name}'
  location: location
}

module appsvc './resouces.bicep' = {
  name: 'AppService'
  scope: rg
  params: {
    name: name
    location: location
  }
}
