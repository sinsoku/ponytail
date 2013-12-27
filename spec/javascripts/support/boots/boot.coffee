jsApiReporter = undefined
do ->
  jasmineEnv = jasmine.getEnv()

  jsApiReporter = new jasmine.JsApiReporter()
  htmlReporter = new jasmine.HtmlReporter()

  jasmineEnv.addReporter jsApiReporter
  jasmineEnv.addReporter htmlReporter

  jasmineEnv.specFilter = (spec) ->
    htmlReporter.specFilter spec

  jasmineEnv.execute()

@jsApiReporter = jsApiReporter
