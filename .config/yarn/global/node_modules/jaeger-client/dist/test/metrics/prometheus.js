'use strict';

var _chai = require('chai');

var _index = require('../../src/index.js');

// Copyright (c) 2018 Jaeger Author.
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
// in compliance with the License. You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software distributed under the License
// is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
// or implied. See the License for the specific language governing permissions and limitations under
// the License.

function importPromClient() {
  try {
    return require('prom-client');
  } catch (error) {
    console.log("cannot import 'prom-client', skipping tests");
    return null;
  }
}

describe('Prometheus metrics', function () {
  var metrics = void 0;
  var PromClient = void 0;

  before(function () {
    PromClient = importPromClient();
    if (!PromClient) {
      this.skip();
    }
  });

  it('should initialize without namespace', function () {
    metrics = new _index.PrometheusMetricsFactory(PromClient);
    var name = 'jaeger:gauge';

    metrics.createGauge(name).update(1);

    var singleMetric = PromClient.register.getSingleMetric(name).get();
    _chai.assert.equal(singleMetric.type, 'gauge');
    _chai.assert.equal(singleMetric.name, name);
    _chai.assert.equal(singleMetric.values[0].value, 1);
    PromClient.register.clear();
  });

  it('should throw exception when initialized without prom-client object', function () {
    (0, _chai.expect)(function () {
      var fakePromClient = {};
      metrics = new _index.PrometheusMetricsFactory(fakePromClient);
    }).to.throw('prom-client must be provided');
  });
});

describe('Prometheus metrics with namespace', function () {
  var metrics = void 0;
  var PromClient = void 0;
  var namespace = 'test';

  before(function () {
    PromClient = importPromClient();
    if (!PromClient) {
      this.skip();
    }
  });

  beforeEach(function () {
    try {
      metrics = new _index.PrometheusMetricsFactory(PromClient, namespace);
    } catch (e) {
      console.log('beforeEach failed', e);
      console.log(e.stack);
    }
  });

  afterEach(function () {
    PromClient.register.clear();
  });

  it('should increment a counter with a provided value', function () {
    var name = 'jaeger:counter';

    metrics.createCounter(name).increment(1);

    name = namespace + '_' + name;
    var singleMetric = PromClient.register.getSingleMetric(name).get();
    _chai.assert.equal(singleMetric.type, 'counter');
    _chai.assert.equal(singleMetric.name, name);
    _chai.assert.equal(singleMetric.values[0].value, 1);
  });

  it('should increment a tagged counter with a provided value', function () {
    var name = 'jaeger:counter';

    var tags1 = { result: 'ok' };
    var counter1 = metrics.createCounter(name, tags1);
    counter1.increment(1);
    counter1.increment(1);

    var tags2 = { result: 'err' };
    var counter2 = metrics.createCounter(name, tags2);
    counter2.increment(); // increment by 1

    _chai.assert.equal(PromClient.register.getMetricsAsJSON().length, 1);
    name = namespace + '_' + name;
    var singleMetric = PromClient.register.getSingleMetric(name).get();
    _chai.assert.equal(singleMetric.values.length, 2);
    _chai.assert.deepEqual(singleMetric.values[0].labels, tags1);
    _chai.assert.equal(singleMetric.values[0].value, 2);
    _chai.assert.deepEqual(singleMetric.values[1].labels, tags2);
    _chai.assert.equal(singleMetric.values[1].value, 1);
  });

  it('should update counter and gauge', function () {
    metrics.createCounter('jaeger:counter', { result: 'ok' }).increment(1);
    metrics.createCounter('jaeger:counter', { result: 'err' }).increment(1);
    metrics.createGauge('jaeger:gauge', { result: 'ok' }).update(1);
    metrics.createGauge('jaeger:gauge', { result: 'err' }).update(1);
    _chai.assert.equal(PromClient.register.getMetricsAsJSON().length, 2);
  });
});
//# sourceMappingURL=prometheus.js.map