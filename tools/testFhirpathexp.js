const fhirpath = require('fhirpath')

const fragment = {
  name: "Luke Duncan",
  start:"2012-02-07",
  end: "2012-08-08"
}
//console.log( fhirpath.evaluate( fragment.name, "matches('^[A-Za-z ]*$')" ) )
console.log( fhirpath.evaluate( fragment, "end.toDateTime() <= start.toDateTime() + 6 months" )
 )
