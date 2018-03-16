const chai = require('chai');
const should = chai.should();
const jsc = require('jsverify')


class CoinChanger {

}


describe('CoinChanger', () => {
  const coinChanger = new CoinChanger()
  it('should do magic', () => {
  true.should.eql( false );
});
});


const boolFnAppliedThrice =
  jsc.forall("bool -> bool", "bool", function (f, b) {
    return f(f(f(b))) === f(b);
  });
describe("testing promises", () => {
  it ('generates booleans', () => {
    jsc.assert(boolFnAppliedThrice);

  })

})